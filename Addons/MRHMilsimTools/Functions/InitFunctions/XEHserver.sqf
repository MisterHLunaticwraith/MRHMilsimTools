#include "MRH_C_Path.hpp"
call MRH_fnc_MilsimTools_Core_PlayersRegistry;
["ace_unconscious",
	{
		params ["_unit", "_state"];
		if (isPlayer _unit) then 
		{
			["MRH_playerOnly_ace_unconscious",_this] call CBA_fnc_globalEvent; //ace event fires on every unit, I only want an event for players
			0 FUNC(allPlayers);
		};
	}
] call CBA_fnc_addEventHandler;
TRACE("Core Xeh: calling PlayersRegistryInit");