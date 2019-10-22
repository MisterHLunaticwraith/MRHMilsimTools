/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_debugHintboxInit;
*/
#include "MRH_C_Path.hpp"


if (IS_DEBUG) then 
{
	290119 cutRsc ["MRHDebugHintBox", "PLAIN"];
} 
else 
{	
	private _display = uiNamespace getVariable ["MRHDebugHintBox",displayNull];
	_display closedisplay 2
};