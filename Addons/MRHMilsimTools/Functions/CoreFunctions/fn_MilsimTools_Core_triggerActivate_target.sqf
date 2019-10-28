/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[someTarget,someTrigger,true]call MRH_fnc_MilsimTools_Core_triggerActivate_target; //trigger will be reset afterwards and can still reactivate if its original conditions are met
or
[someTarget,someTrigger]call MRH_fnc_MilsimTools_Core_triggerActivate_target; //trigger won't be reset and stay activated unless set to repeatable (except for repatable triggers)
*/
#include "MRH_C_Path.hpp"
params ["_target","_trigger",["_reset",false]];
["MRH_Core_ActivateTrigger_event",[_trigger,_reset],_target] call CBA_fnc_targetEvent;