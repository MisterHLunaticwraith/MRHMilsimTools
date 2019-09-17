/*
Function name:MRH_fnc_MilsimTools_Core_selectHasEnoughCargo
Author: Mr H.
Description: Returns the smallest vehicle with enough wanted cargo space in given list.
/!\ does not count turrets and FFVs seats
Return value: <STRING> classname of the smallest vehcile with enough cargo space in the list
Public: No
Parameters:
0-<ARRAY> of <STRINGS> vehicles classnames
1-<NUMBER> minimum cargo space required

Example(s):
[["B_Heli_Light_01_dynamicLoadout_F","B_Heli_Transport_03_unarmed_F","B_Heli_Attack_01_dynamicLoadout_F","B_Heli_Transport_01_F"],10]call MRH_fnc_MilsimTools_Core_selectHasEnoughCargo;// will return the smallest vehicle with at least 10 cargo places, if it fails it will return the biggest vehicle in the list
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
_vehTypes =[_vehTypes]FUNC(sortVehiclesByCargoSize);
 _array = _vehTypes select {(getNumber (configFile >> "CfgVehicles" >> _x>> "transportSoldier"))>= _cargoSpace};
 if (_array isEqualTo []) exitWith {(_vehTypes select ((count _vehTypes)-1))};
 (_array select 0)