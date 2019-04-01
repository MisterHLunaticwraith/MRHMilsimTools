/*
Function name:MRH_fnc_MilsimTools_Core_CutsceneToPlayer
Author: Mr H.
Description: plays a video where cam is created from above player to reach inside player's head, follows player's vehicle if player is in a vehicle
Return value: none
Public: No
Parameters:
call MRH_fnc_MilsimTools_Core_CutsceneToPlayer;
*/

///create cameras for cutscene
_pos1= player modelToWorld [0,-50, 50];
_pos2= player modelToWorld [0.3,0.3, 1.6];
_introcam = "camera" camCreate  _pos1;
_playercam = "camera" camCreate _pos2;
_playercam attachTo [vehicle player,[0.3,0.3, 1.6]];
//start cutscene
_introcam cameraEffect ["internal", "BACK"]; 
_introcam camCommand "inertia on"; 
_introcam camPrepareTarget _playercam; 
_introcam camPrepareFOV 0.5; 
_introcam camCommitPrepared 0;

[{
	params ["_pos1","_pos2","_introcam","_playercam"];
		_introcam camPreparePos _pos2;
		_introcam camPrepareTarget _playercam;
		_introcam camPrepareFOV 1;
		_introcam camCommitPrepared 3;


}, [_pos1,_pos2,_introcam,_playercam], 3] call CBA_fnc_waitAndExecute;


[{
	params ["_pos1","_pos2","_introcam","_playercam"];

		camDestroy _introcam;
		camDestroy _playercam;
		player cameraEffect ["terminate","back"];
	
}, [_pos1,_pos2,_introcam,_playercam], 6] call CBA_fnc_waitAndExecute;
	// destroy cameras after cutscene


