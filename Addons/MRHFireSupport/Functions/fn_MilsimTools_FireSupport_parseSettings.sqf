/*
Function name:MRH_fnc_MilsimTools_FireSupport_parseSettings
Author: Mr H.
Description: Reads cba settings and converts them to public variables stored in missionNamespace
Return value: None
Public:No
Parameters:None
Example(s):
called by cba postInit XEH, only on server
[] call MRH_fnc_MilsimTools_FireSupport_parseSettings

*/
#include "MRH_C_Path.hpp"
//condition treatment 

//--code below is only processed by the server at init
if (!isServer) ExitWith {};
_numberAvailable = ["MRH_MilsimTools_FireSupport_ArtyShots"] call cba_settings_fnc_get;
_numberAvailable = parseNumber _numberAvailable;
//missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableArtilleryShots",_numberAvailable,true];

missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableArtilleryShots" + "EAST",_numberAvailable,true];
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableArtilleryShots" + "WEST",_numberAvailable,true];
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableArtilleryShots" + "GUER",_numberAvailable,true];
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableArtilleryShots" + "CIV",_numberAvailable,true];

_availableMagTypes = ["MRH_MilsimTools_FireSupport_ArtyMagazines"] call cba_settings_fnc_get;
_toMissionNameSpace = [_availableMagTypes] FUNC(parseMagazinesList);
missionNamespace setVariable ["MRH_FireSupport_TypesOfArtyMags",_toMissionNameSpace,true];


//------------- settings to parse for CAS
//MRH_MilsimTools_FireSupport_CASShots

_numberAvailableCAS = ["MRH_MilsimTools_FireSupport_CASShots"] call cba_settings_fnc_get;
_numberAvailableCAS = parseNumber _numberAvailableCAS;


missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableCAS" + "EAST",_numberAvailableCAS,true];
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableCAS" + "WEST",_numberAvailableCAS,true];
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableCAS" + "GUER",_numberAvailableCAS,true];


_availablePlaneTypesBluFor = ["MRH_MilsimTools_FireSupport_CASPlanesBluFor"] call cba_settings_fnc_get;
_toMissionNameSpaceBluFor = [_availablePlaneTypesBluFor] FUNC(parseMagazinesList);
missionNamespace setVariable ["MRH_FireSupport_TypesCASPLANES"+ "WEST",_toMissionNameSpaceBluFor,true];

_availablePlaneTypesOpFor = ["MRH_MilsimTools_FireSupport_CASPlanesOpFor"] call cba_settings_fnc_get;
_toMissionNameSpaceOpFor = [_availablePlaneTypesOpFor] FUNC(parseMagazinesList);
missionNamespace setVariable ["MRH_FireSupport_TypesCASPLANES"+ "EAST",_toMissionNameSpaceOpFor,true];

_availablePlaneTypesInde = ["MRH_MilsimTools_FireSupport_CASPlanesInde"] call cba_settings_fnc_get;
_toMissionNameSpaceInde = [_availablePlaneTypesInde] FUNC(parseMagazinesList);
missionNamespace setVariable ["MRH_FireSupport_TypesCASPLANES"+ "GUER",_toMissionNameSpaceInde,true];

//---------settings to parse for Supply drops
_numberAvailableSP = ["MRH_MilsimTools_FireSupport_NumberOfSuppliesDrops"] call cba_settings_fnc_get;
_numberAvailableSP = parseNumber _numberAvailableSP;


missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableSupplyDrops" + "EAST",_numberAvailableSP,true];
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableSupplyDrops" + "WEST",_numberAvailableSP,true];
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableSupplyDrops" + "GUER",_numberAvailableSP,true];

_availablePlaneTypesBluForSupply = ["MRH_MilsimTools_FireSupport_SupplyPlanesBluFor"] call cba_settings_fnc_get;
_toMissionNameSpaceBluForSupply = [_availablePlaneTypesBluForSupply] FUNC(parseMagazinesList);
missionNamespace setVariable ["MRH_FireSupport_TypesSupportPlanes"+ "WEST",_toMissionNameSpaceBluForSupply,true];

_availablePlaneTypesOpForSupply = ["MRH_MilsimTools_FireSupport_SupplyPlanesOpFor"] call cba_settings_fnc_get;
_toMissionNameSpaceOpForSupply = [_availablePlaneTypesOpForSupply] FUNC(parseMagazinesList);
missionNamespace setVariable ["MRH_FireSupport_TypesSupportPlanes"+ "EAST",_toMissionNameSpaceOpForSupply,true];

_availablePlaneTypesIndeSupply = ["MRH_MilsimTools_FireSupport_SupplyPlanesInde"] call cba_settings_fnc_get;
_toMissionNameSpaceIndeSupply = [_availablePlaneTypesIndeSupply] FUNC(parseMagazinesList);
missionNamespace setVariable ["MRH_FireSupport_TypesSupportPlanes"+ "GUER",_toMissionNameSpaceIndeSupply,true];
//
/* below is temporary: toDo Create supplies settings for all sides, maybe?*/
_availableSupplies = ["MRH_MilsimTools_FireSupport_Supplies_ListOfAvailableSupplies"] call cba_settings_fnc_get;
_toMissionNameSpaceAvailableSupplies = [_availableSupplies] FUNC(parseMagazinesList);
missionNamespace setVariable ["MRH_FireSupport_AvailableSupplyDropsTypes"+ "EAST",_toMissionNameSpaceAvailableSupplies,true];
missionNamespace setVariable ["MRH_FireSupport_AvailableSupplyDropsTypes"+ "WEST",_toMissionNameSpaceAvailableSupplies,true];
missionNamespace setVariable ["MRH_FireSupport_AvailableSupplyDropsTypes"+ "GUER",_toMissionNameSpaceAvailableSupplies,true];
//
_distanceOffSet = ["MRH_MilsimTools_FireSupport_Supplies_DistanceForAircraft"] call cba_settings_fnc_get;
_distanceOffSetParsed = parseNumber _distanceOffSet;
missionNamespace setVariable ["MRH_FireSupport_SupplyDropTravelDistance",_distanceOffSetParsed,true];