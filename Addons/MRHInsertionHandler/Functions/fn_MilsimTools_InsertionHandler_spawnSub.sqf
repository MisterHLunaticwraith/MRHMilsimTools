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
	params ["_pos","_side"];
	_proteus = "Submarine_01_F" createVehicle _pos;
	private "_letter";
	switch (true) do {
		case (_side == east) : {_letter = "O";};
		case (_side == west) : {_letter = "B";};
		case (_side == resistance) : {_letter = "I";};
		case (_side == civilian) : {_letter = "B";};
		default {_letter = "B";};
		
	};
	_sdvClass= _letter + "_SDV_01_F";
	
	_turnRatio = 0;
	_sdv = _sdvClass createVehicle (position _proteus);
	
	_sdv attachTo [_proteus,[0,1,5.5]];
	_sdv setDir (getdir _proteus +180);

	_sdv2 = _sdvClass createVehicle (position _proteus);
	
	_sdv2 attachTo [_proteus,[0,8,5.5]];
	_sdv2 setDir (getdir _proteus +180);

	_sdvCTRL = _sdvClass createVehicle _pos;
	
	_proteus attachTo [_sdvCTRL,[0,0,0]];
	_proteus setDIr (getDir _sdvCTRL +180);
	
	createVehicleCrew _sdvCTRL;
    _sdvCTRL setPos (getPos _sdvCTRL vectorAdd [0,0,-15]);
	_sdvCTRL swimInDepth -15;
	{
		_x setVariable ["MRH_isAttachedToSub",true,true];
		_x setVariable ["MRH_SDV_orgFuel",Fuel _x,true];
		_x setFuel 0;
		_x setVariable ["MRH_SDV_attachedProteus",_proteus,true];
		_x setVariable ["MRH_leadSDV",_sdvCTRL,true];
	
	} forEach [_sdv,_sdv2];
	_sdvCTRL setVariable ["MRH_SDV_attachedProteus",_proteus];
	_sdvCTRL setVariable ["MRH_SDV_playerSDVs",[_sdv,_sdv2]];
	[_proteus] spawn {
		params ["_proteus"];
	_partSource = [_proteus,[0,45,-4],0.75,0.0001,400,60] call MRH_fnc_MilsimTools_InsertionHandler_submarineBubbles;
	_proteus setVariable ["MRH_BubblesOrigin",_partSource];
	}; // issue blocks waypoin when in the same thread???

	[_proteus,_sdvCTRL,_sdv,_sdv2]