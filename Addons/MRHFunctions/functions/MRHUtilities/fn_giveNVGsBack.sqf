/*
Function name:MRH_fnc_giveNVGsBack
Author: Mr H.
Description: this function recovers previously removed NVGs and gives them back, assigns them to the nvg slot if they where previously there
Return value: None
Public: Yes
Parameters:
0 - <OBJECT> - Unit to give NVG's back to.
Example(s):
[player] MRH_fnc_giveNVGsBack;
*/
params ["_unit"];
//get all objects from cfgWeapons

_torecover  = _unit getVariable "MRH_SavedPreviousNVGs";
if (isNil "_torecover") ExitWith {};
_inInventory = _torecover select 0;
_inSlot = _torecover select 1;
if !(_inInventory isEqualTo []) then 
{
	{
	_unit addItem _x;
	} forEach _inInventory;
};
if (_inSlot isEqualTo []) ExitWith {};

 _unit linkItem (_inSlot select 0);
