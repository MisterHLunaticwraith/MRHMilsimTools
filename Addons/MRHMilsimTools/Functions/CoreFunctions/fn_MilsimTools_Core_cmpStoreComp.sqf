/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"

params ["_pivot","_objectsArray"];
_dataOutPut = [];
{
	private _entry = [_pivot,_x] FUNC(cmpGrabObject);
	_dataOutPut pushBackUnique _entry;
} forEach _objectsArray;
_dataOutPut
