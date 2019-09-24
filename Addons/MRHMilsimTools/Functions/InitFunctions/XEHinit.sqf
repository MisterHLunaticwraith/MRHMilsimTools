#include "MRH_C_Path.hpp"
_fullVersioning = (call MRH_fnc_MilsimTools_DebugTools_ListModsAndAddons) select 0;
_toTraceFullV = format ["MRH MilsimTools: Activated mods and addons:%1 %2",endl,_fullVersioning];
TRACE(_toTraceFullV);
_toTraceJustAddonsAndMods = format["MRH Milsim Tools activated mods: %1 %2 %3 activated addons: %4 %5",endl,(true call MRH_fnc_MilsimTools_DebugTools_readAbleList),endl,endl,(call MRH_fnc_MilsimTools_DebugTools_readAbleList)];
TRACE(_toTraceJustAddonsAndMods);