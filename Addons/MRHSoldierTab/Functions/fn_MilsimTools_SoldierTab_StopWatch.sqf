/*
Function name: MRH_fnc_MilsimTools_SoldierTab_StopWatch
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_StopWatch;
*/
[] spawn{
	#include "MRH_C_Path.hpp"
	PLSVAR(StopWatchRunning,true,false);
	_resumeTime = MRH_player getVariable ["MRH_SoldierTab_StopWatchStoppedAt",0];
	_time = 0;
	_runTime = 0;
	if (_resumeTime !=0) then {_time = (time - _resumeTime)} else {_time = time};
	while {true && PLGVAR(StopWatchRunning)} do 
	{
	_runTime = time - _time;
	_runTimePretty = [_runTime,"HH:MM:SS.MS"] call BIS_fnc_secondsToString;
	_runTimePretty = "<t size = '2' color = '#ff9900'>" + _runTimePretty + "</t>";
	if(ctrlshown FDIS(7707)) then {FDIS(7707) ctrlSetStructuredText parseText _runTimePretty;};
	sleep 0.01;
	};
	PLSVAR(StopWatchStoppedAt,_runTime,false);
};