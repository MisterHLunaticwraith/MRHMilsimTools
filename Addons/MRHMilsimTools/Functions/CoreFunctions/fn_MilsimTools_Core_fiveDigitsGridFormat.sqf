/*
Function name:MRH_fnc_MilsimTools_Core_fiveDigitsGridFormat
Author: Mr H.
Description:(A DUPLICATE of MRH_fnc_MilsimTools_FireSupport_fiveDigitsGridFormat) adds 0 behind the provided number to make it 5 digits long (from minimum grid format to position2D)
Return value:
<STRING> 5 digits number
Public: No
Parameters:
<STRING> of 3 or for digirs numbers
Example(s):
["123"]call MRH_fnc_MilsimTools_Core_fiveDigitsGridFormat; //will return <STRING> "12300"
["124"]call MRH_fnc_MilsimTools_Core_fiveDigitsGridFormat; //will return <STRING> "12340"

*/
#include "MRH_C_Path.hpp"
	params ["_grid"];
private _result = _grid;
private _orgGrid = _grid splitString "";
private _lengthRequired = 5;//count ((str worldSize) splitString ""); //worldsize that are less than 5 digits like stratis yield less accurate results after passing through the parseCoordinates func
private _numberCounts = count _orgGrid;

_orgResized = +_orgGrid;
_orgResized resize _lengthRequired;
if ( _numberCounts >= _lengthRequired) exitWith {
	_result = _orgResized joinString "";
	_result
	
};
hint "arse";
_toAddN = _lengthRequired - _numberCounts;
for "_i" from 1 to _toAddN do
{
	_orgGrid pushBack "0";
};
_result = _orgGrid joinString "";
_result

/*
//-----original function for safekeeping
params ["_grid"];
_result = _grid;
_orgGrid = _grid splitString "";
_numberCounts = count _orgGrid;
if (_numberCounts == 2) then {_orgGrid pushBack "0";_orgGrid pushBack "0";};
if (_numberCounts == 3) then {_orgGrid pushBack "0";};

_result = _orgGrid joinString "";
_result = parseNumber _result;
_result
*/