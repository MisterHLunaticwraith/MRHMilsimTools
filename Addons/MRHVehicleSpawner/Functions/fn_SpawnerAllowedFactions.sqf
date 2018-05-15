_FactionsList = missionNamespace getVariable "SPAWNER_FactionsList";

_allowedArray = [];
{
_setting= [_x] call cba_settings_fnc_get;
if (_setting) then {_allowedArray pushBack _x};
} forEach _FactionsList;
missionNamespace setVariable ["SPAWNER_Allowed_FactionsList", _allowedArray, true];
call MRH_fnc_SortFactionsAlgo;