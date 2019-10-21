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


params [
		["_module",objNull],
		["_synched",[]],
		["_activated",false]
		];
if (is3DEN) exitWith {};
if !(isServer) exitWith {};

private _type = typeOf _module;

private _sideLetter = (_type splitString "_" select 0);
private _side = str west;
switch (true) do {
	case (_sideLetter== "B") : 
	{
		_side = str west;
	};
	case (_sideLetter== "O") : 
	{
		_side = str east;
	};
	case (_sideLetter== "I") : 
	{
		_side = str independent;
	};
	case (_sideLetter== "C") : 
	{
		_side = str civilian;
	};
};

private _callSign = _module getVariable ["MRH_HQModule_HQName",""];
if (_callSign isEqualTo "") then {_callSign = "HQ"};
private _previous = !((missionNamespace getVariable [("MRH_SoldierTab_HQModule_"+ _side),[]]) isEqualTo []);
missionNamespace setVariable [("MRH_SoldierTab_HQModule_"+ _side),[_callSign,"MRH_virtual_HQ",_module],true];
_module setVariable ["MRH_ST_HQ_Callsign",_callSign,true];
private _toTrace = format ["HQ Module initiated for side %1, module is %2, call sign is %3",_side,_module,_callSign];
if (_previous) then 
{
	systemChat format ["Warning, HQ module was already defined for side %1 only one module can be initiated per side, latest module to initialize will override previous one",_side];
	_toTrace = format ["WARNING: HQ Module initiated for side %1, module is %2, call sign is %3, a module was already set, overriding with current",_side,_module,_callSign];
};
TRACE(_toTrace);
