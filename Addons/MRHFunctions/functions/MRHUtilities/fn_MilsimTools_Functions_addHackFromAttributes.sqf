/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call ;
*/
#include "MRH_C_Path.hpp"

if (is3DEN) exitWith {};
_statement = {
params ["_object"];
	
 	_duration = _object getVariable ["MRH_objectHackDuration","10"];
	_duration = parseNumber _duration;

	_fileSize = _object getVariable ["MRH_objectHackFileSize","10"];
	_fileSize = parseNumber _fileSize;

	_dataReceived = _object getVariable ["MRH_objectHackDataReceived","[]"];
	_dataReceived = call compile _dataReceived;

	_picturesReceived = _object getVariable ["MRH_objectHackPicturesReceived","[]"];
	_picturesReceived = call compile _picturesReceived;

	_funcParams = [_object,_duration,_fileSize,_dataReceived,_picturesReceived];
	_message = format ["MRH Hack and download from attributes added to %1 with parameters %2",_object,_funcParams];

	TRACE(_message);

	_funcParams call MRH_fnc_hackDownloadAndCollectData;
};
[
    {time>0}, 
    _statement, 
    _this
] call CBA_fnc_waitUntilAndExecute;