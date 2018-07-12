/*
Function name:MRH_fnc_MilsimTools_Core_RemoteFor
Author: Mr H.
Description: Executes the given code on targeted player's machine, script accepts suspension
Return value: true when done false, if param 1 is not a number or 2 invalid code
Public: Yes
Parameters: 
0 - <STRING> - targeted Player steam UID
1 - <CODE> code to remote exec, must be stated between {}
2 - <ARRAY> -Optional - Array of passed parameters
Example(s):
[some player UID,{some script},[]] call MRH_fnc_MilsimTools_Core_RemoteFor;
or
{
[getPlayerUID _x, {player moveinCargo (_this select 0)},[somevehicle]] call MRH_fnc_MilsimTools_Core_RemoteFor;
} ForEach [player1,player2,player3];
*/
//toDo make params Optional
params ["_uid","_code","_passedParams"];
if (typeName _uid != "STRING") ExitWith {Diag_Log format ["MRH_MilsimTools_Core_RemoteFor - Error UID: %1 is not a string", str _uid]; false};
if (typeName _code != "CODE") ExitWith {Diag_Log format ["MRH_MilsimTools_Core_RemoteFor - Error Param 1 must be Code: %1 is not a valid code, rember to use {} delimiters", str _code]; false};
//if (isNil _passedParams) then {_passedParams = []};
if (typeName _passedParams != "ARRAY") then {_passedParams =[]; Diag_Log format ["MRH_fnc_MilsimTools_Core_RemoteFor - Passed parameter %1 is not an array, function was executed with [] empty array as a parameter"]};
[[_uid,_passedParams,_code],MRH_fnc_MilsimTools_Core_RemoteForServer] RemoteExec ["Call",2];