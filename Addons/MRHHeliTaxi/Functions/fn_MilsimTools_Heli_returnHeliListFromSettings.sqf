params ["_settingsRef"];
_string = [_settingsRef] call cba_settings_fnc_get;
_resultingArray = _string splitString ",";
_resultingArray