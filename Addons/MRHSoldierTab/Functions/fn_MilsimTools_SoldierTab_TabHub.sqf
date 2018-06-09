/*
Function name: MRH_fnc_MilsimTools_SoldierTab_TabHub
Author: Mr H.
Description: calls the function corresponding to the selected page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_TabHub;
*/
#include "MRH_C_Path.hpp"
_selected = lbdata [1500,(lbcursel 1500)];
switch (true) do 
{
case (_selected == "HomeButton"):{FUNC(RefreshHomePage)};
case (_selected == "GrpButton"):{FUNC(RefreshGroupPage)};
case (_selected == "MapButton"):{FUNC(RefreshMapPage)};
case (_selected == "PicsButton"):{FUNC(RefreshPicsPage)};
case (_selected == "AlarmButton"):{FUNC(RefreshAlarmPage)};
case (_selected == "FilesButton"):{FUNC(RefreshFilesPage)};
};