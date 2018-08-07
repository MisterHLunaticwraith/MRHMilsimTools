/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_EnhancedMap_;
*/
#include "MRH_C_Path.hpp"
//toDo make this optionable
_CAman = _this select 0;
[_CAman] spawn
{
params ["_CAman"];
waitUntil {time>1};
if (_CAman == player) then 
{
	player addEventHandler ["Killed",{call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap}];
	player addEventHandler ["InventoryOpened",{call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap}];
	player addEventHandler ["InventoryClosed",{if !("MRH_Map" in items player) then {call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap};}];
	["ace_unconscious", {if (_this select 1) then {call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap};}] call CBA_fnc_addEventHandler;
	["ace_captiveStatusChanged", {if (_this select 1) then {call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap};}] call CBA_fnc_addEventHandler;
};
if (is3DEN) ExitWith {};
_replaceVanillaMap = ["MRH_MilsimTools_Map_ReplaceVanillaMap"] call cba_settings_fnc_get;
if (_replaceVanillaMap) then {
		if ("ItemMap" in assigneditems _CAman) then
		{
			_CAman unlinkItem "ItemMap";
			if !("MRH_Map" in items _CAman) then {_CAman addItem "MRH_Map";};
		};
	};
	

	
};