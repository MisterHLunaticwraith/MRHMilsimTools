#include "MRH_C_Path.hpp"

//functions that need to wait until the player is initialized

[{(player == player) && (!isNull (findDisplay 46))},
{
	FUNC(addKeyHandler);

	player addEventHandler ["Killed",{call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap}];
	player addEventHandler ["InventoryOpened",{call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap}];
	player addEventHandler ["InventoryClosed",{if !("MRH_Map" in items MRH_player) then {call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap};}];
	["ace_unconscious", {if (_this select 1) then {call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap};}] call CBA_fnc_addEventHandler;
	["ace_captiveStatusChanged", {if (_this select 1) then {call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap};}] call CBA_fnc_addEventHandler;
		
	TRACE("EnhancedMap Xeh: Handlers added ");


}] call CBA_fnc_waitUntilAndExecute;

//
TRACE("EnhancedMap Xeh: adding handlers ");