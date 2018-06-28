/*
Function name:MRH_fnc_AllAlivePlayers
Author: Mr H.
Description: Returns a list of players considered 'alive' by MRH_MilsimTools
Return value: <ARRAY> of alive players
Public: Yes
Parameters: None
Example(s):
_survivingplayers = call MRH_fnc_AllAlivePlayers; // returns an array in theform [survivingplayer1",survivingplayer2, etc]
*/

#include "MRH_C_Path.hpp"
_regAlive = PLAYERREGISTRY_ALIVE;
_allSurvivors = [];
{
	_playerID = _x select 0;
	_player = [_playerID] CFUNC(findPlayerByUID);
	_allSurvivors pushBackUnique _player;
} forEach _regAlive;
_allSurvivors

