/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_trace;
*/
#include "MRH_C_Path.hpp"
params [["_message", "no message", [""]]];
if (is3DEN) exitWith {};
// where the func was called from will set the log's name
private _origin =  _fnc_scriptNameParent;
if (_origin == "MRH_fnc_MilsimTools_DebugTools_trace") then {_origin = "MRH_MilsimTools_UnknownFunction :"} else {_origin = _origin + ": ";};

//client name is either "Server", "player's name of the machine where it was executed + ownerID" or "headless"
private _clientName = "";
switch (true) do {
	case (isServer && isDedicated) :{_clientName = "Server"};
	case (!hasInterface && !isServer) : {_clientName = "HC"};
	case (hasInterface && !isServer) : {_clientName = name player};
	case (isServer && !isDedicated && hasInterface): {_clientName = "Hosted by: "+ name player};
};
private _localMachine =" -Locality: " + _clientName +" ID:" + str clientOwner;

// time stamp format date + missionstart
private _missionStart = missionStart;
_missionStart params ["_year","_month","_day","_hours","_minutes","_seconds"];
private _formatedDate = (str _day) +"/"+(str  _month) +"/"+ (str _year);
private _time = [time,serverTime] select isServer;
if (!isMultiplayer) then {_time = time; _formatedDate = ""};
private _logTime = [_time/6000,"HH:MM:SS:MM"] call BIS_fnc_timeToString;
private _timestamp = _formatedDate + " at " + _logTime +" - ";


private _doLog = ["MRH_MilsimTools_DebugTools_DoLogDebugMode"] call cba_settings_fnc_get;
private _isDebugMode = ["MRH_MilsimTools_DebugTools_isDebugMode"] call cba_settings_fnc_get;

//final log message
private _log = _origin + _timestamp + _message + _localMachine;

if (_doLog || _isDebugMode) then 
{
	diag_log _log;
};



if (_isDebugMode) then
{ 
private _globalLog = missionNamespace getVariable ["MRH_MilsimTools_globalDebugLog",[]];
_globalLog pushBackUnique [servertime,clientOwner,_log];
missionNamespace setVariable ["MRH_MilsimTools_globalDebugLog",_globalLog,true];

private _display = uiNamespace getVariable ["MRHDebugHintBox",displayNull];
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_CTRLTEXT =CTRLF(1234);
_CTRLTEXT ctrlSetText _log;


systemChat _log;
};