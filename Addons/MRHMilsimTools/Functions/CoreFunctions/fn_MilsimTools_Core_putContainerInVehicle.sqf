/*
Function name:MRH_fnc_MilsimTools_Core_putContainerInVehicle
Author:Larrow, modified by Mr H.
Description: removes vest /uniform from given unit and puts them in the given vehicle, original snippet was published by Larrow on BI forums (https://forums.bohemia.net/forums/topic/168642-drop-uniformvest/) and modified to fit my needs
Return value: 
Public: No
Parameters:
0 - <OBJECT> unit to remove uniform or vest from
1 - <OBJECT> vehcile to put uniform or vest in
3 - <STRING> optional, by default uniform will be used, "VEST" to move vest

Example(s):
[player,somevehicle]call MRH_fnc_MilsimTools_Core_putContainerInVehicle;
or
[player,somevehicle,"VEST"]call MRH_fnc_MilsimTools_Core_putContainerInVehicle;
*/
#include "MRH_C_Path.hpp"
params ["_unit","_vehicle",["_type","UNIFORM"]];

	if (_type == "VEST") then 
	{
		private _container = vest _unit;
		_index = count (everyContainer _vehicle);
		_vehicle addItemCargoGlobal [_container, 1];
		private _droppedContainer = (((everyContainer _vehicle) select _index) select 1);
		{
		_droppedContainer addItemCargoGlobal [_x, 1];
		}forEach (vestItems _unit);
		removeVest _unit;

	}
	else
	{
		private _container = uniform _unit;
		_index = count (everyContainer _vehicle);
		_vehicle addItemCargoGlobal [_container, 1];
		private _droppedContainer = (((everyContainer _vehicle) select _index) select 1);
		{
		_droppedContainer addItemCargoGlobal [_x, 1];
		}forEach (uniformItems _unit);
		removeUniform _unit;
	};




