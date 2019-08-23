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
params ["_unit","_vehicle"];

	[_unit,_vehicle,"VEST"]call MRH_fnc_MilsimTools_Core_putContainerInVehicle;
	[_unit,_vehicle] call MRH_fnc_MilsimTools_Core_putContainerInVehicle;
	_faceWear =goggles _unit;
	_vehicle addItemCargoGlobal [_faceWear, 1];
	removeGoggles _unit;

	private "_letter";
	switch (true) do {
		case (side _unit == east) : {_letter = "O";};
		case (side _unit == west) : {_letter = "B";};
		case (side _unit == resistance) : {_letter = "I";};
		case (side _unit == civilian) : {_letter = "B";};
		default {_letter = "B";};
		
	};

	_unit addUniform "U_"+ _letter + "_Wetsuit";
	_unit addGoggles "G_"+ _letter + "_Diving";
	_unit addVest "V_RebreatherB";