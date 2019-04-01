/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"

MRH_Player = missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player];
addMissionEventHandler ["PlayerViewChanged", {
	params [
		"_oldUnit", "_newUnit", "_vehicle",
		"_oldCamera", "_newCamera", "_uav"
	];
	_genMessage = format ["MRH Milsim Tools Dbg -Player View changed: _oldunit = %1, _newUnit = %2, _vehicle = %3,_oldCamera = %4, _newCamera = %5, _uav = %6",_oldUnit, _newUnit, _vehicle,
		_oldCamera, _newCamera, _uav];
	TRACE(_genMessage);


	MRH_Player =  missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player];
	_message = format ["MRH Milsim Tools - Player changed unit: MRH_Player definition now is: %1",MRH_Player];
	TRACE(_message);
}];
