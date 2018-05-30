/*
Function name: MRH_fnc_MilsimTools_Admin_EndMission;
Author: Mr H.
Description: Ends the mission with the selected ending
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_Admin_EndMission;
*/
#include "MRH_C_Path.hpp"
_selectedEnd = lbdata [2100,(lbCurSel 2100)];
[[_selectedEnd],
	{
	params ["_selectedEnd"];
	closedialog 0;
	[_selectedEnd,false,true,false,false]spawn BIS_fnc_endMission; 
	}
] RemoteExec ["Call",0];