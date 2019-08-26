/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_;
*/
#include "MRH_C_Path.hpp"

	params ["_units","_sdv1","_sdv2"];
if ((count _units)>8) then {hint "to many units, some will not be moved"};
_cargoForSDV1 = [];
_cargoForSDV2 = [];

for "_i" from 0 to ((count _units) -1) do
{
	if (_i >7) exitWith {}; // do nothing for units passed 8;
	//
	//move the first unit to drive the first sdv
	if  (_i == 0) then {
		[_units select _i, _sdv1] call MRH_fnc_MilsimTools_InsertionHandler_prepUnitForDiving;
		[_units select _i, _sdv1] call MRH_fnc_MoveInDriver;
		};
	// move second unit to gunner
	if  (_i == 1) then {
		[_units select _i, _sdv1] call MRH_fnc_MilsimTools_InsertionHandler_prepUnitForDiving;
		[_units select _i, _sdv1] call MRH_fnc_MoveInGunner;
		};

	//move the fifth unit to drive the second sdv
	if  (_i == 4) then {
		[_units select _i, _sdv2] call MRH_fnc_MilsimTools_InsertionHandler_prepUnitForDiving;
		[_units select _i, _sdv2] call MRH_fnc_MoveInDriver;
		};
	// move sixth unit to gunner
	if  (_i == 5) then {
		[_units select _i, _sdv2] call MRH_fnc_MilsimTools_InsertionHandler_prepUnitForDiving;
		[_units select _i, _sdv2] call MRH_fnc_MoveInGunner;
		};
	
	//prep crew (3rd & 4th) for sdv 1
	if (_i in [2,3]) then {_cargoForsdv1 pushBackUnique (_units select _i); [_units select _i, _sdv1] call MRH_fnc_MilsimTools_InsertionHandler_prepUnitForDiving;};
	//prep crew (7th & 8th) for sdv 2
	if (_i in [6,7]) then {_cargoForsdv2 pushBackUnique (_units select _i); [_units select _i, _sdv2] call MRH_fnc_MilsimTools_InsertionHandler_prepUnitForDiving;};
	
	if (isPlayer (_units select _i)) then {
		[[_units select _i],MRH_fnc_MilsimTools_InsertionHandler_subTransferEffects] remoteExec ["Spawn",(_units select _i)]; // call visual effects for player 
	};
};

//move remaining inside 

	if !(_cargoForSDV1 isEqualTo []) then {[_cargoForSDV1,_sdv1] call MRH_fnc_MoveInCargo};
	if !(_cargoForSDV2 isEqualTo []) then {[_cargoForSDV2,_sdv2] call MRH_fnc_MoveInCargo};
	