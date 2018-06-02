/*
Function name: MRH_fnc_MilsimTools_Admin_SetHasDiedAll
Author: Mr H.
Description: Resets "has died" variable for all players
Return value: None
Public: No
Parameters:
Example(s):
call MRH_fnc_MilsimTools_Admin_SetHasDiedAll;
*/
#include "MRH_C_Path.hpp"
{
[_x] CFUNC(SetRevived);
}forEach allPlayers;

FUNC(RefreshPlayersList);
systemchat (localize "STR_MRH_ADMIN_SETHASDIEDALLSYSTEMCHAT");