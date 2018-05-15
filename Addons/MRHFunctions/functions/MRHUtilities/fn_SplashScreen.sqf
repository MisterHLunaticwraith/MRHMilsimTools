/*
this function displays a fullscreen picture for the given duration
params are [pic,duration]
Returns true when done
eg
["myprettypic.paa", 10] call MRH_fnc_SplashScreen
*/

params ["_picpath","_duration"];

_core = [_picpath, _duration] spawn {

params ["_picpath","_duration"];

_x = -0.00531249 * safezoneW + safezoneX;
_y = -0.00399999 * safezoneH + safezoneY;
_w = 1.01063 * safezoneW;
_h = 1.008 * safezoneH;

with uiNamespace do { 
 titleImage = findDisplay 46 ctrlCreate ["RscPicture", -1]; 
 titleImage ctrlSetPosition [_x,_y,_w,_h]; 
 titleImage ctrlCommit 0; 
 titleImage ctrlSetText _picpath; 
};

sleep _duration;
with uiNamespace do {  

ctrlDelete titleImage; 
};

};

waitUntil {scriptDone _core};
true