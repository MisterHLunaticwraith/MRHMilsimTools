/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"
params ["_LZ","_caller"];


//--create the heli
_heliType = _caller getVariable "MRH_HeliTaxi_UserSelectedHeli";
_caller setVariable ["MRH_HeliTaxi_UserSelectedHeli",nil,true];
_vecarray = [_caller modelToWorld [0,-2000,60], getDir _caller, _heliType,side _caller] call bis_fnc_spawnvehicle;
_myvec = _vecarray select 0;
[[(group _myvec)],{(_this select 0) setGroupId ["[REAPER 1-1]"];}] remoteExec ["Call",0];
[_myvec] FUNC(flagCrew);
[_myVec] CFUNC(lockNonCargo);
//-- create variables
//attach variables to the group
_callingGRP = group _caller;
_callingGRP SVAR(isUsingHeli,true,true); //the group currently uses a heli
_callingGRP SVAR(slavedHeli,_myvec,true); //used heli
//attach variables  to the heli 
_myvec SVAR(ownerGroup,_callingGRP,true); //group owning this heli
_myvec SVAR(userSetdestination,_LZ,true);//destination chosen 
_myvec SVAR(caller,_caller,true);// person that called the heli
//substract from used by side
[side _callingGRP,true]FUNC(availabilityCountUpdate);

//--create the marker for all group members of the caller
[_callingGRP,_LZ]FUNC(createDeleteMarkerForGroup);
//--add event handlers
//when vehicle is destroyed
_myvec addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] FUNC(onTaxiDestroyed);
}];

// when caller is killed
_EHHeliownerKilled = _caller addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] FUNC(onCallerKilled);
}];
_caller SVAR(KilledEHIndex,_EHHeliownerKilled,true);

//-- play message
[_myvec,"Request"]FUNC(handleMessages);
//-- send the heli to Land
_myvec flyInHeight 60;
//_myvec lockDriver true;
_myvec setBehaviour "CARELESS";
_myvec setCombatMode "GREEN";
_myvec commandMove _LZ;

waitUntil {(_myvec distance _LZ) < 1500};
_myvec limitSpeed 90;
waitUntil {(_myvec distance _LZ) < 150};
_helipad = "Land_HelipadEmpty_F" createVehicle _LZ;
_smokeRedgear = "SmokeShellGreen" createVehicle (position _helipad);
_smokeRedgear attachto [_helipad, [0,0,0]];
while { ( (alive _myvec) && !(unitReady _myvec) ) } do
{
	sleep 1;
};
_isOnWater = [_LZ]FUNC(lzIsOnWater);
if (_isOnWater) then 
{   
	_myvec SVAR(isHoveringAtSea,true,true);
	_myvec land "GET IN";
	waitUntil {(_myvec distance2D _LZ)<6};
	_myvec land "NONE";
	_myvec flyInHeight 3;
} else {
_myvec land "GET IN";
waitUntil {isTouchingGround _myvec};
};
[_helipad]FUNC(deleteHelipad);






















