/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: can be called locally will find its way to the server do not remote exec
Return value: 
Public: No
Parameters:
0- <ARRAY> objects to add
Example(s):
[]call MRH_fnc_MilsimTools_Core_addObjectsToCurators;
*/
#include "MRH_C_Path.hpp"
if !(isServer) exitWith {[_this,MRH_fnc_MilsimTools_Core_addObjectsToCurators]remoteExec ["Call",2]};
params [
	["_objects",[],[[]]]
	];
{
	_x addCuratorEditableObjects [_objects,true ];
}forEach allCurators;