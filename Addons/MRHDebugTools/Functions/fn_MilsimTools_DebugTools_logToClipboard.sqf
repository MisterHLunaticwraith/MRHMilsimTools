/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_logToClipboard;
*/
#include "MRH_C_Path.hpp"
_log = missionNamespace getVariable ["MRH_MilsimTools_globalDebugLog",[]];
_logText = "";
{
	_x params ["_time","_owner","_logEntry"];
	_string = [_logEntry,endl] joinString " ";
	_logText = _logText + _string;
	

}forEach _log;

copyToClipBoard _logText;