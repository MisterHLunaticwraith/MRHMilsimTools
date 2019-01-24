/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"
_display = findDisplay 11012019;
_EASTEDIT =  ((_display) displayCtrl 1401);
_WESTEDIT =  ((_display) displayCtrl 1400);
_GUEREDIT =  ((_display) displayCtrl 1402);
_CIVEDIT =  ((_display) displayCtrl 1403);
_NOTIFY =   ((_display) displayCtrl 2800);

_EAST = missionNamespace getVariable 'MRH_MilsimTools_HeliTaxi_simultaneousPerSide_EAST';
_WEST = missionNamespace getVariable 'MRH_MilsimTools_HeliTaxi_simultaneousPerSide_WEST';
_GUER = missionNamespace getVariable 'MRH_MilsimTools_HeliTaxi_simultaneousPerSide_GUER';
_CIV = missionNamespace getVariable 'MRH_MilsimTools_HeliTaxi_simultaneousPerSide_CIV';
_sendMess = cbChecked _NOTIFY;

if (_EAST != (parseNumber ctrlText _EASTEDIT)) then {
missionNamespace setVariable ['MRH_MilsimTools_HeliTaxi_simultaneousPerSide_EAST',parseNumber ctrlText _EASTEDIT,true];
	_message = format [localize "STR_MRH_MRHMRHZeusModules_ZEUSGRANTEDHELISMESS",(parseNumber ctrlText _EASTEDIT)];
	if (_sendMess) then {[East,_message,"MRH_Zeus_Notif"]  call MRH_fnc_MilsimTools_Core_notifySide;};
};

if (_WEST != (parseNumber ctrlText _WESTEDIT)) then {
missionNamespace setVariable ['MRH_MilsimTools_HeliTaxi_simultaneousPerSide_WEST',parseNumber ctrlText _WESTEDIT,true];
	_message = format [localize "STR_MRH_MRHMRHZeusModules_ZEUSGRANTEDHELISMESS",(parseNumber ctrlText _WESTEDIT)];
	if (_sendMess) then {[West,_message,"MRH_Zeus_Notif"]  call MRH_fnc_MilsimTools_Core_notifySide;};
};

if (_GUER != (parseNumber ctrlText _GUEREDIT)) then {
missionNamespace setVariable ['MRH_MilsimTools_HeliTaxi_simultaneousPerSide_GUER',parseNumber ctrlText _GUEREDIT,true];
	_message = format [localize "STR_MRH_MRHMRHZeusModules_ZEUSGRANTEDHELISMESS",(parseNumber ctrlText _GUEREDIT)];
	if (_sendMess) then {[Resistance,_message,"MRH_Zeus_Notif"]  call MRH_fnc_MilsimTools_Core_notifySide;};
};

if (_CIV != (parseNumber ctrlText _CIVEDIT)) then {
missionNamespace setVariable ['MRH_MilsimTools_HeliTaxi_simultaneousPerSide_CIV',parseNumber ctrlText _CIVEDIT,true];
	_message = format [localize "STR_MRH_MRHMRHZeusModules_ZEUSGRANTEDHELISMESS",(parseNumber ctrlText _CIVEDIT)];
	if (_sendMess) then {[Civilian,_message,"MRH_Zeus_Notif"]  call MRH_fnc_MilsimTools_Core_notifySide;};
};

closeDialog 0;