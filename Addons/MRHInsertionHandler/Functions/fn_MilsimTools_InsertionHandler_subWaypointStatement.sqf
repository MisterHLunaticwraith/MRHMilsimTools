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
	params ["_sdvCtrlGrpLead"];
	if !(isServer) exitWith {}; //wiki says setWaypointStatements is AG/EL but I'm not sure, running it only on server
	_sdvCTRL = vehicle _sdvCtrlGrpLead;
	_proteus = _sdvCTRL getVariable ["MRH_SDV_attachedProteus",objNull];
	_bubbles = _proteus getVariable ["MRH_BubblesOrigin",objNull];
	deleteVehicle _bubbles;
	_playerSDVs = _sdvCTRL getVariable ["MRH_SDV_playerSDVs",[objNull,objNull]];
		[
			{
				params ["_proteus","_sdvCTRL"];
				deleteVehicle _proteus;
				{deleteVehicle _x} forEach (crew _sdvCTRL);
				deleteVehicle _sdvCTRL;
			}, 
			[_proteus,_sdvCTRL], 
			240
		] call CBA_fnc_waitAndExecute; // this scope deletes the proteus and its 'guide' 4 minutes after arrival

	// make an array of all players in the 2 SDVs
	_playerCrews = [];
	{
		if (isPlayer _x) then {_playerCrews pushBackUnique _x};
	}
	forEach(crew (_playerSDVs select 0));

	{
		if (isPlayer _x) then {_playerCrews pushBackUnique _x};
	}
	forEach(crew (_playerSDVs select 1));
	
	
	[[_playerCrews],
		{
			params ["_playerCrews"];
			if !(hasInterface) exitWith {};
			if !(MRH_player in _playersCrews) exitWith {};
			hint (localize "STR_MRH_MRHInsertionHandler_SubOnSIteMess");
			playSound "MRH_InsertionHandler_USSProteusComArrived";

		
		}
	] remoteExec ["Call",0]; //one call filtered on arrival is better than a for each