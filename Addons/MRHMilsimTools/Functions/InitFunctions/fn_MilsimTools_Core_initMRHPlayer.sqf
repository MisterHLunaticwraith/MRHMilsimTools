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
	_genMessage = format ["MRH Milsim Tools Dbg -Player View changed: _oldunit = %1, _newUnit = %2, _vehicle = %3,_oldCamera = %4, _newCamera = %5, _uav = %6",_oldUnit, _newUnit, _vehicle,_oldCamera, _newCamera, _uav];
	TRACE(_genMessage);
	
	_traceMessageComplement = "";
	MRH_Player =  missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player];

	//transfer player event handlers
	if (player != MRH_player) then 
			{
				_previouslySet = MRH_player getVariable ["MRH_MapEhTransfered",false];
				if !(_previouslySet) then 
					{
						MRH_player setVariable ["MRH_PlayerEventHandlers Transfered",true];
						MRH_player addEventHandler ["Killed",{call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap}];
						MRH_player addEventHandler ["InventoryOpened",{call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap}];
						MRH_player addEventHandler ["InventoryClosed",{if !("MRH_Map" in items MRH_player) then {call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap};}];

						_traceMessageComplement = "event handlers added to new unit";

					}
					else 
					{
						_traceMessageComplement = "event handlers were already on new unit";
					};
			};

	// close opened instances of foldable map
	call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap;
	//update loadout diarySubject
	[MRH_player]FUNC(generateLoadOutText);
	MRH_player addEventHandler ["InventoryClosed", {
			params ["_unit", "_container"];
			[MRH_player]FUNC(generateLoadOutText);
		}];
	_message = format ["MRH Milsim Tools - Player changed unit: MRH_Player definition now is: %1. %2",MRH_Player,_traceMessageComplement];
	TRACE(_message);
}];

//redefine on respawn
player addEventHandler ["Respawn",{MRH_player = player}];
player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
	[MRH_player]FUNC(generateLoadOutText);
}];