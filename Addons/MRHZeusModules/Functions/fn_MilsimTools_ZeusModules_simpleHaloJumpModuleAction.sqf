/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
*/
#include "MRH_C_Path.hpp"

_display =findDisplay 170119;
_logic = _display getVariable ["MRH_ZeusModules_AssociatedLogic",objNull];
if (isNull _logic) exitWith {diag_log "MRH_MilsimTools_ZeusModules_SimpleHalo Error: nologic";};
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_PLAYERLIST = CTRLF(1500);
_INCLUDEGRP =CTRLF(2800);
_AUTOADDGEAR =CTRLF(2801);
_STARTALTITUDE =CTRLF(1400);
_PLAYERAADFORCE = CTRLF(2802);
_PLAYERAADALTITUDE=CTRLF(1401);
_ONBOARDITEMS =CTRLF(1501);

_OBJECTSAADFORCE =CTRLF(2803);
_OBJECTSAADALT =CTRLF(1402);

//get params and pass them to the drop Function
_dropPos = (getPos _logic) vectorAdd [0,0,parseNumber ctrltext _STARTALTITUDE];

_player = objNull;
{if (str _x == lbData [1500,(lbCursel 1500)]) then {_player =_x}} forEach playableUnits;
if (isNull _player) exitWith {[objNull, localize "STR_MRH_MRHMRHZeusModules_ERRORNOPLAYSEL"] call BIS_fnc_showCuratorFeedbackMessage;};

_UnitsToParachute = [_player];
if (cbChecked _INCLUDEGRP) then {_UnitsToParachute = units _player};


_gearToParachute = [];
for "_i" from 0 to ((lbsize _ONBOARDITEMS)-1) do
{
	if (_i == -1) exitWith {};
	_gearString = _ONBOARDITEMS lbData _i;
	_gearActual = [_gearString]CFUNC(findObjectFromString);
	_gearToParachute pushBackUnique _gearActual;
};
_autoEquipUnits = cbChecked _AUTOADDGEAR;
_forceUnitsAAD = cbChecked _PLAYERAADFORCE;
_unitsAADSetting = ctrlText _PLAYERAADALTITUDE;
_forceGearAAD = cbChecked _OBJECTSAADFORCE;
_gearAADAltitude = ctrlText _OBJECTSAADALT;
//_x apply {private _index = (allMissionObjects "All") find str _x; private _object = (allMissionObjects "All") select _index}


[[_dropPos,_UnitsToParachute,_gearToParachute,_autoEquipUnits,_forceUnitsAAD,_unitsAADSetting,_forceGearAAD,_gearAADAltitude],MRH_fnc_MilsimTools_ZeusModules_startHaloJump] RemoteExec ["Call",2];
closeDialog 0;
