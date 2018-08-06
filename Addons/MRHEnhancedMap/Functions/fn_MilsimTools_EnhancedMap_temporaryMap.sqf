/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_temporaryMap
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
spawn MRH_fnc_MilsimTools_EnhancedMap_temporaryMap;
*/
#include "MRH_C_Path.hpp"

if !("ItemMap" in assigneditems player) then
{
	player linkItem "ItemMap";
	waitUntil{!visibleMap};
	player unlinkItem "ItemMap";
};