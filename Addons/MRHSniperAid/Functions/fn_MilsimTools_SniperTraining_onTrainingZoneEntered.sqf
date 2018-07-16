/*
Function name:MRH_fnc_MilsimTools_SniperTraining_onTrainingZoneEntered
Author: Mr H.
Description: set of actions to do when a player enters a training zone.
Return value:
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_SniperTraining_onTrainingZoneEntered;
*/
#include "MRH_C_Path.hpp"
if !(player in _this) ExitWith {};
[] spawn {

waitUntil {player == player};
_ehFired = player addEventHandler ["FiredMan", {
_shooter = _this select 0;
_bullet = _this select 6;
_TimeFired = time;

[_bullet, _shooter] call MRH_fnc_MilsimTools_SniperTraining_BulletCam;
player setVariable ["MRH_BulletFiredTime" , _TimeFired, true];


 }];
 waituntil {!isnull (finddisplay 46)};
 player setVariable ["MRH_BulletCamUserPref", true];
_ehKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown",
{
	_toggleStatus = player getVariable 'MRH_BulletCamUserPref';
	if (isNil '_toggleStatus') then {_toggleStatus = false;};
	if ((_this select 1) == 57) then {
				if (_toggleStatus) then {_toggleStatus = false; hint (localize'STR_MRH_SniperTraining_BCOFF');} else { _toggleStatus = true; hint (localize 'STR_MRH_SniperTraining_BCON');};
									};
	player setVariable ['MRH_BulletCamUserPref', _toggleStatus];

if ((_this select 1) == 28) then {
_cam = player getVariable "MRH_BulletCam";
if (isNil "_cam") ExitWith {};
_cam cameraEffect ["terminate","back"];
camDestroy _cam;
};	
	
	}
];

player setVariable ["MRH_BulletCamEHsIndexes",[_ehFired,_ehKeyDown]];

hintC (localize "STR_MRH_SniperTraining_HintEntering");

};