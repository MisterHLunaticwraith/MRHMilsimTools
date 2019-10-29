/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_;
*/
#include "MRH_C_Path.hpp"

params ["_remoteCtrl","_unit"];

_remoteCtrl setVariable ["MRH_BriefingApp_isCtrldBy",_unit,true];
hint (localize "STR_MRH_ST_hintConnectedSystemBriefing");
["MRH_DT_computerBip",_remoteCtrl] CFUNC(playSound3D);
_unit setVariable ["MRH_isConnectedToRemoteCtrl",_remoteCtrl];
[
    {
		params ["_remoteCtrl","_unit"];
		(((_unit distance _remoteCtrl)>4) || (!alive _unit) || (!alive _remoteCtrl) || !((_remoteCtrl getVariable ["MRH_BriefingApp_isCtrldBy",objNull]) isEqualTo _unit) || !("MRH_SoldierTab" in (items _unit)))
	}, 
    {
		params ["_remoteCtrl","_unit"];
		hint (localize "STR_MRH_ST_hintBriefSystemDisco");
		["MRH_DT_computerBip",_remoteCtrl] CFUNC(playSound3D);
		_unit setVariable ["MRH_isConnectedToRemoteCtrl",objNull];
		//toDo playsound
	}, 
    _this
] call CBA_fnc_waitUntilAndExecute;