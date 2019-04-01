/*
Function name: MRH_fnc_MilsimTools_Admin_GlobalJipOpen
Author: Mr H.
Description:  Remotely opens the jip menu for all dead players
Return value: None
Public: No
Parameters:
Example(s):
call MRH_fnc_MilsimTools_Admin_GlobalJipOpen;
*/
#include "MRH_C_Path.hpp"
[[],
{
	_condition= player getVariable ["MRH_MilsimTools_Core_HasDied",false];
	if (_condition) then 
	{
		["MRH_AllowedRespawn",[localize "STR_MRH_ADM_NOT_WILLJIP"]] call BIS_fnc_showNotification;
		
		[{call MRH_fnc_MilsimTools_Jip_Open_Menu;}, [], 3] call CBA_fnc_waitAndExecute;
		
	};
}
] RemoteExec ["Call",[0,-2] select isDedicated,false];
