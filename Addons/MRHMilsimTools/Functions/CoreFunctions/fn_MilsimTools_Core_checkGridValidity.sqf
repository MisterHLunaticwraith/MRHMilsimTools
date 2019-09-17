/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: A duplicate of MRH_fnc_MilsimTools_FireSupport_checkGridValidity
Return value:
<BOOL>, true if input is at the coorect format strong otherwise
Public:No
Parameters:
<STRING>
Example(s):
["1234-12345"] call MRH_fnc_MilsimTools_Core_checkGridValidity;// returns true
["12-12345"] call MRH_fnc_MilsimTools_Core_checkGridValidity;// returns false
*/
#include "MRH_C_Path.hpp"
params ["_Coordinates"];
_valid = false;
_CoordinatesArray = _Coordinates splitString "-";
if ((count _CoordinatesArray) != 2) ExitWith {_valid};

NumberCount_fnc = {
	params ["_number"];
	_numberStr = _number;
	_check = true;
	_tocount = _numberStr splitString "";
	if (((count _tocount)<3) or ((count _tocount) >5)) then {_check = false};
	_check
};

_lat = _CoordinatesArray select 0;
_long = _CoordinatesArray select 1;

_latValid = true;
if ((parseNumber _lat) == 0) then {_latValid = false};
_latValid = [_lat] call NumberCount_fnc;





_longValid = true;
if ((parseNumber _long) == 0) then {_longValid = false};
_longValid = [_long] call NumberCount_fnc;

_return = false;
if (_latValid && _longValid) then {_return = true};
_return