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
    [localize "STR_MRH_MRH_RHS_CBPS_UseSameCompCBA",localize "STR_MRH_MRH_RHS_CBPS_UseSameCompCBAToolTip"],
    "MRH_Milsim Tools - RHS CBPS",
    true,
    1

] call cba_settings_fnc_init;

_compUsedGlobalValues = ["None"];
_compUsedGlobalPretty = [localize "STR_MRH_MRH_RHS_CBPS_None"];

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
    [localize "STR_MRH_MRH_RHS_CBPS_CompToUseCBA",localize "STR_MRH_MRH_RHS_CBPS_CompToUseCBATootip"],
    "MRH_Milsim Tools - RHS CBPS",
    [_compUsedGlobalValues,_compUsedGlobalPretty,1],
    true

] call cba_settings_fnc_init;
