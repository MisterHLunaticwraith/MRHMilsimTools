/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: randomly returns a <BOOL> value with a percentage chance of happening defined by the provided number
Return value:
<BOOL> true if testing succeeded false otherwise
Public: No
Parameters:
0- <NUMBER> expressed in percentage, the odds of the function returning true
Example(s):
[100]call MRH_fnc_MilsimTools_Core_testPrecentageOdds; // will always return true
[0]call MRH_fnc_MilsimTools_Core_testPercentageOdds;  //will always return false
[60]call MRH_fnc_MilsimTools_Core_testPercentageOdds; // as a 60% chance of returning true
[10]call MRH_fnc_MilsimTools_Core_testPercentageOdds; // as a 10% chance of returning true

*/
#include "MRH_C_Path.hpp"
params ["_odds"];
_seed = [1,101] call BIS_fnc_randomInt;
if (_seed > _odds) exitWith {false};
true