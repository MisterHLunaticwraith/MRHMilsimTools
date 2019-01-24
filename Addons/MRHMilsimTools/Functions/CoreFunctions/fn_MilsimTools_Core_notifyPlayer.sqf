/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: remotely notifies a chosen player
Return value: 
Public: No
Parameters:
0 <PLAYER> player who will receive the notification
1 <STRING> message (optional, empty string will be sent if undefined)
2 <STRING> type of notification defined in cfgNotifications a default admin notif template will be used if not set
Example(s):
[player,"admin says 'hi'!"]call MRH_fnc_MilsimTools_Core_notifyPlayer;
or
[player,"zeus says 'hi'!","MRH_Zeus_Notif"]call MRH_fnc_MilsimTools_Core_notifyPlayer;
*/
#include "MRH_C_Path.hpp"
params ["_player",["_message",""],["_notificationType","MRH_Admin_Notif"]];
[_player,
	{
		params ["_notificationType","_message"];
		[_notificationType,[_message]] call BIS_fnc_showNotification;
	},
[_notificationType,_message]
]call MRH_fnc_MilsimTools_Core_RemoteExecForGivenPlayer;