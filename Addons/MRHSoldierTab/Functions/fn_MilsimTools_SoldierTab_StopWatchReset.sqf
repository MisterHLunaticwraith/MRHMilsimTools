/*
Function name: MRH_fnc_MilsimTools_SoldierTab_StopWatchReset
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_StopWatchReset;
*/
#include "MRH_C_Path.hpp"
MRH_player setVariable ['MRH_SoldierTab_StopwatchRunning',false];
MRH_player setVariable ['MRH_SoldierTab_StopWatchStoppedAt',0];
_runTimePretty = [0,'HH:MM:SS.MS'] call BIS_fnc_secondsToString;
_runTimePretty = "<t size = '2' color = '#ff9900'>" + _runTimePretty + "</t>";
if(ctrlshown FDIS(7707)) then {FDIS(7707) ctrlSetStructuredText parseText _runTimePretty;};