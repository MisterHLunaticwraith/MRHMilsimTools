/*
Function name: MRH_fnc_MilsimTools_SoldierTab_StartTimer
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_StartTimer;
*/
[] spawn {
	#include "MRH_C_Path.hpp"
	_aTimerIsRunning = player getVariable ["MRH_SoldierTab_timerIsRunning",false];
	if (_aTimerIsRunning) ExitWith {};
	_hours = ctrlText 7708;
	_hours = parseNumber _hours;
	_minutes = ctrlText 7709;
	_minutes = parseNumber _minutes;
	_seconds = ctrlText 7712;
	_seconds = parseNumber _seconds;
	_totalTime = (_hours * 3600) + (_minutes*60) + _seconds;
	PLSVAR(timerIsRunning,true,false);
	while {(_totalTime > 0) && (PLGVAR(timerIsRunning))} do {
	sleep 1;
	_totalTime = _totalTime -1;
	_totalTimePretty = [_totalTime,"HH:MM:SS"] call BIS_fnc_secondsToString;
	_totalTimePretty = "<t size = '2' color = '#ff9900'>" + _totalTimePretty + "</t>";

	_timerText = "<img size = '2' image ='" + PAAPATH(countdown.paa) +"'/>" + (localize "STR_MRH_ST_FC_TimerApp");

	if(ctrlshown FDIS(7702)) then {FDIS(7702) ctrlSetStructuredText parseText (_timerText + "<br/>" + _totalTimePretty);};
	};
	_totalTimePretty = [0,"HH:MM:SS"] call BIS_fnc_secondsToString;
	_totalTimePretty = "<t size = '2' color = '#ff9900'>" + _totalTimePretty + "</t>";

	_timerText = "<img size = '2' image ='" + PAAPATH(countdown.paa) +"'/>" + (localize "STR_MRH_ST_FC_TimerApp");
	if(ctrlshown FDIS(7702)) then {FDIS(7702) ctrlSetStructuredText parseText (_timerText + "<br/>" + _totalTimePretty);};
	_isStillRunning = PLGVAR(timerIsRunning);
	if (_isStillRunning) then {
	//_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;//Temptodelete
	_soundToPlay = "MRHSoldierTab\Sounds\MRH_TAB_VibrateAlarm.ogg";//temptodelete_soundPath + 
	playSound3D [_soundToPlay,player,false,getPosASL player,10,1,10];
	
	};
	PLSVAR(timerIsRunning,false,false);
};