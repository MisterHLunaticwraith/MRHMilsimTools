/*
Function name: MRH_fnc_MilsimTools_Core_ReturnCountsForRegistry
Author: Mr H.
Description: Returns an array of numbers with count for players in the form:

Return value:
[0 number of players present at init,1 number of players online,2 number of curently dead players,3 number of players that have died including disconnected,4 number of disconnect players,5 number of alive players]

Public: Yes
Parameters: None
Example(s):
_alivePlayersCount = (call MRH_fnc_MilsimTools_Core_ReturnCountsForRegistry) select 5;
*/
#include "MRH_C_Path.hpp"
[COUNT_INIT,COUNT_ONLINE,COUNT_CURDEAD,COUNT_ALLDEAD,COUNT_OFFLINE,COUNT_ALIVE]
