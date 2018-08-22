/*
Function name:MRH_fnc_MilsimTools_FireSupport_startSupplyDrop
Author: Mr H.
Description: Applies parameters from interface and spawns drop function on the server
Return value: None
Public:No
Parameters:None
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_startSupplyDrop;

*/
#include "MRH_C_Path.hpp"
_vehicle = lbData [2100,lbcursel 2100];
_toDrop = lbData [2101,lbcursel 2101];
//
_ctrl = FDIS(1400);
_requestedPos = ctrlText 1400;
_isValid = [_requestedPos] FUNC(checkGridValidity);
if !(_isValid) ExitWith {systemChat format [localize "STR_MRH_FireSupport_SC_Bad_coord",_requestedPos];};
//
_availability = missionNamespace getVariable ["MRH_FireSupport_isAvailableSUPPLYfor_"+ (str side player),true];
if !(_availability) ExitWith {systemChat localize "STR_MRH_FireSupport_SC_SupAlreadyInAction"};
_availableSD = missionNamespace getVariable ["MRH_FireSupport_NumberOfAvailableSupplyDrops" + (str side player),10]; //temporary do 0 after settings
//
if (_availableSD < 1) ExitWith {systemchat localize "STR_MRH_FireSupport_SC_NoRemainingSupplyDrops"};
_leftSDNew = _availableSD - 1;
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableSupplyDrops" + (str side player),_leftSDNew,true];
missionNamespace setVariable ["MRH_FireSupport_isAvailableSUPPLYfor_"+ (str side player),false,true];

_requestedPos = ctrlText 1400;
player setVariable ["MRH_FireSupport_PreviouslyEnteredGridRefSUPPLY",_requestedPos];
_requestedPosFormated = [_requestedPos] FUNC(ParseCoordinates);

closeDialog 0;
//
if (_toDrop == "MRH_SupplyCrate_special") then {
_numberOfMags = missionNamespace getVariable ["MRH_FireSupport_SupplyAmmoCrateNumberOfMags",15];
_toDrop = [_numberOfMags,side player,[0,0,0]] call MRH_fnc_MilsimTools_FireSupport_createAmmoBox;
};

_distanceOffset = missionNamespace getVariable ["MRH_FireSupport_SupplyDropTravelDistance",2000];
[[_vehicle,_requestedPosFormated,_toDrop,side player,_distanceOffset,player],MRH_fnc_MilsimTools_FireSupport_dropSupplies] RemoteExec ["Spawn",2];