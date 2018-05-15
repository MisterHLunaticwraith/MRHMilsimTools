/*
this function requires MRH JipModule to function properly
if not used add an eventhanddler "killed", {player setVariable ["HasDied",true,true];}
and setVariable in initplayerlocal : player setVariable ["HasDied",false,true];
This function is meant to be used if you use a respawnbunker and need to test for players that are still ingame (not in respawnbunker)
it returns an array of players that are still "virtualy" alive
eg
_survivingplayers = call MRH_fnc_AllAlivePlayers; // returns an array in theform [survivingplayer1",survivingplayer2, etc]
*/

_allSurvivors = [];
{_check = _x getVariable "HasDied"; if !(_check) then { _allSurvivors pushBackUnique _x}} forEach allplayers;
_allSurvivors