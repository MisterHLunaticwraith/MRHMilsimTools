/*
Function name:MRH_fnc_MilsimTools_Core_paraRestoreBackPack
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[player]spawn MRH_fnc_MilsimTools_Core_paraRestoreBackPack;
*/
#include "MRH_C_Path.hpp"


[
	{((getPosATL (_this select 0)) select 2)>5},
	{
		[
			{isTouchingGround (_this select 0)},
			{
				params ["_unit"];
				[
				 {
					_gwh = "Weapon_Empty" createVehicle position _this; 
					_this action ["DropBag", _gwh, typeOf unitBackpack _this]; 
				 },
				 _unit,
				 1	
				] call CBA_fnc_waitAndExecute;

				
				[
				 {
					_loadoutToRestore = _this getVariable "MRH_Utilities_Parachute_Jump_loadOutBeforeJump";
					_dummyToDelete = _this getVariable "MRH_Utilities_Parachute_Jump_DummyBP";
					deleteVehicle _dummyToDelete;
					_this setUnitLoadout _loadoutToRestore;
				 },
				 _unit,
				 3	
				] call CBA_fnc_waitAndExecute;



			},
			_this
		] call CBA_fnc_waitUntilAndExecute;	


	},
	_this
] call CBA_fnc_waitUntilAndExecute;	


