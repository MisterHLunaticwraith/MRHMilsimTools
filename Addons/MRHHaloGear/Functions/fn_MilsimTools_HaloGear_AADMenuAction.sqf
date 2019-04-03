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
(_this select 0 ) params ["_display","_key"];
//systemChat str _display;
_object = _display getVariable ["MRH_AAD_InterfaceHandlingObject",objNull];
_object setVariable ['MRH_HaloGear_AADOpening_alt',ctrlText 1400,true]; hint format [localize 'STR_MRH_MRHHaloGear_AADHint',(ctrlText 1400)];
if !(isPlayer _object) then 
{
	//if is not a player, script must be handled by the server
	[[_object],
	{
		params	["_object"];
		_formerHandle = _object getVariable ["MRH_AAD_ObjectScriptEH", scriptNull];
		if !(isNull _formerHandle) then { terminate _formerHandle};
		_handle  = [_object] spawn MRH_fnc_MilsimTools_HaloGear_objectAADEH;
		_object setVariable ["MRH_AAD_ObjectScriptEH", _handle,true];
	}] RemoteExec ["Call",2];
	
};