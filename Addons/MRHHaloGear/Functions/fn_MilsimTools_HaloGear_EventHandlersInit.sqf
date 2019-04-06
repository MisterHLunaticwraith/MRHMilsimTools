/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"
if !(hasInterface) exitWith {};
_hypoHeight = ["MRH_MilsimTools_HaloGear_hypoxiaAltitude"] call cba_settings_fnc_get;

//initialize correct EH depending on start up height
if (((getPosASL player) select 2)< _hypoHeight) then {FUNC(aboveHypoEH)} else {FUNC(underHypoEH);[]FUNC(hypoxiaEffects);};
//initialize correct EH depending on start up freefallin or not
if ([player] FUNC(isFreeFalling)) then {FUNC(freeFallEndedEH)} else {FUNC(startedFreefallEH)};

//set hypoxia EH
//["MRH_underHypoxiaLevel_eh", {systemChat format ["Player %1 is under hyop called",_this]}] call CBA_fnc_addEventHandler;
["MRH_aboveHypoxiaLevel_eh", {[]FUNC(hypoxiaEffects);}] call CBA_fnc_addEventHandler;

//set freefall eh
["MRH_StartedFreefall_eh", {TRACE("MRH_MilsimTools_HaloGear - player has started freefalling"); FUNC(AADOpening);FUNC(randomBreakingChance)}] call CBA_fnc_addEventHandler;
["MRH_freefallEnded_eh", {TRACE("MRH_MilsimTools_HaloGear - player has stopped freefalling");FUNC(attachAceAttachable)}] call CBA_fnc_addEventHandler;

//hypoxia when player gets out of vehicle
player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if (player == _unit) then { []FUNC(hypoxiaEffects);};
}];

//retest when gear is changed
player addEventHandler ["Take", {
	params ["_unit", "_container", "_item"];
	if (player == _unit) then {
		[]FUNC(hypoxiaEffects);
		if ([_item] FUNC(isProtectiveGear)) then {[_item] FUNC(rebreatherSounds)};
		};
}];

player addEventHandler ["Put", {
	params ["_unit", "_container", "_item"];
	
	if (player == _unit) then 
	{
		[]FUNC(hypoxiaEffects);
	
	};
}];
// play sound if has protective gear at startUp
if ([goggles player] FUNC(isProtectiveGear)) then {[goggles player] FUNC(rebreatherSounds)};
if ([headgear player] FUNC(isProtectiveGear)) then {[headgear player] FUNC(rebreatherSounds)};

TRACE("MRH Halo Gear, Event Handlers Initialized");