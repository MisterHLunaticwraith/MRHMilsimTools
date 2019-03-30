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
_origin =  _fnc_scriptNameParent;
if (_origin == "MRH_fnc_MilsimTools_DebugTools_trace") then {_origin = "MRH_MilsimTools_UnknownFunction :"} else {_origin = _origin + ": ";};

//client name is either "Server", "player's name of the machine where it was executed + ownerID" or "headless"
_clientName = "";
switch (true) do {
	case (isServer && isDedicated) :{_clientName = "Server"};
	case (!hasInterface && !isServer) : {_clientName = "HC"};
	case (hasInterface && !isServer) : {_clientName = name player};
	case (isServer && !isDedicated && hasInterface): {_clientName = "Hosted by: "+ name player};
};
_localMachine =" -Locality: " + _clientName +" ID:" + str clientOwner;

// time stamp format date + missionstart
_missionStart = missionStart;
_missionStart params ["_year","_month","_day","_hours","_minutes","_seconds"];
_formatedDate = (str _day) +"/"+(str  _month) +"/"+ (str _year);
_time = [time,serverTime] select isServer;
if (!isMultiplayer) then {_time = time; _formatedDate = ""};
_logTime = [_time/6000,"HH:MM:SS:MM"] call BIS_fnc_timeToString;
_timestamp = _formatedDate + " at " + _logTime +" - ";



//final log message
_log = _origin + _timestamp + _message + _localMachine;
diag_log _log;

_isDebugMode = ["MRH_MilsimTools_DebugTools_isDebugMode"] call cba_settings_fnc_get;

if (_isDebugMode) then
{ 
_globalLog = missionNamespace getVariable ["MRH_MilsimTools_globalDebugLog",[]];
_globalLog pushBackUnique [servertime,clientOwner,_log];
missionNamespace setVariable ["MRH_MilsimTools_globalDebugLog",_globalLog,true];

_display = uiNamespace getVariable ["MRHDebugHintBox",displayNull];
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_CTRLTEXT =CTRLF(1234);
_CTRLTEXT ctrlSetText _log;


systemChat _log;
};