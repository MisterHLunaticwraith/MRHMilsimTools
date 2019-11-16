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
params["_unit",["_container","UNIFORM"]];
	_container = toUpper _container;
	private ["_part","_loadPart"];
	switch	_container do 
	{
		case "UNIFORM" :{_part = uniform _unit;_loadPart = loadUniform _unit};
		case "VEST" :{_part = vest _unit;_loadPart = loadVest _unit};
		case "BACKPACK" :{_part = vest _unit;_loadPart = loadVest _unit};
	};
	private _maxLoad= getContainerMaxLoad _part;
	private _weight = _maxLoad * _loadPart;
	[_weight,_maxLoad]