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


[
    {(((getPosASL player) select 2)<= ((_this select 0) + 200))}, 
    {
		params ["_AADTriggerAltitude"];
		if ([player] FUNC(isFreeFalling)) then {

		["Warning"] FUNC(selfOpeningWarning);

		};

			[
				{(((getPosASL player) select 2)<= (_this select 0))}, 
				{
					if ([player] FUNC(isFreeFalling)) then {

						["SelfOp"] FUNC(selfOpeningWarning);
						if ([player] FUNC(hasParachute)) then {player action ["OpenParachute", player];};
						};
				}, [_AADTriggerAltitude]

			] call CBA_fnc_waitUntilAndExecute;


	}, 
    [_AADTriggerALtitude]
] call CBA_fnc_waitUntilAndExecute;



