params ["_position"];
_EN = [_position] call ace_common_fnc_getMapGridFromPos; //use acefunction instead
_EN joinString "-"
/*///------ original function for safekeeping
//[position player] call MRH_fnc_MilsimTools_Core_realisticGrid
params ["_position"];
_lat = _position select 0;
_lat = [_lat, 0] call BIS_fnc_cutDecimals;
_long = _position select 1;
_long = [_long, 0] call BIS_fnc_cutDecimals;
_gridActual = str _lat + "-" + str _long;
_gridActual
*/