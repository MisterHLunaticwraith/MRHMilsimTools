/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_parseSettings
Author: Mr H.
Description: reads cba settings post init and converts them to mission namespace variables
Return value:none
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_parseSettings;
*/
#include "MRH_C_Path.hpp"

if(!isServer) ExitWith {};
_availablePlaneTypesBluFor = ["MRH_MilsimTools_InsertionHandler_SupplyPlanesBluFor"] call cba_settings_fnc_get;
_toMissionNameSpaceBluFor = [_availablePlaneTypesBluFor] EFUNC(FireSupport,parseMagazinesList);
missionNamespace setVariable ["MRH_InsertionHandler_AvailVehs"+ "WEST",_toMissionNameSpaceBluFor,true];

_availablePlaneTypesOpFor = ["MRH_MilsimTools_InsertionHandler_SupplyPlanesOpFor"] call cba_settings_fnc_get;
_toMissionNameSpaceOpFor = [_availablePlaneTypesOpFor] EFUNC(FireSupport,parseMagazinesList);
missionNamespace setVariable ["MRH_InsertionHandler_AvailVehs"+ "EAST",_toMissionNameSpaceOpFor,true];

_availablePlaneTypesInde = ["MRH_MilsimTools_InsertionHandler_SupplyPlanesInde"] call cba_settings_fnc_get;
_toMissionNameSpaceInde = [_availablePlaneTypesInde] EFUNC(FireSupport,parseMagazinesList);
missionNamespace setVariable ["MRH_InsertionHandler_AvailVehs"+ "GUER",_toMissionNameSpaceInde,true];