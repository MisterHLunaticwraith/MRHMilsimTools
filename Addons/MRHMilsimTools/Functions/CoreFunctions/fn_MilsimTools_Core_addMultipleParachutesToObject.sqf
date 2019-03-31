/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: Adds multiple parachutes to an object, number of chutes ranges from 1 to 5 depending on object mass
Return value: None
Public: No
Parameters:
0 - <OBJECT> object that will receive the parachutes
Example(s):
cursortarget setPosATL ((getPosATL cursortarget) vectorAdd [0,0,100]);
[cursortarget] call MRH_fnc_MilsimTools_Core_addMultipleParachutesToObject;
*/
#include "MRH_C_Path.hpp"
params ["_object"];

_mass = getMass _object;

_chute1 = [_object] FUNC(addParachuteToObject);

if (_mass < 4000) exitWith {};

_count = 0;
switch (true) do 
{
	case (_mass < 10000) : {_count = 0};
	case ((_mass >= 10000) && (_mass < 20000) ) : {_count = 1};
	case ((_mass >= 20000) && (_mass < 30000) ) : {_count = 2};
	case (_mass >= 30000) : {_count = 3};
};

	for "_i" from 0 to _count do
	{
		_vectorPosArray = [
				[0.5,0.4,0.6],[-0.5,0.4,0.6],[0.5,-0.4,0.6],[-0.5,-0.4,0.6]
			];
			private _chute = [_object,false] FUNC(addParachuteToObject);
			_chute setDir getDir _object;
			_chute attachTo [_chute1,[0,0,0]];
			_chute setVectorUp (_vectorPosArray select _i);
			
			
	};
[_object] FUNC(ensureSafeLanding);