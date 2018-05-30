/*
Function name: MRH_fnc_MilsimTools_Admin_OpenMenu
Author: Mr H.
Description: Opens the admin menu interface, calls mission page fill function
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_Admin_OpenMenu;
*/
#include "MRH_C_Path.hpp"
if !(serverCommandAvailable "#kick") exitWith {};
openMap false;
disableSerialization;
_handle = createDialog "MRHAdminMenu";
FUNC(FillMissionPage);

