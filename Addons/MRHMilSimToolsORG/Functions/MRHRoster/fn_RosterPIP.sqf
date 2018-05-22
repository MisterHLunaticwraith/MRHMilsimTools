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

_camMRHRoster = "camera" camCreate (player modelToWorld [0,0.7,1.7]);
_camMRHRoster attachTo [player, [0,0.7,1.5]];
_camMRHRoster camSetTarget player;
_camMRHRoster cameraEffect ["internal", "BACK"];
_camMRHRoster camCommit 0;
_camMRHRoster cameraEffect ["internal","back","rtt"]; 
"rtt" setPiPEffect [_pip]; 



((findDisplay 777) displayCtrl 1201) ctrlSetText "#(argb,512,512,1)r2t(rtt,1.0)";









/*
        _camMRHRoster cameraEffect ["TERMINATE", "BACK"];
        camDestroy _camMRHRoster;
        
      

with uiNamespace do {  
ctrlDelete pic; 
ctrlDelete back; 
};
*/
