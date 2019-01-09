/*
Function name:MRH_fnc_MilsimTools_FireSupport_fiveDigitsGridFormat
Author: Mr H.
Description: adds 0 behind the provided number to make it 5 digits long (from minimum grid format to position2D)
Return value:
<NUMBER> 5 digits number
Public: No
Parameters:
<STRING> of 3 or for digirs numbers
Example(s):
["123"]call MRH_fnc_MilsimTools_FireSupport_fiveDigitsGridFormat; //will return <NUMBER> 12300
["124"]call MRH_fnc_MilsimTools_FireSupport_fiveDigitsGridFormat; //will return <NUMBER> 12340

*/
#include "MRH_C_Path.hpp"
params ["_grid"];
_result = _grid;
_orgGrid = _grid splitString "";
_numberCounts = count _orgGrid;
if (_numberCounts == 3) then {_orgGrid pushBack "0";_orgGrid pushBack "0";};
if (_numberCounts == 4) then {_orgGrid pushBack "0";};

_result = _orgGrid joinString "";
_result = parseNumber _result;
_result
