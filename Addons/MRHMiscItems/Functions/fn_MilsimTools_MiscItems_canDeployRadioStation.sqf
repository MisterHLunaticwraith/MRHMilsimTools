/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
if !(isClass (configFile>>'cfgPatches'>>'acre_main')) exitWith {false};
if (("MRH_MT_FoldedSatcomAntenna" in items MRH_player) && ([MRH_player, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio)) exitWith {true};
false