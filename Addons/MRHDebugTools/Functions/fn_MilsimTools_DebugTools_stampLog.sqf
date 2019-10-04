/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_stampLog;
*/
#include "MRH_C_Path.hpp"

private _time = [time,serverTime] select isServer;
if (!isMultiplayer) then {_time = time;};
private _logTime = [_time/6000,"HH:MM:SS:MM"] call BIS_fnc_timeToString;
private _toTrace= 
[
"//////////////////////////////////////////",endl,
"// MRH MILSIMTOOLS DEBUG STAMP:",_logTime,"//",endl,
"/////////////////////////////////////////",endl,
endl] joinString "";
TRACE(_toTrace)
