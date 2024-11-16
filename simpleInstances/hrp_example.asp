legacyConfig(person(1)).
legacyConfig(person(2)).
legacyConfig(thing(3)).
legacyConfig(thing(4)).
legacyConfig(thing(5)).
legacyConfig(thing(6)).
legacyConfig(thing(7)).
legacyConfig(thing(8)).
legacyConfig(thing(21)).
legacyConfig(personTOthing(1,3)).
legacyConfig(personTOthing(1,4)).
legacyConfig(personTOthing(1,5)).
legacyConfig(personTOthing(1,6)).
legacyConfig(personTOthing(1,7)).
legacyConfig(personTOthing(1,21)).
legacyConfig(personTOthing(2,8)).

legacyConfig(room(15)).
legacyConfig(roomTOcabinet(15,9)).

legacyConfig(room(16)).
legacyConfig(roomTOcabinet(16,10)).

legacyConfig(cabinet(9)).
legacyConfig(cabinetTOthing(9,3)).
legacyConfig(cabinetTOthing(9,4)).
legacyConfig(cabinetTOthing(9,5)).
legacyConfig(cabinetTOthing(9,6)).
legacyConfig(cabinetTOthing(9,7)).

legacyConfig(cabinet(10)).
legacyConfig(cabinetTOthing(10,8)).

thingLong(3).
thingLong(8).
thingLong(21).

cabinetDomainNew(22..23).
roomDomainNew(17..20).

% reuse costs
reuseCabinetTOthingCost(0).
reuseRoomTOcabinetCost(0).
reusePersonTOroomCost(0).
reuseCabinetAsHighCost(3).
reuseCabinetAsSmallCost(0).
reuseRoomCost(0).
% remove costs
removeCabinetTOthingCost(2).
removeRoomTOcabinetCost(2).
removePersonTOroomCost(2).
removeCabinetCost(2).
removeRoomCost(2).
% create costs
cabinetHighCost(100).
cabinetSmallCost(10).
roomCost(5).

% example solution:
%cabinet(9). cabinet(10). cabinet(22). room(15). room(16). cabinetTOthing(9,3). cabinetTOthing(9,4). cabinetTOthing(9,6). cabinetTOthing(9,7). cabinetTOthing(10,8). cabinetTOthing(9,21). cabinetTOthing(22,5). roomTOcabinet(15,9). roomTOcabinet(16,10). roomTOcabinet(15,22). cabinetHigh(9). cabinetHigh(10). cabinetSmall(22).
