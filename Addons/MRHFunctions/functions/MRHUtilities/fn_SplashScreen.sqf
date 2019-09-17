/*
Function name:MRH_fnc_SplashScreen
Author: Mr H.
Description: Displays a picture fullscreen for the given time.
Return value: None
Public: Yes
Parameters:
0- <STRING> - Path to the picture, the picture can be in .paa or .jpeg format.
1- <NUMBER> - duration in seconds the picture will stay on screen.
Example(s):
["myprettypic.paa", 10] call MRH_fnc_SplashScreen;
*/


params ["_picpath","_duration"];

_core = [_picpath, _duration] spawn {

params ["_picpath","_duration"];

_x = -0 * safezoneW + safezoneX;
_y = 0 * safezoneH + safezoneY;
_w = 1 * safezoneW;
_h = 1 * safezoneH;

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