/*
Function name: MRH_fnc_MilsimTools_Admin_PlayerCam
Author: Mr H.
Description:  creates pip cam for selected player
Return value: None
Public: No
Parameters: 0- <OBJECT> plyar to show
Example(s):
call MRH_fnc_MilsimTools_Admin_PlayerCam;
*/

params ["_player"];
#include "MRH_C_Path.hpp"
disableserialization;

if !(isNull curatorCamera) ExitWith {
	FDIS(1200) ctrlSetText PAAPATH(zeusview.paa);
	[(_player modelToWorld [0,2,3]),position _player,4] spawn BIS_fnc_setCuratorCamera;
};
_sstime = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _sstime select 0;
_sunset = _sstime select 1;
_missiontime = daytime;
_pip = "";

//nuit
if ((_missiontime < _sunrise) or (_missiontime > _sunset))
then { _pip = 1}
else
{_pip = 0};

_camMRHRoster = "camera" camCreate (_player modelToWorld [0,0.7,1.7]);

_camMRHRoster attachTo [_player, [0,3,3]];
_camMRHRoster camSetTarget _player;
_camMRHRoster cameraEffect ["internal", "BACK"];
_camMRHRoster camCommit 0;
_camMRHRoster cameraEffect ["internal","back","rttmrhtest"]; 
"rttmrhtest" setPiPEffect [_pip]; 



FDIS(1200) ctrlSetText "#(argb,512,512,1)r2t(rttmrhtest,1.0)";

