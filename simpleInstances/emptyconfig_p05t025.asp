legacyConfig(person(1)).
legacyConfig(person(2)).
legacyConfig(person(3)).
legacyConfig(person(4)).
legacyConfig(person(5)).
legacyConfig(thing(12)).
thingShort(12).
legacyConfig(thing(13)).
thingShort(13).
legacyConfig(thing(14)).
thingShort(14).
legacyConfig(thing(15)).
thingShort(15).
legacyConfig(thing(16)).
thingShort(16).
legacyConfig(thing(17)).
thingShort(17).
legacyConfig(thing(18)).
thingShort(18).
legacyConfig(thing(19)).
thingShort(19).
legacyConfig(thing(20)).
thingShort(20).
legacyConfig(thing(21)).
thingShort(21).
legacyConfig(thing(22)).
thingShort(22).
legacyConfig(thing(23)).
thingShort(23).
legacyConfig(thing(24)).
thingShort(24).
legacyConfig(thing(25)).
thingShort(25).
legacyConfig(thing(26)).
thingShort(26).
legacyConfig(thing(27)).
thingShort(27).
legacyConfig(thing(28)).
thingShort(28).
legacyConfig(thing(6)).
thingShort(6).
legacyConfig(thing(29)).
thingShort(29).
legacyConfig(thing(30)).
thingShort(30).
legacyConfig(thing(7)).
thingShort(7).
legacyConfig(thing(8)).
thingShort(8).
legacyConfig(thing(9)).
thingShort(9).
legacyConfig(thing(10)).
thingShort(10).
legacyConfig(thing(11)).
thingShort(11).
legacyConfig(personTOthing(1,6)).
legacyConfig(personTOthing(1,7)).
legacyConfig(personTOthing(1,8)).
legacyConfig(personTOthing(1,9)).
legacyConfig(personTOthing(1,10)).
legacyConfig(personTOthing(2,11)).
legacyConfig(personTOthing(2,12)).
legacyConfig(personTOthing(2,13)).
legacyConfig(personTOthing(2,14)).
legacyConfig(personTOthing(2,15)).
legacyConfig(personTOthing(3,16)).
legacyConfig(personTOthing(3,17)).
legacyConfig(personTOthing(3,18)).
legacyConfig(personTOthing(3,19)).
legacyConfig(personTOthing(3,20)).
legacyConfig(personTOthing(4,21)).
legacyConfig(personTOthing(4,22)).
legacyConfig(personTOthing(4,23)).
legacyConfig(personTOthing(4,24)).
legacyConfig(personTOthing(4,25)).
legacyConfig(personTOthing(5,26)).
legacyConfig(personTOthing(5,27)).
legacyConfig(personTOthing(5,28)).
legacyConfig(personTOthing(5,29)).
legacyConfig(personTOthing(5,30)).
% domains
cabinetDomainNew(500..524).
roomDomainNew(1000..1024).
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
cabinetSmallCost(1).
roomCost(5).
