params ["_sourceObject"];
_statement= { (_this select 0) call MRH_fnc_targetSpawner;};
_action = ["OpenTargetSpawnerMenu", "Ouvrir le menu de spawn de cible.","", _statement , {true},{},[],[0,0,0], 5] call ace_interact_menu_fnc_createAction;
[_sourceObject, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
