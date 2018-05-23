/*
Function name: MRH_fnc_MilsimTools_Jip_isJipMenuAccessPoint
Author: Mr H.
Description: makes any object a jip menu access point with ace action
Return value: None
Public: Yes
Parameters:
0- <OBJECT> object to add the action to
Example(s):
[this] call MRH_fnc_MilsimTools_Jip_isJipMenuAccessPoint;
*/

[ _this select 0]spawn 
{
#include "MRH_C_Path.hpp"

_object = _this select 0;
_statement = {call MRH_fnc_MilsimTools_Jip_Open_Menu;};
_loc = localize "STR_MRH_JIP_ACEINTERACTTEXT"; 
_action =
["JIPMENUOPEN", 
_loc,
 GUIPATH(jipicon.paa),
_statement , 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 };