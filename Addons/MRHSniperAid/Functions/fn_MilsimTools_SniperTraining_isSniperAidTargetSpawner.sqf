/*
Function name:MRH_fnc_MilsimTools_SniperTraining_isSniperAidTargetSpawner
Author: Mr H.
Description: Turns an object into an access point for the target spawner interface  (ACE 3 interaction). Spawned target types must be defined in a cfgMRHTargets see online documentation for instructions.
Return value: None
Public: Yes
0-<OBJECT> Object to turn into an interface, will add ace interaction to the object
Parameters:
Example(s):
[this] call MRH_fnc_MilsimTools_SniperTraining_isSniperAidTargetSpawner;
*/
#include "MRH_C_Path.hpp"
params ["_sourceObject"];
_statement= { (_this select 0) call MRH_fnc_MilsimTools_SniperTraining_targetSpawner;};
_action = ["OpenTargetSpawnerMenu",(localize "STR_MRH_SniperTraining_OpenTargetAce"),"\MRHSniperAid\Paa\target.paa", _statement , {true},{},[],[0,0,0], 5] call ace_interact_menu_fnc_createAction;
[_sourceObject, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
