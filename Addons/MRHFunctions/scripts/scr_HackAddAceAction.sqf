_object = _this select 0;

_statement = {
_object = _this select 0;
[_object] execVM "\MRHFunctions\scripts\scr_Hack.sqf";

};

_action =
["hack", 
" Pirater",
 "\MRHFunctions\img\icons\hack.paa", 
 
_statement 


, 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 
