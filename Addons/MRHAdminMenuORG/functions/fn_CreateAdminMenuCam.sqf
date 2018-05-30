params ["_player"];
#include "MRH_components.hpp"
disableserialization;


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



FDIS(1202) ctrlSetText "#(argb,512,512,1)r2t(rttmrhtest,1.0)";

