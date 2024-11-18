% each thing must be placed in exactly one cabinet
1 { cabinetTOthing(C, T) : cabinetDomain(C) } 1 :- thing(T).

% no cabinet should contain more than 5 things
:- 6 {cabinetTOthing(C, T) : thing(T)}, cabinetDomain(C).

% each cabinet must be placed in exactly one room
1 { roomTOcabinet(R, C) : room(R) } 1 :- cabinetDomain(C).

% a room can hold at most 4 cabinets
:- 5 {roomTOcabinet(R, C) : cabinetDomain(C)}, room(R).

% only one owner per room
personTOroom(P, R) :- personTOthing(P, T), cabinetTOthing(C, T), roomTOcabinet(R, C).

% one room per person
:- personTOroom(P1, R), personTOroom(P2, R), P1 != P2.

% things of one person cannot be placed in a cabinet together with things of another person
:- cabinetTOthing(X,Y1), cabinetTOthing(X,Y2), personTOthing(P1,Y1), personTOthing(P2,Y2), P1!= P2.

#show cabinetTOthing/2.
#show roomTOcabinet/2.
#show cabinet/1.
#show room/1.
