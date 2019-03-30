/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call ;
*/
#include "MRH_C_Path.hpp"
params ["_trigger"];
if !(isServer) exitWith {};

_data = _trigger getVariable 'MRH_Strigger_SurrenderData';
_unit = _data select 0;
if (!alive _unit) exitWith {diag_log format ['MRH_surrender_function: unable to trigger because unit %1 was dead',_unit];_logic = _trigger getVariable ["MRH_MilsimTools_ZeusModules_SURRENDER_AssociatedLogic",objNull];
	deleteVehicle _logic; deleteVehicle _trigger;};
_message = _data select 1;
_code = _data select 2;
_diameter = _data select 3;
_chances = _data select 4;
if !([_chances]CFUNC(testPercentageOdds)) exitWith {_logic = _trigger getVariable ["MRH_MilsimTools_ZeusModules_SURRENDER_AssociatedLogic",objNull];
	deleteVehicle _logic; deleteVehicle _trigger;};

[[_unit],{
	params ["_unit"];
_unit setCaptive true;
_unit playMove 'ApanPknlMstpSnonWnonDnon_G03';
}] remoteExec ["Call",_unit];

//if !(hasInterface) exitWith {}; //no need to happen on the server



[[_unit,_message,5,_diameter,_code,[],'MRH_VOICE_Surrender'],MRH_fnc_ambientConversation] remoteExec ["Call",[0,-2]select isDedicated];
//add a little delay to be sure the statement executes everywhere before deleting the trigger
[{_logic = (_this select 0) getVariable ["MRH_MilsimTools_ZeusModules_SURRENDER_AssociatedLogic",objNull];
	deleteVehicle _logic; deleteVehicle (_this select 0)}, [_trigger], 5] call CBA_fnc_waitAndExecute;