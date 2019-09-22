#include "MRH_C_Path.hpp"

//functions that need to wait until the player is initialized

[{(player == player) && (!isNull (findDisplay 46))},
{
	FUNC(InitPlayerLocal);
	FUNC(initMRHPlayer);
	FUNC(cbaEventHandlersPlayer);

}] call CBA_fnc_waitUntilAndExecute;

//
TRACE("Core Xeh: calling initPlayerLocal");