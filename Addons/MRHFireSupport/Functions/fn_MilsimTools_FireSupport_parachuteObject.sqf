/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] spawn MRH_fnc_MilsimTools_FireSupport_parachuteObject

*/
#include "MRH_C_Path.hpp"
params ["_classname","_dropPos",["_attachSmoke",true],["_attachIR",true]];
		_toDrop = "";
	if ((typeName _classname) == "OBJECT") then {_toDrop = _classname} else 
	{
		_toDrop =  _classname createVehicle _dropPos;
	};
	
	_planeThatDropped = nearestObject [_toDrop,"Air"];
	if !(isNull _planeThatDropped) then {
	_toDrop disableCollisionWith _planeThatDropped;
	[[_toDrop,_planeThatDropped],{params ["_toDrop","_planeThatDropped"]; _toDrop disableCollisionWith _planeThatDropped;}] remoteExec ["Call",_planeThatDropped]; //in case plane is not local
	};

	_toDrop setPos _dropPos;

	_chute =  "O_Parachute_02_F" createVehicle (_toDrop modelToWorld [0,0,1]);

	_chute attachTo [_toDrop,[0,0,0.5]];

	_toDrop allowDamage false;
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
	while {((getPosATL _toDrop) select 2) > 5} do {
		_vel = velocity _chute;
		_toDrop setVelocity [_vel select 0,_vel select 1, -10];
	};

	detach _chute;
	_toDrop setVelocity [0,0,0];
	_chute setVelocity [0,0,0];
	_toDrop allowDamage true;
	sleep 30;
	if !(isNull _chute) then {deleteVehicle _chute};