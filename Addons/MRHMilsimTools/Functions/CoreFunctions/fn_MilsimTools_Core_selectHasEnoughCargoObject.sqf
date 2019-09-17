/*
Function name:MRH_fnc_MilsimTools_Core_selectHasEnoughCargoObject
Author: Mr H.
Description: Returns the smallest vehicle with enough wanted cargo space in given list.
/!\ does not count turrets and FFVs seats
Return value: <OBJECT> smallest vehicle with enough cargo space in the list
Public: No
Parameters:
0-<ARRAY> of <OBJECTS> vehicles classnames
1-<NUMBER> minimum cargo space required

Example(s):
[[mycar1,myTruck,mycar2,myAtv],10]call MRH_fnc_MilsimTools_Core_selectHasEnoughCargoObject;// will return the smallest vehicle with at least 10 cargo places, if it fails it will return the biggest vehicle in the list
*/
#include "MRH_C_Path.hpp"
params [
			[
				"_vehTypes",[],[[]]
			],
			[
				"_cargoSpace",1,[0]
			]
		];
_vehTypes =[_vehTypes]FUNC(sortVehiclesObjectsByCargoSize);
 _array = _vehTypes select {(getNumber (configFile >> "CfgVehicles" >> typeOf _x>> "transportSoldier"))>= _cargoSpace};
 if (_array isEqualTo []) exitWith {(_vehTypes select ((count _vehTypes)-1))};
 (_array select 0)