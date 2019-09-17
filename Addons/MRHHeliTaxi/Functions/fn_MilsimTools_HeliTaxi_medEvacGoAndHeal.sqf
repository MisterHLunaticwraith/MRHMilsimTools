/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
[player] spawn MRH_fnc_MilsimTools_HeliTaxi_medEvacGoAndHeal;
*/
#include "MRH_C_Path.hpp"
params ["_caller"];
_heli = missionNamespace getVariable [("MRH_HeliTaxi_CurrentMedEvacHeli_"+ (str (side _caller))),objNull];

if (isNull _heli) exitWith {};
[_heli,"MedEvacGoAndHeal"] FUNC(handleMessages);
_surgeon = _heli GVARDef(assignedSurgeon,objNull);
if !(isNull _surgeon)then 
{
	if (alive _surgeon) then {
	_surgeon doMove (position _heli);
	sleep 5;
	_surgeon moveInCargo _heli;
	};
};
_startUpPos = getPosASL _heli;
_heli SVAR(isLeavingArea,true,true);
// go to dummy pos
_escortGuys = _heli getVariable ["MRH_HeliTaxi_escortHelis",[objNull,objNull]];

{
	if !(isNull _x) then
	{
		if (alive _x) then {
		deleteWaypoint ((waypoints group _x) select ((count (waypoints group _x)) -1));
		//[_x] joinSilent (group _heli);
		};
	};
}forEach _escortGuys;


_dummyDestination = _heli modelToWorld [0,-2000,60];

(units group _heli) commandMove _dummyDestination;
{
	if !(isNull _x) then
	{
		if (alive _x) then {
		_x  commandMove (_dummyDestination vectorAdd [([-100,100] select _forEachIndex),0,0]);
		_x limitSpeed 90;
		};
		
	};
}forEach _escortGuys;
// heal all inside when dummy pos is reached
waitUntil {(_heli distance _dummyDestination < 300)};
{
	[_x, _x] call ACE_medical_fnc_treatmentAdvanced_fullHeal;
	if (isPlayer _x) then {
		[[],{
			[] spawn {
				["\MRHHeliTaxi\Paa\medevacscreen_co.paa",10] call MRH_fnc_splashScreen;
			};
			playSound "MRH_HeliTaxi_Treatment";
			
			}] remoteExec ["Call",_x]; //toDo make this sexier
	};
} forEach (crew _heli);
[_heli,"MedEvacBack"] FUNC(handleMessages);
//return to starting pos
(units group _heli) commandMove _startUpPos;

{
	if !(isNull _x) then
	{  
		if (alive _x) then {
		_x  commandMove (_startUpPos vectorAdd [([-100,100] select _forEachIndex),0,0]);
		};
	};
}forEach _escortGuys;

_heli SVAR(isInFinalApproachPhase,true,true);
[_heli] spawn {sleep 30; (_this select 0) SVAR(heliShouldHaveLanded,true,true)};//sometimes the heli won't land if so give players ability to force land
if ((_heli distance _startUpPos) > 1500) then { waitUntil {(_heli distance _startUpPos) < 1500}};
_heli limitSpeed 90;

if ((_heli distance _startUpPos) > 200) then {waitUntil {(_heli distance _startUpPos) < 200}};
_helipad = "Land_HelipadEmpty_F" createVehicle _startUpPos;
while { ( (alive _heli) && !(unitReady _heli) ) } do
{
sleep 1;
};

_isOnWater = [_startUpPos]FUNC(lzIsOnWater);
if (_isOnWater) then 
{   
	_heli SVAR(isHoveringAtSea,false,true);
	_heli land "GET IN";
	waitUntil {(_heli distance2D _startUpPos)<6};
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
deleteVehicle _helipad;
_heli setVariable ["MRH_HeliTaxi_medEvacInOperation",true,true];
[_heli,"Arrived"]FUNC(handleMessages);
sleep 2;
[_heli]FUNC(moveOutCargo);
sleep 2;

_heli setVehicleLock "LOCKED"; 
_ownerGrp = _heli GVAR(ownerGroup);
//[_ownerGrp,_startUpPos,true]FUNC(createDeleteMarkerForGroup);
sleep 10;
(units group _heli) commandMove (_heli modelToWorld [0,1000,0]);


{
	if !(isNull _x) then
	{
		if (alive _x) then {
		_x  commandMove (_heli modelToWorld [([-100,100] select _forEachIndex),1000,0]);
		};
		
	};
}forEach _escortGuys;
_heli flyInHeight 60;
_heli limitSpeed 99999;
// make heli available again 
//[_heli]FUNC(resetVariables);
sleep 40;
[side _heli] FUNC(resetMedevacVars);
[_heli]CFUNC(deleteVehicleAndCrew);

{
	if !(isNull _x) then
	{ 
		if (alive _x) then
		 {
			[_x]CFUNC(deleteVehicleAndCrew);
		};
		
	};
}forEach _escortGuys;
