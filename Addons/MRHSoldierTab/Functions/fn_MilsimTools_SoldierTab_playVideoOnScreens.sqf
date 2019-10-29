/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_playVideoOnScreens;
*/
#include "MRH_C_Path.hpp"
params ["_video","_screens"];

if (_screens isEqualTo [])exitWith {};
["MRH_ST_set_screen_video",_this] call CBA_fnc_globalEvent;
/*
if !(isServer) exitWith {[_this,MRH_fnc_MilsimTools_SoldierTab_playVideoOnScreens]remoteExec ["Call,2"]};
[_this,
{
	params ["_video","_screens"];
	missionNamespace setVariable ['MRH_stop_vid', true];
	missionNamespace setVariable ['MRH_stop_vid',nil];
	{
		_x setObjectTexture [(_x FUNC(getTexturePath)),_video];
	}forEach _screens;
	[_video, [10, 10],[1,1,1,1],'MRH_stop_vid'] call BIS_fnc_playVideo;

}
]remoteExec ["Call",[0,-2] select isDedicated,false];
*/