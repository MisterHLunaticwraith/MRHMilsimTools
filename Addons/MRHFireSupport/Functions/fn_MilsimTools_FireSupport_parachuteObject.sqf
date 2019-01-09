/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Parachutes an object (either present in the mission or created by the script) on given position.
Return value: None
Public: No, but there is a public version
Parameters:
0-<OBJECT> present in the mission or <STRING> classname of the object to parachute. If object is provided mission object will be parachuted, if class name is provided object of the given classname will be createDialog
1 - <ARRAY> position AGLS, don't forget to put height (z in [x,y,z]), if a height below a 100m is provided the function will change it to a default 300m
2- <BOOLEAN> Optional. Attach a green smoke grenade to the object (when it is below a 100m), default, true.
3 -<BOOLEAN> Optional. Attach an IR grenade to the object (when it is below a 100m), default, true.
Example(s):
Unlike its public version it must be spawned (scheduled environment)
see public version for examples
[] spawn MRH_fnc_MilsimTools_FireSupport_parachuteObject

*/
#include "MRH_C_Path.hpp"
params ["_classname","_dropPos",["_attachSmoke",true],["_attachIR",true]];

	//---- if object is an actual object parachute it else create an object of the given classname	
		_toDrop = "";
	if ((typeName _classname) == "OBJECT") then {_toDrop = _classname} else 
	{
		_toDrop =  _classname createVehicle _dropPos;
	};
	_toDrop setPosATL _dropPos;


	//----disable collision with nearby aircraft
	_planeThatDropped = nearestObject [_toDrop,"Air"];
	if !(isNull _planeThatDropped) then {
	_toDrop disableCollisionWith _planeThatDropped;
	[[_toDrop,_planeThatDropped],{
		params ["_toDrop","_planeThatDropped"]; _toDrop disableCollisionWith _planeThatDropped;}] remoteExec ["Call",_planeThatDropped]; //in case plane is not local
	};

	//---- create chute
		
	_chute = "O_Parachute_02_F" createVehicle _dropPos;
	_chute setPosATL _dropPos;
	

	_toDrop attachTo [_chute,[0,0,0]];

	_toDrop allowDamage false;

	//---- attach smoke and IR
	[_toDrop,_attachSmoke,_attachIR] spawn {
		params ["_toDrop","_attachSmoke","_attachIR"];
		waitUntil {((getPosATL _toDrop) select 2) < 100};
		if(_attachSmoke) then {
		_smokeRedgear = "SmokeShellGreen" createVehicle (position _toDrop);
		_smokeRedgear attachto [_toDrop, [0,0,0]];
		};
		if (_attachIR)then {
		_IRG = "B_IRStrobe" createVehicle (position _toDrop);
		_IRG attachto [_toDrop, [0,0,0.5]];
		};
		
	};
	sleep 4;


	waitUntil{((getPosATL _toDrop) select 2)<0.6};
	detach _toDrop;
	_toDrop setVelocity [0,0,-5];
	_chute setVelocity [5,0,0];
	waitUntil {isTouchingGround _toDrop};
	_toDrop setVelocity [0,0,0];
	_toDrop allowDamage true;
	sleep 30;
	if !(isNull _chute) then {deleteVehicle _chute};