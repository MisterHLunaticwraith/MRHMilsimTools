/*
Function name:MRH_fnc_MilsimTools_SniperTraining_
Author: Mr H.
Description: Creates the bullet cam.
Return value: None
Public: No
Parameters:
0- <OBJECT> Bullet
1- <OBJECT> Shooter
Example(s):
call MRH_fnc_MilsimTools_SniperTraining_;
*/
#include "MRH_C_Path.hpp"

params ["_bullet","_shooter"];

_toggled = _shooter getVariable "MRH_BulletCamUserPref";
//if (isNil "_toggled") then {_toggled = false;};
if (!_toggled) exitWith {}; 

[_bullet,_shooter] spawn {
params ["_bullet","_shooter"];

#include "MRH_C_Path.hpp"


 _camera = "camera" camCreate (getPos _bullet); 
_shooter setVariable  ["MRH_BulletCam", _camera];
 _camera cameraEffect ["internal", "BACK"]; 
 _camera camCommand "inertia on"; 
 _camera attachTo [_bullet, [0,-1,0]];
 _camera camPrepareTarget _bullet; 
 _camera camPrepareFOV 1; 
 _camera camCommitPrepared 0;
_bulletInTheAir = true;
_shooter setVariable ["MRH_BulletCamOn", _bulletInTheAir];

[_bullet, _shooter] spawn {
params ["_bullet", "_shooter"];
while {_shooter getVariable "MRH_BulletCamOn"} do {
_speed = speed _bullet;
_distance = _bullet distance _shooter;
_text =  format [(localize "STR_MRH_SniperTraining_SpeedAndDist"), str _speed, str _distance];
//hint _text;
//titleText [_text, "PLAIN", -1, false, false]; 
   [_text, 0, 0, 0.0001,0.00001] call BIS_fnc_dynamicText;
};
};
waitUntil {(isNull _bullet)};
_bulletInTheAir = false;
_shooter setVariable ["MRH_BulletCamOn", _bulletInTheAir];
 _camera cameraeffect ["terminate", "back"];
		camDestroy _camera;
		};
