/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_setForSurrenderModuleAction;
*/
#include "MRH_C_Path.hpp"
//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
_display = findDisplay 250119;
(_display getVariable "MRH_ZeusModules_displayparams")params ["_logic","_unit"];
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_CTRLODDS = CTRLF(1401);
_CTRLDIST = CTRLF(1400);
_CTRLMESSAGE = CTRLF(1402);

_odds = parseNumber (ctrlText _CTRLODDS);
_dist = parseNumber (ctrlText _CTRLDIST);
_message = ctrlText _CTRLMESSAGE;

_trigger = [_unit,_dist,_message, {},_odds] call MRH_fnc_VipSurrender;

/*
_activation = triggerActivation _trigger;
_statements = triggerStatements _trigger;
[[_trigger,_activation,_statements],{params ["_trigger","_activation","_statements"]; _trigger setTriggerActivation _activation; _trigger setTriggerStatements _statements;}] remoteExec ["Call",0,true];
*/
_trigger setVariable ["MRH_MilsimTools_ZeusModules_SURRENDER_AssociatedLogic",_logic,true];
_logic setVariable ["MRH_MilsimTools_ZeusModules_SURRENDER_AssociatedTrigger",_trigger,true];
_unit setVariable ["MRH_MilsimTools_ZeusModules_SURRENDER_AssociatedTriggerAndLogic",[_trigger,_logic],true];

_logic addEventHandler ["Deleted", {
	params ["_entity"];
	_trigger = _entity getVariable ["MRH_MilsimTools_ZeusModules_SURRENDER_AssociatedTrigger",objNull];
	deleteVehicle _trigger;
	
}];


_unit addEventHandler ["Killed",{
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_both= _unit getVariable ["MRH_MilsimTools_ZeusModules_SURRENDER_AssociatedTriggerAndLogic",[objNull,objNull]];
	{deleteVehicle _x} forEach _both;

}];
closedialog 0;