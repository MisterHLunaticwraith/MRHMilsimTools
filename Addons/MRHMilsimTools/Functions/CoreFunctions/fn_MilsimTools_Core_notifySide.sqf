/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: notifies all players of given side
Return value: 
Public: No
Parameters:
0 <SIDE> side of players who will receive the notification Can be West / Blufor (Arma 3), East / Opfor (Arma 3), Resistance / Independent (Arma 3), Civilian, sideLogic, Friendly, Enemy or Unknown. 
1 <STRING> message (optional, empty string will be sent if undefined)
2 <STRING> type of notification defined in cfgNotifications a default admin notif template will be used if not set
Example(s):
[West,"admin says 'hi'!"]call MRH_fnc_MilsimTools_Core_notifySide;
or
[East,"zeus says 'hi'!","MRH_Zeus_Notif"]call MRH_fnc_MilsimTools_Core_notifySide;

*/
#include "MRH_C_Path.hpp"
params ["_side",["_message",""],["_notificationType","MRH_Admin_Notif"]];
_toNotify = [allPlayers,_side] call MRH_fnc_MilsimTools_Core_SortUnitsBySide;
{
	[_x,_message,_notificationType]call MRH_fnc_MilsimTools_Core_notifyPlayer;
} forEach _toNotify;