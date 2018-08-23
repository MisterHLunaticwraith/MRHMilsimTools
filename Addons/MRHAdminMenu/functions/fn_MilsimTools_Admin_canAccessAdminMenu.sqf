/*
Function name: MRH_fnc_MilsimTools_Admin_canAccessAdminMenu
Author: Mr H.
Description:
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_Admin_canAccessAdminMenu;
*/
#include "MRH_C_Path.hpp"
if (serverCommandAvailable "#kick") exitWith {true};

_allowedNonAdminZeus = ["MRH_MilsimTools_AllowAdminForZeus"] call cba_settings_fnc_get;
if !(_allowedNonAdminZeus) exitWith {false};
if !(isNull curatorCamera) exitWith {diag_log format ["MRH_MilsimTools_AdminMenu player %1 is in zeus view and can access admin menu",str player];true};
  
false