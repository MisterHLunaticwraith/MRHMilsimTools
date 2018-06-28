/*
Function name:MRH_fnc_Hack;
Author: Mr H.
Description: Makes the object hackable with the hacking tool
Return value: None
Public: Yes
Parameters:
0- <NUMBER> -Duration of the hack in seconds.
1-<OBJECT> - Object to add the action to
2 - <STRING> - "HackName" when the hack is complete a public variable (value = true) will be created. Can be anything but must be a single word and must not contain spaces
3- <CODE> -Optional - Code to execute upon completion of the hack, canSuspend = true, must be stated between {}, source object (parameter 1) is passed to the code and can be retrieved.
Example(s):
[20,this,"testhack"] call MRH_fnc_Hack;
or
[20,this,"yourHackName",{deleteVehicle (_this select 0); player setDamage 0.5; hint 'The laptop was booby trapped'}] call MRH_fnc_Hack; // will delete the source object and damage the player
*/
#include "MRH_C_Path.hpp"
params ["_HackTime", "_SourceObject", "_HackName",["_code",{}]];
_SourceObject SVAR(progressdone, 0,false);
_sourceobject SVAR(speedyinterrupt,0,false);
_SourceObject SVAR(HackTime, _HackTime,false);
_SourceObject SVAR(HackName, _HackName,false);
_sourceobject SVAR(hackCodeToRun, _code,false);
[_SourceObject] FUNC(HackAddAceAction);
