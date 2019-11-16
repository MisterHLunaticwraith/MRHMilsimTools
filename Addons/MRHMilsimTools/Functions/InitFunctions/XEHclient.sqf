#include "MRH_C_Path.hpp"
[player]FUNC(generateLoadOutText);
FUNC(AddBriefingRoster);

["MRH_playerConnected_EH",
	{
		params ["_id", "_uid", "_name", "_jip", "_ownerID"];
		FUNC(AddBriefingRoster);	
	}
]call CBA_fnc_addEventHandler;//refresh roster when a new player connects and users are still on the Briefing Page

//functions that need to wait until the player is initialized
[{(player == player) && (!isNull (findDisplay 46))},
{
	FUNC(InitPlayerLocal);
	FUNC(initMRHPlayer);
	FUNC(cbaEventHandlersPlayer);

}] call CBA_fnc_waitUntilAndExecute;


//
TRACE("Core Xeh: calling initPlayerLocal");