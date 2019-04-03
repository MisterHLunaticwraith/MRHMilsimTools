/*
Function name:MRH_fnc_MilsimTools_HaloGear_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HaloGear_;
*/
#include "MRH_C_Path.hpp"
params ["_object"];

[[_object],
	{
		params	["_object"];
		//systemChat "removecalled";
		_formerHandle = _object getVariable ["MRH_AAD_ObjectScriptEH", scriptNull];
		//systemChat format ["former handle %1",_formerHandle];
		if !(isNull _formerHandle) then { 
			terminate _formerHandle; //systemChat "former handle is not null, removed"
		};
		_object setVariable ['MRH_HaloGear_itemAsAAD',nil,true];
	}] RemoteExec ["Call",2];