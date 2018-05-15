_publicTime = _this select 0;
while {PublicTimerPaused && PublicTimerON} do {


if (publicTimerReStarted) exitWith {[_publicTime] call MRH_fnc_TimerStart};
sleep 1;
_timestamp = _publicTime/3600;
_timedisplay = [_timestamp, "HH:MM:SS"] call BIS_fnc_timeToString;
["<t font = 'PuristaMedium'><t size = '1'>" + _timedisplay + "</t>",0.8,-0.05,0.5,0] spawn BIS_fnc_dynamicText; 
};