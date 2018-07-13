if !(player in _this) ExitWith {};
[] spawn {

waitUntil {player == player};
_ehFired = player addEventHandler ["FiredMan", {
_shooter = _this select 0;
_bullet = _this select 6;
_TimeFired = time;

[_bullet, _shooter] call MRH_fnc_BulletCam;
player setVariable ["MRH_BulletFiredTime" , _TimeFired, true];


 }];
 waituntil {!isnull (finddisplay 46)};
 player setVariable ["MRH_BulletCamUserPref", true];
_ehKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown",
{
	_toggleStatus = player getVariable 'MRH_BulletCamUserPref';
	if (isNil '_toggleStatus') then {_toggleStatus = false;};
	if ((_this select 1) == 57) then {
				if (_toggleStatus) then {_toggleStatus = false; hint 'Bullet Cam: Off';} else { _toggleStatus = true; hint 'Bullet Cam: On';};
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

hintC "Vous entrez dans une zone d'entraînement. Dans cette zone le Bullet Cam est actif, appuyez sur ESPACE pour l'activer et le désactiver et sur ENTREE pendant le Bullet Cam pour quitter.";

};