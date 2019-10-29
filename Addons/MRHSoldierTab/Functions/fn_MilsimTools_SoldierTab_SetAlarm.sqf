/*
Function name: MRH_fnc_MilsimTools_SoldierTab_SetAlarm
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_SetAlarm;
*/
#include "MRH_C_Path.hpp"
_isAlarmRunning = MRH_player getVariable ["MRH_SoldierTab_runningAlarmScript", scriptNull];
if !(isNull _isAlarmRunning) ExitWith {};
_hours = ctrlText 7715;
_hours = parseNumber _hours;
_minutes = ctrlText 7717;
_minutes = parseNumber _minutes;
_seconds = ctrlText 7719;
_seconds = parseNumber _seconds;
_minutesConv = _minutes/60;
_secondsConv = _seconds/3600;
_timeToMatch = _hours + _minutesConv + _secondsConv;


MRH_2digits_number_fnc ={
_data = _this call BIS_fnc_numberDigits;
_return = "";
 if (count _data ==1) then {_return = "0" + str _this} else {_return = str _this};
 _return
};
#define DIGITS(ARG) ARG call MRH_2digits_number_fnc
_strH = DIGITS(_hours);
_strM = DIGITS(_minutes);
_strS = DIGITS(_seconds);
_alarmText = "<img size = '2' image ='" + PAAPATH(alarm.paa) +"'/>" + (localize "STR_MRH_ST_FC_AlarmApp") + "<br/>" + (localize "STR_MRH_ST_FC_NextAlarmAt") +"          "+
"<t size = '2' color = '#ff9900'>" + _strH +":"+ _strM +":"+ _strS + "</t>";
FDIS(7703) ctrlSetStructuredText parseText _alarmText;
PLSVAR(nextAlarmText,_alarmText,false);
	_scriptHandle = [_timeToMatch,_alarmText] spawn 
	{
		#include "MRH_C_Path.hpp"
		params ["_timeToMatch","_alarmText"];
		if(daytime > _timeToMatch) then {waitUntil {daytime < _timeToMatch};};
		waitUntil {daytime >= _timeToMatch};
		//todo results
		PLSVAR(runningAlarmScript,scriptNull,false);
			//_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;//Temptodelete
	_soundToPlay = "MRHSoldierTab\Sounds\MRH_TAB_VibrateAlarm.ogg";//temptodelete//_soundPath +
	playSound3D [_soundToPlay,MRH_player,false,getPosASL MRH_player,10,1,10]; 
	for "_i" from 1 to 6 do {
	FDIS(7703) ctrlSetStructuredText parseText _alarmText;
	sleep 0.5;
	FDIS(7703) ctrlSetStructuredText parseText "";
	sleep 0.5;
	};
	_alarmText = "<img size = '2' image ='" + PAAPATH(alarm.paa) +"'/>" + (localize "STR_MRH_ST_FC_AlarmApp");
	FDIS(7703) ctrlSetStructuredText parseText _alarmText;
	};
	PLSVAR(runningAlarmScript,_scriptHandle,false);