/*
Function name:MilsimTools_Core_RemoteExecForGivenPlayer
Author: Mr H.
Description: executes given code where given unit is local, faster simpler version of MRH_fnc_MilsimTools_Core_RemoteFor, appliable to non playable units
Return value: none
Public: Yes
Parameters:
0 - <OBJECT> player or unit
1 -<CODE>  code to execute, has to be put between {}
2 -<ANY> OPTIONAL parameters passed to the script between[]
3 - <STRING> -OPTIONAL can be "spawn" for scheduled environment or "Call" for Unscheduled default "Call"

Example(s):
[unit,{somecode}]call MRH_fnc_MilsimTools_Core_RemoteExecForGivenPlayer;
*/
params ["_unit","_code",["_parameters",[]],["_environment","Call"]];
[_parameters,_code] RemoteExec [_environment,_unit];