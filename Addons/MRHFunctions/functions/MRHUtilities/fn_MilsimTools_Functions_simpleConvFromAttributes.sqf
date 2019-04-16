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
params ["_unit"];
	
	_message = _unit getVariable ["MRH_message_conversationText",""];

	_codeToExecute = _unit getVariable ["MRH_message_codeToExecute"," _unit = _this select 0;_passedParameters = (_this select 1);"];
	_codeToExecute = compile _codeToExecute;

	_parametersToPass = _unit getVariable ["MRH_message_parametersPassed","[]"];
	_parametersToPass = call compile _parametersToPass;

	_isGlobal = _unit getVariable ["MRH_message_runCodeGlobally",false];
	_locality = "LOCAL";
	if (_isGlobal) then {_locality = "GLOBAL";};

	_removeAfterUse = _unit getVariable ["MRH_message_removeActionAfterUse",false];


	_funcParams = [_unit,_message,_codeToExecute,_locality,_removeAfterUse,_parametersToPass];

	_message = format ["MRH Simple ace message called from attributes for unit: %1,with parameters %2",_unit,_funcParams];
	TRACE(_message);
	_funcParams call MRH_fnc_simpleAceMessage;
};
[
    {time>0}, 
    _statement, 
    _this
] call CBA_fnc_waitUntilAndExecute;