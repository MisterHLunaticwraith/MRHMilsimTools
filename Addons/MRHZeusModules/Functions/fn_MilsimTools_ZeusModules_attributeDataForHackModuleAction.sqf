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
//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
_display = findDisplay 200119;
(_display getVariable ["MRH_ZeusModules_displayparams",[objNull,objNull]]) params ["_logic","_unit"];
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_CREATECOMBO = CTRLF(2100);
_HACKTIME = CTRLF(1400);
_HACKWEIGHT =CTRLF(1401);
_duration = parseNumber (ctrlText _HACKTIME);
_weight = parseNumber  (ctrlText _HACKWEIGHT);
_allDataToAddData = [200119,1500] FUNC(allListBoxData);
_allPicsToAddData = [200119,1501] FUNC(allListBoxData);

if ((_allDataToAddData isEqualTo []) && (_allPicsToAddData isEqualTo [])) exitWith {[objNull,localize "STR_MRH_MRHMRHZeusModules_ERRORNODATAORPIC"] call BIS_fnc_showCuratorFeedbackMessage;};
if (isNull _unit) then {
	_unit = (_CREATECOMBO lbData (lbCurSel _CREATECOMBO)) createVehicle (position _logic);
	[[_unit]]CFUNC(addObjectsToCurators);
	};

[[_unit,_duration,_weight,_allDataToAddData,_allPicsToAddData],MRH_fnc_hackDownloadAndCollectData] remoteExec ["Call",[0,-2] select isDedicated,true];

_receiverName = getText (configFile>>"cfgVehicles">>typeOf _unit >>"displayName");

_message = format [localize "STR_MRH_MRHMRHZeusModules_DATAATTOMESS",_receiverName];
[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
closeDialog 0;