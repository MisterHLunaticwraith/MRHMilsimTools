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
if !([player] FUNC(hasAADParachute)) exitWith {};
_AADTriggerAltitude = parseNumber(player getVariable ["MRH_HaloGear_AADOpening_alt",(["MRH_MilsimTools_HaloGear_AADDefaultOpeningAltitude"] call cba_settings_fnc_get)]);
waitUntil {(((getPosASL player) select 2)<= (_AADTriggerAltitude + 200))};
if ([player] FUNC(isFreeFalling)) then {

["Warning"] spawn MRH_fnc_MilsimTools_HaloGear_selfOpeningWarning; 
};
waitUntil {(((getPosASL player) select 2)<= _AADTriggerAltitude)};
if ([player] FUNC(isFreeFalling)) then {

["SelfOp"] spawn MRH_fnc_MilsimTools_HaloGear_selfOpeningWarning;
 if ([player] call MRH_fnc_MilsimTools_HaloGear_hasParachute) then {player action ["OpenParachute", player];};
};