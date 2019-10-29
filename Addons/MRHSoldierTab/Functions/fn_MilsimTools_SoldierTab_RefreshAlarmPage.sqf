/*
Function name: MRH_fnc_MilsimTools_SoldierTab_RefreshAlarmPage
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_RefreshAlarmPage;
*/
#include "MRH_C_Path.hpp"
FUNC(AllCtrlsHide);
_pageSpecificCtrls = [7701,7702,7703,7704,7705,7706,7707,7708,7709,7710,7711,7712,7713,7714,7715,7716,7717,7718,7719,7720,7721,7722,7723];
{
ctrlShow [_x,true];
}ForEach _pageSpecificCtrls;

//refreshes the stopwatch
_chronoText = "<img size = '2' image ='" + PAAPATH(stopwatch.paa) +"'/>" + (localize "STR_MRH_ST_FC_StopWatchApp");
_resumeTime = MRH_player getVariable ["MRH_SoldierTab_StopWatchStoppedAt",0];
_runTimePretty = [_resumeTime,"HH:MM:SS.MS"] call BIS_fnc_secondsToString;
_runTimePretty = "<t size = '2' color = '#ff9900'>" + _runTimePretty + "</t>";
if(ctrlshown FDIS(7707)) then {FDIS(7707) ctrlSetStructuredText parseText _runTimePretty;};
FDIS(7701) ctrlSetStructuredText parseText _chronoText;

//refreshes the timerzone
_timerText = "<img size = '2' image ='" + PAAPATH(countdown.paa) +"'/>" + (localize "STR_MRH_ST_FC_TimerApp");
FDIS(7702) ctrlSetStructuredText parseText _timerText;

//refreshes the alarmzone
_alarmText = "<img size = '2' image ='" + PAAPATH(alarm.paa) +"'/>" + (localize "STR_MRH_ST_FC_AlarmApp");


_isAlarmRunning = MRH_player getVariable ["MRH_SoldierTab_runningAlarmScript", scriptNull];
if !(isNull _isAlarmRunning) then {_alarmText = PLGVAR(nextAlarmText)};
FDIS(7703) ctrlSetStructuredText parseText _alarmText;