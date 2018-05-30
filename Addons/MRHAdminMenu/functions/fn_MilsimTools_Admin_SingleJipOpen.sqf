/*
Function name: MRH_fnc_MilsimTools_Admin_SingleJipOpen
Author: Mr H.
Description: remotly opens jip menu for selected player 
Return value: none
Public:no
Parameters: None
Example(s):
call MRH_fnc_MilsimTools_Admin_SingleJipOpen;
*/
#include "MRH_C_Path.hpp"
_playerUid = lbdata [1500,(lbCurSel 1500)];
[_playerUid,
{
		["MRH_AllowedRespawn",[localize "STR_MRH_ADM_NOT_WILLJIP"]] call BIS_fnc_showNotification;
		sleep 3;
		call MRH_fnc_MilsimTools_Jip_Open_Menu;

},[]] call MRH_fnc_MilsimTools_Core_RemoteFor;