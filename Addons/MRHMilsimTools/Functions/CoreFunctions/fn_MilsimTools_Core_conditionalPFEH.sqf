/*
Function name:MRH_fnc_MilsimTools_Core_conditionalPFEH
Author: Mr H.
Description: Will run a CBA PFEH only for as long as the condition is fulfilled, will run provided code upon exiting and remove PFEH, used to replace while loops in unscheduled environment
Return value: cba PFEH handle
Public: No
Parameters:
0- <CODE> code to Run stated between {}
1 - <ANY> OPTIONAL parameters, will be passed to  code to run, exit code and condition
2- <CODE> OPTIONAL exit code between {} code that will be executed upon ending PFEH default is {}
3- <CODE THAT RETURNS BOOLEAN> - OPTIONAL conditions during which PFEH will run default {true}
4- <NUMBER> -OPTIONAL delay between each execution

Example(s):
_handle = [
	{hint str (_this select 0)},
	[player],
	{hint format ["Player %1 has died",(_this select 0)]},
	{alive player},
	2
]call MRH_fnc_MilsimTools_Core_conditionalPFEH;

//will hint player object every 2 seconds until player dies upon which it will hint that it has died
*/
#include "MRH_C_Path.hpp"
params [["_codeToRun",{},[{}]],["_parameters",[]],["_exitCode",{},[{}]],["_condition",{true}],["_delay",0]];
_handle = [
	{

		_handle = (_this select 1);
		(_this select 0) params ["_codeToRun","_parameters","_exitCode","_condition"];

		if (_parameters call _condition) then { _parameters call _codeToRun} 
		else 
		{
			[_handle] call CBA_fnc_removePerFrameHandler;
			 _parameters call _exitCode;
			 _message = format ["MRH Milsim Tools conditional PFEH, handle %1 removed PFEH",_handle];
			 TRACE(_message);
		};

	
	}, _delay, [_codeToRun,_parameters,_exitCode,_condition]
	
	] call CBA_fnc_addPerFrameHandler;

	_message = format ["Milsim Tools - conditional PFEH added with handle %1,parameters: codeToRun= %2, codeParams =%3,exitCode = %4,condition =%5, delay =%6 ",_handle,_codeToRun,_parameters,_exitCode,_condition,_delay];
	TRACE(_message);

	_handle