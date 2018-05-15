
_DLCsList = missionNamespace getVariable "SPAWNER_DLCsList";

_allowedArray = [];
{
_setting= [_x] call cba_settings_fnc_get;
if (_setting) then {_allowedArray pushBack _x};
} forEach _DLCsList;
missionNamespace setVariable ["SPAWNER_Allowed_DLCsList", _allowedArray, true];
call MRH_fnc_SortFactionsAlgo;