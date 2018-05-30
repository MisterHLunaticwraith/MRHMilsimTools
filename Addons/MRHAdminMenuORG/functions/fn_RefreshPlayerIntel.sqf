#include "MRH_components.hpp"
disableserialization;
_ctrlPlayerInfo = FDIS(1100);
_index = lbCurSel 1500;
_value = lbData [1500, _index];
if (_value == "") ExitWith {systemchat "pas de joueur sélectionné";};
///match value to player maybemakethis a macro or a function or both
_player = "";
{ _name = _x; 
if ((str _name) == _value) then {_player = _x;};
} forEach allPlayers;
///


////fills player intel
_playerName = name _player;
_playerUID = getPlayerUID _player;
_playerSteam = _player GVAR(SteamProfile);
_playerRole = _player getVariable "DisplayName";
_playerRoleBackup = roleDescription _player;
if ((roleDescription _player)  == "") then {_playerRoleBackup = "Pas de rôle définit";};
if (isNil "_playerRole") then {_playerRole = _playerRoleBackup};
_PlayerRank = rank _player;

_playerIntelText =
"Vous avez selectionné le soldat:" + " " + "<t color='#ffa42d'>" + _playerName + "</t><br/>"+
"Il est actuellement " + " "+ "<t color='#ffa42d'>" + _playerRole + "</t><br/>"+
"Son UID est " + " " + "<t color='#ffa42d'>" + _playerUID + "</t><br/>"+
"Son profil steam est" + " " + "<t color='#ffa42d'>" + _playerSteam + "</t><br/>" +
"Son grade est" + " " + "<t color='#ffa42d'>" + _PlayerRank + "</t>";
_ctrlPlayerInfo ctrlSetStructuredText parsetext _playerIntelText;
////////
///create PIPcam
[_player] FUNC(CreateAdminMenuCam);

//////sets the target player to be retrieved by others scripts
player SVAR(AdminSelectedPlayer,_player,false);
////
buttonSetAction [1603, "call MRH_fnc_HealSelectedPlayer"];
buttonSetAction [1604, "['squats'] call MRH_fnc_Punishment"];
buttonSetAction [1605, "['pushups'] call MRH_fnc_Punishment"];
buttonSetAction [1606, "['chicken'] call MRH_fnc_Punishment"];
buttonSetAction [1607, "['removechicken'] call MRH_fnc_Punishment"];
buttonSetAction [1608, "[player getVariable 'MRH_AdminSelectedPlayer', false] call MRH_fnc_SetHasDiedUnique"];
systemchat _playerName;