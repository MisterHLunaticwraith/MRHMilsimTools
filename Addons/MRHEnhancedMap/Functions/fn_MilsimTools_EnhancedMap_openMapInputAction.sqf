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
if ("ItemMap" in assigneditems MRH_player) ExitWith {};
if ("MRH_Map" in items MRH_player) then {
call MRH_fnc_MilsimTools_EnhancedMap_lookAtMap;
};