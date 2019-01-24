/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: returns object from string obtained with str <OBJECT> used for recovering objects from controls data
Return value: <OBJECT>
Public: No
Parameters:
0 - <STRING> stringed str
1 - Optional <STRING> typeOf objects to process, faster processing if narrowed down, default "all"
Example(s):
[someObjectString]call MRH_fnc_MilsimTools_Core_findObjectFromString;
or 
[somePlaneObjectString,"Air"]call MRH_fnc_MilsimTools_Core_findObjectFromString;
*/
#include "MRH_C_Path.hpp"
params ["_stringObject",["_type","All"]];

_return = objNull;
{
	if (str _x == _stringObject)then{_return = _x};
} forEach allMissionObjects _type;
_return
