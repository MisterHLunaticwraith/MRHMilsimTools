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
params ["_LZ","_caller","_myvec"];

_myvec SVAR(isFlyingBackToBase,false,true);
_myvec SVAR(isBusy,true,true);
_callingGRP = group _caller;
//--create the marker for all group members of the caller
[_callingGRP,_LZ]FUNC(createDeleteMarkerForGroup);


//-- play message
[_myvec,"Request"]FUNC(handleMessages);
if !(isEngineOn _myvec) then
{

	private _pilot = driver _myvec;
	_pilot action ["engineOn",_myvec];
	waitUntil {isEngineOn _myvec};
};

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
	_myvec SVAR(isBusy,false,true);
} else {
_myvec land "GET IN";
waitUntil {isTouchingGround _myvec};
_myvec SVAR(isBusy,false,true);
};
[_helipad]FUNC(deleteHelipad);





















