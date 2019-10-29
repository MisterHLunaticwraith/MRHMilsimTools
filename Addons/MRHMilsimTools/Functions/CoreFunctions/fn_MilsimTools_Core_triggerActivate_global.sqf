/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[someTrigger]call MRH_fnc_MilsimTools_Core_triggerActivate_global; 
//trigger won't be reset and stay activated unless set to repeatable (except for repatable triggers)

or
[someTrigger,true]call MRH_fnc_MilsimTools_Core_triggerActivate_global; //trigger will be reset afterwards and can still reactivate if its original conditions are met
*/
#include "MRH_C_Path.hpp"
params ["_trigger",["_reset",false]];

["MRH_Core_ActivateTrigger_event",[_trigger,_reset]] call CBA_fnc_globalEvent;