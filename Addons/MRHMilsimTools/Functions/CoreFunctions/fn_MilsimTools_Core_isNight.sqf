/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: returns true if it's night fals by day
Public: No
Parameters:
Example(s):
[]call MRH_fnc_MilsimTools_Core_isNight;
*/
#include "MRH_C_Path.hpp"

_sstime = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _sstime select 0;
_sunset = _sstime select 1;
_missiontime = daytime;
_pip = "";

//nuit
if ((_missiontime < _sunrise) or (_missiontime > _sunset))
exitWith {true};
false