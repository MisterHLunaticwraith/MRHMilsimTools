/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"
params ["_heli","_destination"];
if (!isServer) exitWith {};
_heli SVAR(isInFinalApproachPhase,true,true);
[_heli] spawn {sleep 30; (_this select 0) SVAR(heliShouldHaveLanded,true,true)};//sometimes the heli won't land if so give players ability to force land
if ((_heli distance _destination) > 1500) then { waitUntil {(_heli distance _destination) < 1500}};
_heli limitSpeed 90;

if ((_heli distance _destination) > 150) then {waitUntil {(_heli distance _destination) < 150}};
_helipad = "Land_HelipadEmpty_F" createVehicle _destination;
while { ( (alive _heli) && !(unitReady _heli) ) } do
{
sleep 1;
};

_isOnWater = [_destination]FUNC(lzIsOnWater);
if (_isOnWater) then 
{   
	_heli SVAR(isHoveringAtSea,false,true);
	_heli land "GET IN";
	waitUntil {(_heli distance2D _destination)<6};
	_heli land "NONE";
	_heli flyInHeight 3;
	waitUntil {((getPosASL _heli) select 2)<4};
	_heli SVAR(isInFinalApproachPhase,false,true);
	_heli SVAR(heliShouldHaveLanded,false,true);
} else {

_statement = "GET IN";
#include "exceptionlist.hpp"
if((typeOf _heli) in _exceptionlist) then {_statement = "LAND"};//some helis do not touch ground when GET IN order is issued,replace by LAND
_heli land _statement;//"GET IN";


waitUntil {isTouchingGround _heli};
};
[_helipad]FUNC(deleteHelipad);
_heli SVAR(isInFinalApproachPhase,false,true);
_heli SVAR(heliShouldHaveLanded,false,true);
_heli SVAR(isBusy,false,true);
[_heli,"Arrived"]FUNC(handleMessages);

[
    {
        params ["_heli"];
		_isOnWater = [getPos _heli]FUNC(lzIsOnWater);
		if (_isOnWater) exitWith {};
		_heli land "LAND";
		[
			{isTouchingGround (_this select 0)}, 
			{
				_pilot = driver (_this select 0);
				_pilot action ["engineOff",(_this select 0)];
			}, 
			[_heli],
			20
		] call CBA_fnc_waitUntilAndExecute;

    }, 
    [_heli], 
    60
] call CBA_fnc_waitAndExecute;