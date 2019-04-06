/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_temporaryMap
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] spawn MRH_fnc_MilsimTools_EnhancedMap_temporaryMap;
*/
#include "MRH_C_Path.hpp"

if !("ItemMap" in assigneditems MRH_player) then
{
	MRH_player linkItem "ItemMap";

	[{!visibleMap}, {MRH_player unlinkItem "ItemMap";}] call CBA_fnc_waitUntilAndExecute;
	
};