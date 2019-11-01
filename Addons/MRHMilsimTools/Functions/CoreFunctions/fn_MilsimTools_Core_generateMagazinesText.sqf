/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
	params ["_unit",["_items",false],["_weapsAttach",0]];
	private _list =magazines _unit;
	if (_items) then {_list =items _unit;};
	if (_weapsAttach ==1) then {_list =primaryWeaponItems _unit};
	if (_weapsAttach ==2) then {_list =secondaryWeaponItems _unit};
	if (_weapsAttach ==3) then {_list =handgunItems _unit};
	if (_weapsAttach ==4) then {_list =assignedItems _unit};
	private _magUniques = [];
	{
		if !(_x isEqualTo "") then {_magUniques pushBackUnique _x};
		
	}forEach _list;
	private _return = [];
	{
		private _str = _x;
		private _array =[];
		private _data = [_x,false,!_items]FUNC(generateItemText);
		private _count = {_x == _str} count _list;
		_array append [_data,"<font color='#56EF78'> X ",_count,"</font><br/>"];
		_return append _array

	}forEach _magUniques;
	_return = _return joinstring "";
	_return