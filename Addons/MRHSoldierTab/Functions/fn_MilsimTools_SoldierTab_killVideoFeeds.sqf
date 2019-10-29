/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_killVideoFeeds;
*/
#include "MRH_C_Path.hpp"
["MRH_ST_Kill_video_Feed",[]] call CBA_fnc_globalEvent;
/*
if !(isServer) exitWith {[[],MRH_fnc_MilsimTools_SoldierTab_killVideoFeeds]remoteExec ["Call",2]};
[[],
	{
		missionNamespace setVariable ['MRH_stop_vid', true];
		missionNamespace setVariable ['MRH_stop_vid',nil]; 
		["", [10, 10],[1,1,1,1],'MRH_stop_vid'] call BIS_fnc_playVideo;//needs to be called with the above to kill videos
	}
]remoteExec ["Call",[0,-2] select isDedicated,false];
*/
