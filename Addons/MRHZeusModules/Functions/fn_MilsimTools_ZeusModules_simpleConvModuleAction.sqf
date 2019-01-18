/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"
((findDisplay 11011982) getVariable 'MRH_ZeusModules_displayparams') params ['_logic','_unit'];
_display = findDisplay 11011982;
#define CTRLF(ARG) ((_display) displayCtrl ARG)

_DELETE = CTRLF(2800);
_removeAfterUse = cbChecked _DELETE;
_EDIT = CTRLF(1400);
_message = ctrlText _EDIT;

_logic addEventHandler ["Deleted", {
	params ["_entity"];
	_unit = _entity getVariable ["MRH_fnc_MilsimTools_ZeusModules_attachedUnit",objNull];
	[[_unit,0,["MRH_Conversation_MainConvAction","MRH_Simple_AceConversation"]],ace_interact_menu_fnc_removeActionFromObject] RemoteExec ["Call",0,true];
}];
[[_unit,_message,
{
	(_this select 1)params ["_unit","_logic","_removeAfterUse"];
	if (_removeAfterUse) then {deleteVehicle _logic};
}
,"LOCAL",_removeAfterUse,[_unit,_logic,_removeAfterUse]],MRH_fnc_simpleAceMessage] RemoteExec ["Call",0,true];
//deleteVehicle _logic;

_display setVariable ["MRH_ZeusModules_displayparams",nil];
closeDialog 0;