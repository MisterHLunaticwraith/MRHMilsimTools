/*
Function name:MRH_fnc_MilsimTools_Core_sortVehiclesObjectsByCargoSize
Author: Mr H.
Description: Sorts array of vehicles classnames and orders it by cargo space from smallest to biggest
/!\ does not count turrets and FFVs seats
Return value: <ARRAY> of<OBJECTS> vehicles classnames ordered by cargo space from smallest to biggest
Public: No
Parameters:
0-<ARRAY> of<OBJECTS> vehicles classnames
Example(s):
[[mycar1,myTruck,mycar2,myAtv]]call MRH_fnc_MilsimTools_Core_sortVehiclesObjectsByCargoSize;
*/
#include "MRH_C_Path.hpp"

params [
			[
				"_vehTypes",[],[[]]
			]
		];


	_byCargoSize= [_vehTypes, [], {getNumber (configFile >> "CfgVehicles" >>typeOf _x>> "transportSoldier")}, "ASCEND"] call BIS_fnc_sortBy;
	_byCargoSize