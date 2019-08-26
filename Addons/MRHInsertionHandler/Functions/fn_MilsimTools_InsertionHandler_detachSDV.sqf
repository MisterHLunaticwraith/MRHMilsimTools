/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_;
*/
#include "MRH_C_Path.hpp"
	params ["_sdv"];
	detach _sdv;
	_sdv setFuel (_sdv getVariable ["MRH_SDV_orgFuel",100]);
	_sdv setVelocity [0,0,2];
	playSound3D ["MRHInsertionHandler\Sounds\MRH_InsertionHandler_sdvDetach.ogg",_sdv];
	_partSource = [_sdv,[0,0,-0.5],1,0.0001,0.5,20] call MRH_fnc_MilsimTools_InsertionHandler_submarineBubbles; //["_object",["_offset",[0,0,0]],["_spread",0.3],["_dropInterVal",0.001],["_size",0.5],["_lifeTime",3]];
	[
    {
        deleteVehicle _this;
    }, 
    _partSource, 
    5
] call CBA_fnc_waitAndExecute;
	hint (localize "STR_MRH_MRHInsertionHandler_HintSDVDetached");