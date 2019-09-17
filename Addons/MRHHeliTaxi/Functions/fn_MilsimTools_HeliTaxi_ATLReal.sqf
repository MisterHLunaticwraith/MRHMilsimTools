/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
[myHeli] call MRH_fnc_MilsimTools_HeliTaxi_ATLReal;
*/
#include "MRH_C_Path.hpp"
params ["_veh"];
_posVeh =getPosASL _veh;
_posGround = [(_posVeh select 0),(_posVeh select 1),0];
_firstContact =(lineIntersectsSurfaces [_posVeh,_posGround, _veh])select 0;
_firstOntactPosASL = _firstContact select 0;

(ASLToAGL _firstOntactPosASL) distance  (ASLToAGL _posVeh)