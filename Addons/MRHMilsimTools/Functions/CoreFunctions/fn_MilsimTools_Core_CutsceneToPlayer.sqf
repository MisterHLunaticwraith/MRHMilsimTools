/*
Function name:MRH_fnc_MilsimTools_Core_CutsceneToPlayer
Author: Mr H.
Description: plays a video where cam is created from above player to reach inside player's head, follows player's vehicle if player is in a vehicle
Return value: none
Public: No
Parameters:
call MRH_fnc_MilsimTools_Core_CutsceneToPlayer;
*/
[] spawn {
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

	sleep 3;
	_introcam camPreparePos _pos2;
	_introcam camPrepareTarget _playercam;
	_introcam camPrepareFOV 1;
	_introcam camCommitPrepared 3;
	sleep 3;

	// destroy cameras after cutscene
	camDestroy _introcam;
	camDestroy _playercam;
	player cameraEffect ["terminate","back"];
};
