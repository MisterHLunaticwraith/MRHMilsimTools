/*
Function name:MRH_fnc_MilsimTools_RHS_CBPS_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RHS_CBPS_CBAsettings;
*/
#include "MRH_C_Path.hpp"


[
    "MRH_MT_RHSCBPS_useGlobal", 
    "CHECKBOX",
    ["Use same composition for all CBPS vehicles",""],
    "MRH_Milsim Tools - RHS CBPS",
    true,
    1

] call cba_settings_fnc_init;

_compUsedGlobalValues = [];
_compUsedGlobalPretty = [];

_addonComps = FUNC(listAddonCompositions);
{
	_compUsedGlobalValues pushBackUnique (_x select 1);
	_compusedGlobalPretty pushBackUnique (_x select 0);
} forEach _addonComps;

_missionComps = FUNC(listMissionCompositions);
{
	_compUsedGlobalValues pushBackUnique (_x select 1);
	_compusedGlobalPretty pushBackUnique (_x select 0);
} forEach _missionComps;

[
    "MRH_MT_RHSCBPS_globalComp", 
    "List",
    "Composition to use",
    "MRH_Milsim Tools - RHS CBPS",
    [_compUsedGlobalValues,_compUsedGlobalPretty,0],
    true

] call cba_settings_fnc_init;
