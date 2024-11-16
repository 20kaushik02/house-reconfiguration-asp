legacyConfig(person(1)).
legacyConfig(person(2)).
legacyConfig(thing(3)).
legacyConfig(thing(4)).
legacyConfig(thing(5)).
legacyConfig(thing(6)).
legacyConfig(thing(7)).
legacyConfig(thing(8)).
legacyConfig(personTOthing(1,3)).
legacyConfig(personTOthing(1,4)).
legacyConfig(personTOthing(1,5)).
legacyConfig(personTOthing(1,6)).
legacyConfig(personTOthing(1,7)).
legacyConfig(personTOthing(2,8)).

cabinetDomainNew(9..14).
roomDomainNew(15..20).

cabinetHighCost(1).
cabinetSmallCost(1).
roomCost(1).

% example solution:
%cabinetTOthing(9,3). cabinetTOthing(9,4). cabinetTOthing(9,5). cabinetTOthing(9,6). cabinetTOthing(9,7). cabinetTOthing(10,8). roomTOcabinet(15,9). roomTOcabinet(16,10).