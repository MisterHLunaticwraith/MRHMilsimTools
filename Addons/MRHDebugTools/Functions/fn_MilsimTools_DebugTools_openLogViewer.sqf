/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_openLogViewer;
*/
#include "MRH_C_Path.hpp"
if !(IS_DEBUG) exitWith {};
createDialog "MRHLogViewer";
TRACE("log opened");
_display = findDisplay 300119;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_LOGTEXT = CTRLF(1100);
_log = missionNamespace getVariable ["MRH_MilsimTools_globalDebugLog",[]];
_logToPrint = "";


_colorTime = "#9e6209";
_colorRed = "#ff0202";
_colorGreen = "#06ff02";
#define PPLUS +
#define COLOUR(ARG,ARG1) "<t color='" PPLUS ##ARG## PPLUS "'>" PPLUS ##ARG1## PPLUS "</t>"
#define GREENSTRING(ARG) COLOUR(_colorGreen,ARG)
#define ORSTRING(ARG) COLOUR(_colorTime,ARG)
#define REDSTRING(ARG) COLOUR(_colorRed,ARG)


{
	_x params ["_time","_owner","_logEntry"];
	_timeStamp = [_time/6000,"HH:MM:SS:MM"] call BIS_fnc_timeToString;
	 _subText = ORSTRING(_timeStamp) +" " +"owner :"+" "+ ([GREENSTRING(str _owner),REDSTRING(str _owner)] select (_owner ==2)) + " " + _logEntry + "<br/>";
	_logToPrint = _logToPrint + _subText;

}forEach _log;

_LOGTEXT ctrlSetStructuredText parseText _logToPrint;
CTRLRSZ(1100);
