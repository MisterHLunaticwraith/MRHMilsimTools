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
		private _itemsStart = vestItems _unit;
		_index = count (everyContainer _vehicle);
		_vehicle addItemCargoGlobal [_container, 1];
		private _droppedContainer = (((everyContainer _vehicle) select _index) select 1);
		{
		_droppedContainer addItemCargoGlobal [_x, 1];
		}forEach _itemsStart;
		removeVest _unit;

		private _toTrace = format ["Unit %1,Type %2 %3,moved to container: %4",_unit,_type,_itemsStart, _droppedContainer];
		TRACE(_toTrace);

	}
	else
	{
		private _container = uniform _unit;
		private _itemsStart = uniformItems _unit;
		_index = count (everyContainer _vehicle);
		_vehicle addItemCargoGlobal [_container, 1];
		private _droppedContainer = (((everyContainer _vehicle) select _index) select 1);
		{
		_droppedContainer addItemCargoGlobal [_x, 1];
		}forEach _itemsStart;
		removeUniform _unit;
		
		private _toTrace = format ["Unit %1,Type %2 %3,moved to container: %4",_unit,_type,_itemsStart, _droppedContainer];
		TRACE(_toTrace);
	};




