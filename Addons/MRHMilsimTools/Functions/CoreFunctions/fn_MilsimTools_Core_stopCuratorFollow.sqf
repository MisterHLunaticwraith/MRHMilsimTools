/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_handle"];
[_handle] call CBA_fnc_removePerFrameHandler;

player setVelocity [0,0,0];
_pos = uiNamespace getVariable "MRH_ACREcompatibleCuratorCam";
player setPosATL _pos;
[[vehicle player],{params ["_curatorVeh"];_curatorVeh hideObjectGlobal false}] RemoteExec ["Call",2];
player enableSimulation true;
player allowDamage true;
systemChat (localize "STR_MRH_ZEUS_Toggle_ToggledOff");

_message = format ["Milsim Tools - Invisible curator PFEH removed with handle %1",_handle];
TRACE(_message);