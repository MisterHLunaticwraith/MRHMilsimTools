/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_LandFinal
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_LandFinal;
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
} else {

_statement = "GET IN";
#include "exceptionlist.hpp"
if((typeOf _heli) in _exceptionlist) then {_statement = "LAND"};//some helis do not touch ground when GET IN order is issued,replace by LAND
_heli land _statement;//"GET IN";


waitUntil {isTouchingGround _heli};
};

[_heli,"Arrived"]FUNC(handleMessages);
sleep 2;
[[_heli],{params ["_heli"]; if (player in _heli) then {moveOut player};}] RemoteExec ["Call",[0,-2] select isDedicated];
sleep 2;

_heli setVehicleLock "LOCKED"; 
_ownerGrp = _heli GVAR(ownerGroup);
[_ownerGrp,_destination,true]FUNC(createDeleteMarkerForGroup);
sleep 10;
_heli commandMove (_heli modelToWorld [0,1000,0]);
_heli flyInHeight 60;
_heli limitSpeed 99999;
// make heli available again 
[_heli]FUNC(resetVariables);
sleep 40;
{deleteVehicle _x;}forEach crew _heli;
deleteVehicle _heli;