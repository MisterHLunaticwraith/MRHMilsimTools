/*
* params: "publictime" ==> time in seconds the timer will last
* example:
* [120] call MRH_fnc_timer; will initiate a 2 minutes timer.
*/

params ["_publictime"];


publicTimerPaused = false;
publicVariable "publicTimerPaused";
publicTimerON = true;
publicvariable "publicTimerON";
[_publictime]execVM "\MRHFunctions\scripts\scr_timer.sqf";
true