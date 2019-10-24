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
if !(isServer) exitWith {};
if !([typeOf _heli]FUNC(canReceiveFries)) exitWith {private _toTrace = format ["%1 isn't configured for ACE3 FRIES"];TRACE(_toTrace)};
//----------approach phase
//_heli flyInHeight 20;
//waitUntil {((getPosATL _heli)select 2)<30};
//waitUntil {([_heli]FUNC(ATLReal))<25};

//_heli commandMove _destination;
_helipad = "Land_HelipadEmpty_F" createVehicle [(_destination select 0),(_destination select 1),36];//"Land_HelipadEmpty_F"
_helipad setPosATL [(_destination select 0),(_destination select 1),36];
while { ( (alive _heli) && !(unitReady _heli) ) } do
{
sleep 1;
};
//while{(_heli distance2D _destination)>2}do {_heli commandMove _destination};
//while {([_heli]FUNC(ATLReal))>33} do {_heli land "GET OUT";};
_heli land "GET OUT";
waitUntil {([_heli]FUNC(ATLReal))<37};
[_heli,"Fastrope",_destination]FUNC(handleMessages);
_heli land "NONE";
//_heli setPosATL (getPosATL _helipad);
_heli disableAI "MOVE";

[_helipad]FUNC(deleteHelipad);





//-------------fast roping phase
[_heli] call ace_fastroping_fnc_equipFRIES;
sleep 2;
[_heli] call ace_fastroping_fnc_prepareFRIES;
sleep 2;
[_heli,leader group _heli, "ACE_rope36"] call ace_fastroping_fnc_deployRopes;
sleep 3;
{
    if !(_x getVariable ["MRH_HeliTaxi_isHeliCrew",false]) then
	{
	
    [_x, _heli] call ace_fastroping_fnc_fastRope;
    _x spawn {waitUntil {isTouchingGround _this}; sleep 0.1;[_this, _this] call ACE_medical_fnc_treatmentAdvanced_fullHeal;}; //sometimes when AIs are local to the unit the fastrope bugs and it hurts
    };
} forEach (crew _heli);
sleep 20;
_heli enableAI "MOVE";
[_heli] call ace_fastroping_fnc_cutRopes;
sleep 1;
[_heli] call ace_fastroping_fnc_stowFRIES;
sleep 2;
//[_heli] call ace_fastroping_fnc_unequipFRIES; function not found? bug reported to ace
///-------in the mean time
deleteVehicle (_heli getVariable ["ace_fastroping_fries", objNull]);
_heli setVariable ["ace_fastroping_fries", nil, true];
//----------
_heli SVAR(isBusy,false,true);
[_heli]FUNC(despawnOrGoHomeSwitch);