/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_EnhancedMap_;
*/
#include "MRH_C_Path.hpp"
//set map texture
_object = _this select 0;
_object FUNC(setMapTexture);


//add look at map action
_statement = {FUNC(lookAtMap);};
_loc = localize "STR_MRH_EnhancedMap_MapOnGroundOpenAction";
_action =
["MRH_EnhancedMapOpen", 
_loc,
 PAAPATH(map.paa),
_statement , 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
 
 //ad take map action
 _statement2 = {[_this select 0] FUNC(collectMap);};
_loc2 = localize "STR_MRH_EnhancedMap_MapOnGroundCollectAction";
_action2 =
["MRH_EnhancedMapCollect", 
_loc2,
 PAAPATH(fold.paa),
_statement2 , 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action2] call ace_interact_menu_fnc_addActionToObject;