/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[20,this,"testhack"] call MRH_fnc_Hack;
*/
#include "MRH_C_Path.hpp"
params ["_HackTime", "_SourceObject", "_HackName",["_code",{}]];
_SourceObject SVAR(progressdone, 0,false);
_sourceobject SVAR(speedyinterrupt,0,false);
_SourceObject SVAR(HackTime, _HackTime,false);
_SourceObject SVAR(HackName, _HackName,false);
_sourceobject SVAR(hackCodeToRun, _code,false);
[_SourceObject] FUNC(HackAddAceAction);
