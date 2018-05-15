params ["_pausetime"];

[_pausetime] execVM "\MRHFunctions\scripts\scr_timerpaused.sqf";
_returnvalue = _pausetime;
_returnvalue