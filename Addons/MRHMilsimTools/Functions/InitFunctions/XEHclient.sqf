#include "MRH_C_Path.hpp"
[player]FUNC(generateLoadOutText);
FUNC(AddBriefingRoster);

["MRH_playerConnected_EH",
	{
		params ["_id", "_uid", "_name", "_jip", "_ownerID"];
		FUNC(AddBriefingRoster);//update roster
		0 FUNC(allPlayers);	//update allPlayers on clients
	}
]call CBA_fnc_addEventHandler;//fired whenever any player connects

["MRH_playerDisconnected_EH",
	{
		params ["_id", "_uid", "_name", "_jip", "_ownerID"];
		FUNC(AddBriefingRoster);//update roster
		0 FUNC(allPlayers);	//update allPlayers on clients
	}
]call CBA_fnc_addEventHandler;//fired whenever any player disconnects

["MRH_playerOnly_ace_unconscious",
	{
		params ["_unit","_state"];
		0 FUNC(allPlayers);
	}

] call CBA_fnc_addEventHandler; // fired whenever a player's ace uncounscious state changes
//functions that need to wait until the player is initialized
[{(player == player) && (!isNull (findDisplay 46))},
{
	FUNC(InitPlayerLocal);
	FUNC(initMRHPlayer);
	FUNC(cbaEventHandlersPlayer);

}] call CBA_fnc_waitUntilAndExecute;



//
TRACE("Core Xeh: calling initPlayerLocal");