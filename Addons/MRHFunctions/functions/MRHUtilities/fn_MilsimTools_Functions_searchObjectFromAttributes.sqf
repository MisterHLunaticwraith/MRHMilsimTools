/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call ;
*/
#include "MRH_C_Path.hpp"

if (is3DEN) exitWith {};
_statement = {
params ["_object"];
	
	_isSuccessful = _object getVariable ["MRH_successfulSearch",false];
	_nameFound = _object getVariable ["MRH_object_Found","someObject"];
	_onFoundCode = _object getVariable ["MRH_object_Found_code",""];
	_onFoundCode = compile _onFoundCode;
	_varName = "MRH_searchedObject_Found";
	_funcParams = [_object];
	_message =format ["MRH Search Object dummy search added to %1",_object];
	if (_isSuccessful) then {
		_funcParams = [_object,_varName,_nameFound,_onFoundCode];
		_message =format ["MRH Search Object, search added to object %1 with params %2",_object,_funcParams];
		};
	TRACE(_message);
	_funcParams call MRH_fnc_searchObject;
};
[
    {time>0}, 
    _statement, 
    _this
] call CBA_fnc_waitUntilAndExecute;