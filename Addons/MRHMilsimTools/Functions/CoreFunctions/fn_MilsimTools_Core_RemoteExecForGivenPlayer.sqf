/*
Function name:MilsimTools_Core_RemoteExecForGivenPlayer
Author: Mr H.
Description: executes given code where given unit is local, faster simpler version of MRH_fnc_MilsimTools_Core_RemoteFor, appliable to non playable units
Return value: none
Public: Yes
Parameters:
0 - <OBJECT> player or unit
1 -<CODE>  code to execute, has to be put between {}

Example(s):
[unit,{somecode}]call MRH_fnc_MilsimTools_Core_RemoteExecForGivenPlayer;
*/
params ["_unit","_code"];
[[],_code] RemoteExec ["Spawn",_unit];