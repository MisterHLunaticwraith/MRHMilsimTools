/*
Function name:MRH_fnc_MilsimTools_Core_cbaEventHandlersPlayer
Author: Mr H.
Description: Fired at player init, adds some cba handlers
Return value: none
Public: No
Parameters:none

Example(s):
call MRH_fnc_MilsimTools_Core_cbaEventHandlersPlayer;
*/
#include "MRH_C_Path.hpp"
["MRH_EventsCuratorAssigned", 
	{
		params ["_unit"];
		[_unit]FUNC(isCurator);
		["MRH_Zeus_Notif",["A Zeus has granted you Zeus powers,use them wisely!"]] call BIS_fnc_showNotification;
	}
] call CBA_fnc_addEventHandler;

["MRH_Events_curatorObjectCreated",
	{
		params ["_zeusPlayer","_zeusModule"];
		_toTrace = format ["Player %1 has received zeus powers and been assigned module %2",_zeusPlayer,_zeusModule];
		TRACE(_toTrace);
	}
] call CBA_fnc_addEventHandler;

["ace_arsenal_loadoutsDisplayOpened", 
	{
		params ["_display"];
		if (serverCommandAvailable "#kick") exitWith {};
		_hide= ["MRH_MilsimTools_hideAceMyLoadOuts"] call cba_settings_fnc_get;
		if !(_hide) exitWith {};
		(_display displayCtrl 401) ctrlShow false;
		(_display displayCtrl 402) ctrlShow false;
		[_display] spawn {
			params ["_display"];
			sleep 0.1; //needed because the change tab func is called to set to default after the EH is fired
		[_display,(_display displayCtrl 404)] call ace_arsenal_fnc_loadoutsChangeTab;
		};
	}
] call CBA_fnc_addEventHandler;

TRACE("Player CBA Even tHandlers Added");