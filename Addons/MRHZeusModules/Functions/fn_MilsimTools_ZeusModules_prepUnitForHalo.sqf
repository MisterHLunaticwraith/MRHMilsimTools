/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[player] call MRH_fnc_MilsimTools_ZeusModules_prepUnitForHalo;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];

_goggles = goggles _unit;
_unit addItem _goggles;
removeGoggles _unit;
_unit addGoggles "MRH_HaloMask";

_hasBPOC = false;
if ("zade_boc" in activatedAddons) then {_hasBPOC = true};
if (_hasBPOC) then {[_unit] call zade_boc_fnc_actionOnChest;} else {[_unit]CFUNC(paraRemoveBackPack);[_unit] CFUNC(paraRestoreBackpack);};


[
    {
       (_this select 0) addBackPack "MRH_AADEquippedParachute";
    }, 
    [_unit], 
    1
] call CBA_fnc_waitAndExecute;