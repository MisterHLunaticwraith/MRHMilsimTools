/*
Function name: MRH_fnc_MilsimTools_Admin_Punisher
Author: Mr H.
Description: applies given punishment to selected player
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_Admin_Punisher;
*/
#include "MRH_C_Path.hpp"
_playerUid = lbdata [1500,(lbCurSel 1500)];
_player = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID;
_punishment = lbdata [2102,(lbCurSel 2102)];





_cfgFile = configfile;
if ((gettext (_cfgFile>>"cfgMRHPunishments">>_punishment>>"code")) == "") then {_cfgFile = missionConfigFile};
_punishmentStatement = gettext (_cfgFile>>"cfgMRHPunishments">>_punishment>>"code");


[_player] spawn (compile _punishmentStatement); 

[_playerUid,
{
	params ["_cfgFile","_punishment"];
	_messageSTR = gettext (_cfgFile>>"cfgMRHPunishments">>_punishment>>"notificationMessage");
	["MRH_Punishment",[_messageSTR]] call BIS_fnc_showNotification;

},[_cfgFile,_punishment]] call MRH_fnc_MilsimTools_Core_RemoteFor;

