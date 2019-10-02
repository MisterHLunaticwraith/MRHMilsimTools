/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
_this spawn {
if (is3DEN) exitWith {["MRH BioScanner handle actions exited: is3Den"] call MRH_fnc_MilsimTools_DebugTools_trace;};
waitUntil {time>1};
[_this,
	{
	params ["_object","_code","_part"];

	_use = _object getVariable ['MRH_BS_UseCustomActions',false];
	if !(_use) exitWith {_message = format ["MRH Bioscanner handle actions: setting to not use action for %1",_object]; [_message] call MRH_fnc_MilsimTools_DebugTools_trace;};


	_actionName = ""; _loc = ""; _mempoint = "";
	switch (true) do 
	{
		case (_part == "main") : {_actionName = "MRH_Scanner_MainScreenAction"; _loc = "STR_MRH_MRHMiscItems_touchScreenAction"; _mempoint = "mem01";};
		case (_part == "eye") : {_actionName = "MRH_Scanner_EyeScanner"; _loc = "STR_MRH_MRHMiscItems_scanEyesAction"; _mempoint = "mem03";};
		case (_part == "hand") : {_actionName = "MRH_Scanner_handScan"; _loc = "STR_MRH_MRHMiscItems_scanHandAction"; _mempoint = "mem02";};
	};

		_statement = {
			_this spawn {

					(_this select 2) params ["_scanner","_code","_part"]; 
					_code = "params ['_scanner','_player'];" + _code;
					if (_part == "hand") then 
						{
							playSound3D ["MRHMiscItems\Sounds\scanSound.ogg", _scanner];
							_videohand = [_scanner,"\MRHMiscItems\Videos\handScanHandScreen.ogv",1] spawn MRH_fnc_MilsimTools_Core_playVideoOnObject;
							waitUntil {scriptDone _videohand};
							playSound3D ["MRHMiscItems\Sounds\computerInterface.ogg", _scanner];
							_videoMain = [_scanner,"\MRHMiscItems\Videos\handScanMainScreen.ogv",0] spawn MRH_fnc_MilsimTools_Core_playVideoOnObject;
							waitUntil {scriptDone _videoMain};
							[_scanner,player,_code,_part] FUNC(processCode);
							_scanner setVariable ["MRH_playerHasScannedHand",true];
						};
					if (_part == "main") then 
					{
						playSound3D ["MRHMiscItems\Sounds\computerInterface.ogg", _scanner];
						_videoMain = [_scanner,"\MRHMiscItems\Videos\screenActivity.ogv",0] spawn MRH_fnc_MilsimTools_Core_playVideoOnObject;
						waitUntil {scriptDone _videoMain};
						[_scanner,player,_code,_part] FUNC(processCode);
					};
					if (_part == "eye") then 
					{
						playSound3D ["MRHMiscItems\Sounds\scanSound.ogg", _scanner];
						_videoEye = [_scanner,"\MRHMiscItems\Videos\eyeScan.ogv",0] spawn MRH_fnc_MilsimTools_Core_playVideoOnObject;
						waitUntil {scriptDone _videoEye};
						[_scanner,player,_code,_part] FUNC(processCode);
						_scanner setVariable ["MRH_playerHasScannedEye",true];
					};
				[_scanner] spawn 
					{
						params ["_scanner"]; sleep 77; _scanner setVariable ["MRH_playerHasScannedHand",nil];_scanner setVariable ["MRH_playerHasScannedEye",nil];
					};
					
				};
			};
		_action =
		[
		_actionName, //actionname
		localize _loc, // action displayname
		"", //iconstring
		_statement , //statement
		{true},//condition
		{},
		[_object,_code,_part],
		_mempoint, 
		5] call ace_interact_menu_fnc_createAction;


			private _message = format ["MRH BioScanner ace action added to %1, action name %2",_object,_actionName];
			[_message] call MRH_fnc_MilsimTools_DebugTools_trace;
			[_object, 0, [_actionName], _action] call ace_interact_menu_fnc_addActionToObject;
	}]RemoteExec ["Call",0,true];
};