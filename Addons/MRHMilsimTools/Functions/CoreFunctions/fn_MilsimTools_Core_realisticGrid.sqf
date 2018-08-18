params ["_position"];
_lat = _position select 0;
_lat = [_lat, 0] call BIS_fnc_cutDecimals;
_long = _position select 1;
_long = [_long, 0] call BIS_fnc_cutDecimals;
_gridActual = str _lat + "-" + str _long;
_gridActual