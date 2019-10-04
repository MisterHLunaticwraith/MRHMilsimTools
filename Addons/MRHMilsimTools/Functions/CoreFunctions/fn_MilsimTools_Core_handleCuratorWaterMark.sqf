/*
Function name:MRH_fnc_MilsimTools_Core_handleCuratorWaterMark
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_handleCuratorWaterMark;
*/
#include "MRH_C_Path.hpp"
params ["_ctrl"];
if !(hasInterface) exitWith {};

private _img = "\MRHMilsimTools\milsimtoolsIco.paa";
private _setting = ["MRH_MilsimTools_Zeus_waterMark"] call cba_settings_fnc_get;
if (_setting isEqualTo "UseVanilla") exitWith {};
switch (true) do {
	case (_setting== "UseMilsimTools") : 
	{
		_img = _img;
	};
	case (_setting== "UseSquadXml") : 
	{
		if ((squadParams player) isEqualTo []) 
		then {_img = _img} 
		else 
		{
		_img =  (((squadParams player) select 0) select 4);
		};
	};
	case (_setting== "UseCustom") : 
	{
		_img = ["MRH_MilsimTools_Zeus_waterMarkCustomImg"] call cba_settings_fnc_get;
	};
};
private _hide = ["MRH_MilsimTools_Zeus_hideWaterMark"] call cba_settings_fnc_get;
if (_hide) then {_img =""};
_ctrl ctrlSetText _img;
_ctrl ctrlCommit 0;

//to override Achilles need to add delay leave 1 s recall func
if (isClass (configfile >> "CfgPatches" >> "achilles_ui_f")) then {
	[
		{
			_this FUNC(handleCuratorWaterMark);
		}, 
		_this, 
		1
	] call CBA_fnc_waitAndExecute;
};