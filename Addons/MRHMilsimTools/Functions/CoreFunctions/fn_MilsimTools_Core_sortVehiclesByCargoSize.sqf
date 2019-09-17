/*
Function name:MRH_fnc_MilsimTools_Core_sortVehiclesByCargoSize
Author: Mr H.
Description: Sorts array of vehicles classnames and orders it by cargo space from smallest to biggest
/!\ does not count turrets and FFVs seats
Return value: <ARRAY> of<STRINGS> vehicles classnames ordered by cargo space from smallest to biggest
Public: No
Parameters:
0-<ARRAY> of<STRINGS> vehicles classnames
Example(s):
[["B_Heli_Light_01_dynamicLoadout_F","B_Heli_Transport_03_unarmed_F","B_Heli_Attack_01_dynamicLoadout_F","B_Heli_Transport_01_F"]]call MRH_fnc_MilsimTools_Core_sortVehiclesByCargoSize;
*/
#include "MRH_C_Path.hpp"

params [
			[
				"_vehTypes",[],[[]]
			]
		];


	_byCargoSize= [_vehTypes, [], {getNumber (configFile >> "CfgVehicles" >> _x>> "transportSoldier")}, "ASCEND"] call BIS_fnc_sortBy;
	_byCargoSize