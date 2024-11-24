%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%      House Reconfiguration Problem      %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%
% given element domains

person(P) :- legacyConfig(person(P)).

% HCP - only short
thing(T) :- legacyConfig(thing(T)).
% HRP - short and long
thing(T) :- thingLong(T).
thing(T) :- thingShort(T).
thingShort(T) :- legacyConfig(thing(T)), not thingLong(T).
% a thing can't be long AND short
:- thingLong(T), thingShort(T).

cabinetDomain(C) :- legacyConfig(cabinet(C)).
cabinetDomain(C) :- cabinetDomainNew(C).

roomDomain(R) :- legacyConfig(room(R)).
roomDomain(R) :- roomDomainNew(R).

%%%%%%%%%%%%%%%%%%%
% mappings

% each thing is owned by a single person
personTOthing(P, T) :- legacyConfig(personTOthing(P, T)).

% each thing is stored in a single cabinet
1 { cabinetTOthing(C, T) : cabinetDomain(C) } 1 :- thing(T).
cabinetTOthing(C, T) :- legacyConfig(cabinetTOthing(C, T)).

% each cabinet is located in a single room
1 { roomTOcabinet(R, C) : roomDomain(R) } 1 :- cabinet(C).
roomTOcabinet(R, C) :- legacyConfig(roomTOcabinet(R, C)).

% each room belongs to a single person, who owns things stored in cabinets that are located in that room
personTOroom(P, R) :- personTOthing(P, T), cabinetTOthing(C, T), roomTOcabinet(R, C).

%%%%%%%%%%%%%%%%%%%
% derived solution domains

cabinet(C) :- cabinetTOthing(C, T).
cabinet(C) :- roomTOcabinet(R, C).

% cabinet subtypes
1 { cabinetSmall(C); cabinetHigh(C) } 1 :- cabinet(C).
% long things can only be stored in high cabinets
% :- thingLong(T), cabinetTOthing(C, T), cabinetSmall(C).
cabinetHigh(C) :- thingLong(T), cabinetTOthing(C, T).

room(R) :- roomTOcabinet(R, C).
room(R) :- personTOroom(P, R).

% consistent ordering for symmetry breaking
cabinet(C1) :- cabinetDomainNew(C1), cabinetDomainNew(C2), cabinet(C2), C1 < C2.
room(R1) :- roomDomainNew(R1), roomDomainNew(R2), room(R2), R1 < R2.

%%%%%%%%%%%%%%%%%%%
% constraints

% no shared ownership of things or rooms
:- personTOthing(P1, T), personTOthing(P2, T), P1 != P2.
:- personTOroom(P1, R), personTOroom(P2, R), P1 != P2.

% no multi-tenancy in the same cabinet either
:- cabinetTOthing(C, T1), cabinetTOthing(C, T2), personTOthing(P1, T1), personTOthing(P2, T2), P1 != P2.

% a cabinet can contain at most 5 things
:- 6 { cabinetTOthing(C, T) : thing(T) }, cabinet(C).
% a room can contain at most 4 cabinets
:- 5 { roomTOcabinet(R, C) : cabinetDomain(C)}, room(R).

% high cabinets take 2 slots, small cabinets take 1 slot
cabinetSize(C, 1) :- cabinetSmall(C).
cabinetSize(C, 2) :- cabinetHigh(C).
roomSlotUsage(R, C, S) :- roomTOcabinet(R, C), cabinetSize(C, S).
:- #sum { S, C : roomSlotUsage(R, C, S) } > 4, room(R).

%%%%%%%%%%%%%%%%%%%
% reconfiguration 

% legacy -> solution === reuse or delete elements
1 { reuse(room(R)); delete(room(R)) } 1 :- legacyConfig(room(R)).
1 { reuse(cabinetHigh(C)); reuse(cabinetSmall(C)); delete(cabinet(C)) } 1 :- legacyConfig(cabinet(C)).
1 { reuse(personTOroom(P, R)); delete(personTOroom(P, R)) } 1 :- legacyConfig(personTOroom(P, R)).
1 { reuse(roomTOcabinet(R, C)); delete(roomTOcabinet(R, C)) } 1 :- legacyConfig(roomTOcabinet(R, C)).
1 { reuse(cabinetTOthing(C, T)); delete(cabinetTOthing(C, T)) } 1 :- legacyConfig(cabinetTOthing(C, T)).

% reused elements are a part of the solution
room(R) :- reuse(room(R)).
cabinetHigh(C) :- reuse(cabinetHigh(C)).
cabinetSmall(C) :- reuse(cabinetSmall(C)).
personTOroom(P, R) :- reuse(personTOroom(P, R)).
roomTOcabinet(R, C) :- reuse(roomTOcabinet(R, C)).
cabinetTOthing(C, T) :- reuse(cabinetTOthing(C, T)).

% deleted elements are not a part of the solution
:- room(R), delete(room(R)).
:- cabinet(C), delete(cabinet(C)).
:- personTOroom(P, R), delete(personTOroom(P, R)).
:- roomTOcabinet(R, C), delete(roomTOcabinet(R, C)).
:- cabinetTOthing(C, T), delete(cabinetTOthing(C, T)).

%%%%%%%%%%%%%%%%%%%
% costs

% creating cabinets and rooms
cost(create(room(R)), W) :- room(R), roomCost(W), roomDomainNew(R).
cost(create(cabinetHigh(C)), W) :- cabinetHigh(C), cabinetHighCost(W), cabinetDomainNew(C).
cost(create(cabinetSmall(C)), W) :- cabinetSmall(C), cabinetSmallCost(W), cabinetDomainNew(C).

% reusing
cost(reuse(room(R)), W) :- reuse(room(R)), reuseRoomCost(W).
cost(reuse(cabinetHigh(C)), W) :- reuse(cabinetHigh(C)), reuseCabinetAsHighCost(W).
cost(reuse(cabinetSmall(C)), W) :- reuse(cabinetSmall(C)), reuseCabinetAsSmallCost(W).
cost(reuse(personTOroom(P, R)), W) :- reuse(personTOroom(P, R)), reusePersonTOroomCost(W).
cost(reuse(roomTOcabinet(R, C)), W) :- reuse(roomTOcabinet(R, C)), reuseRoomTOcabinetCost(W).
cost(reuse(cabinetTOthing(C, T)), W) :- reuse(cabinetTOthing(C, T)), reuseCabinetTOthingCost(W).

% deleting
cost(delete(room(R)), W) :- delete(room(R)), removeRoomCost(W).
cost(delete(cabinet(C)), W) :- delete(cabinet(C)), removeCabinetCost(W).
cost(delete(personTOroom(P, R)), W) :- delete(personTOroom(P, R)), removePersonTOroomCost(W).
cost(delete(roomTOcabinet(R, C)), W) :- delete(roomTOcabinet(R, C)), removeRoomTOcabinetCost(W).
cost(delete(cabinetTOthing(C, T)), W) :- delete(cabinetTOthing(C, T)), removeCabinetTOthingCost(W).

% OPTIMIZATION
#minimize { W, X: cost(X, W) }.

% OUTPUT PREDICATES
#show cabinetHigh/1.
#show cabinetSmall/1.
#show room/1.
#show cabinetTOthing/2.
#show roomTOcabinet/2.
#show personTOroom/2.