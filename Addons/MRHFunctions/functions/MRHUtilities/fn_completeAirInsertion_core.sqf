/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call ;
*/
#include "MRH_C_Path.hpp"
params ["_unitsToDrop","_typeOfPlane","_startPos","_dropPos",["_height",500],["_side",WEST],["_isSteerableChute",false],["_extraGear",[]]];


//step 1 convert coordinates in case of 2d coordinates (from markers)
_startPosActual = [(_startPos select 0),(_startPos select 1),_height];

//step 2 create plane
_relDir = [_startPos,_dropPos] call MRH_fnc_relativeBearing;
_vecarray = [_startPosActual, _relDir, _typeOfPlane,_side] call bis_fnc_spawnvehicle;
_myvec = _vecarray select 0;
// step 2.1 make all objects that will be paradroped invisible if they are objects & (disable colision w/plane commented done in the chute func)
if !(_extraGear isEqualTo[]) then
    {
        {
            if ((typeName _x) == "OBJECT") then
            {   
                //[[_x, _myvec],{params ["_veh1","_veh2"];_veh1 disableCollisionWith _veh2}] remoteExec ["Call",0];
                [[_x],{params ["_toHide"];_toHide hideObjectGlobal true}] RemoteExec ["Call",2];
            };
        }forEach _extraGear;
    };

_myvec flyInHeight _height;
_myvec lockDriver true;
_myvec setBehaviour "CARELESS";
_myvec setCombatMode "GREEN";

while { ( (alive _myvec) && !(unitReady _myvec) ) } do
{
       sleep 1;
};

group _myvec addWaypoint [_dropPos, 0];

 
//step3 move group inside
[_unitsToDrop,_myvec] call MRH_fnc_MoveInCargo;
sleep 1;
//step 4 wait until we are 10 seconds away from target
waitUntil {(_myvec distance2D _dropPos) <= 150};

// step 5 drop everyone and everything
_myvec allowDamage false;
[_unitsToDrop,_isSteerableChute,0.1,_extraGear,_myvec] call MRH_fnc_staticLineChute;
//-- and make objetcs visible again
if !(_extraGear isEqualTo[]) then
    {
        {
            if ((typeName _x) == "OBJECT") then
            {
                [[_x],{params ["_toHide"];_toHide hideObjectGlobal false}] RemoteExec ["Call",2];
            };
        }forEach _extraGear;
    };
//step 6 send the plane away and despawn

group _myvec addWaypoint [_myvec modelToWorld [0,2000,0], 0];
sleep 10;
_myvec allowDamage false;
sleep 25;
{deleteVehicle _x;}forEach crew _myvec;
deleteVehicle _myvec;