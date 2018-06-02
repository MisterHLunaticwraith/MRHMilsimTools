/*
Function name:MRH_fnc_MilsimTools_Core_FindPlayerByUID
Author: Mr H.
Description: Finds and returns the player corresponding with given steam UID
Return value: <OBJECT> Player/ objNull if the player wasn't found
Public: No
Parameters:
0-<STRING> steam uid 
Example(s):
["somesteamUID"]call MRH_fnc_MilsimTools_Core_FindPlayerByUID ;
*/

params ["_uid"];

_player = objNull;

if (typeName _uid != "STRING") ExitWith {Diag_Log format ["MRH_MilsimTools_Core - Error UID: %1 is not a STRING"], str _uid; _player};
{
	_tocheck = getPlayerUID _x;
	if ( _tocheck == _uid) then {_player = _x};

}forEach allPlayers;
if (isNull _player) then {Diag_Log format ["MRH_MilsimTools_Core - No player found for UID: %1"], str _uid};
_player