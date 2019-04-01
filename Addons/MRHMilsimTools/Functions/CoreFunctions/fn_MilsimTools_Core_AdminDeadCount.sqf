/*
Function name: MRH_fnc_MilsimTools_Core_AdminDeadCount
Author: Mr H.
Description: Hints the admin with a percentage every time a player dies if the percentage is over the limit set in settings it automaticaly opens the admin menu
Return value: None
Public: No
Parameters: None
Example(s): No
call MRH_fnc_MilsimTools_Core_AdminDeadCount;
*/
#include "MRH_C_Path.hpp"
[{

	_percentage = COUNT_CURDEAD/COUNT_ONLINE*100;
	_percentage2 =  COUNT_ALLDEAD/(COUNT_ONLINE + COUNT_OFFLINE)*100;
	if (serverCommandAvailable "#kick") then 
	{
	_showHint = ["MRH_MilsimTools_ShowAdminDeadHint"] call cba_settings_fnc_get;
	_AdminCasualtiesCap = ["MRH_MilsimTools_AdminCasualtiesCap"] call cba_settings_fnc_get;
		if (_showHint) then
			{
				hint format [localize "STR_MRH_MS_ADMINCAPHINT",_percentage,_percentage2];
			};

		if (_percentage >= _AdminCasualtiesCap) then {call MRH_fnc_MilsimTools_Admin_OpenMenu;};

	};
}, [], 2] call CBA_fnc_waitAndExecute;
//leave some time vor the variables to be set