/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_reassignCaller;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_reassignCaller;
*/
#include "MRH_C_Path.hpp"
params ["_caller"];
_candidates = [group _caller]CFUNC(getAliveAndConsciousGrpMembers);
if (_candidates isEqualTo []) exitWith {TRACE("MRH_MilsimTools_HeliTaxi: no replacement caller found"); _caller};
_newCaller = selectRandom _candidates;
_myvec = (group _caller) GVAR(slavedHeli); //used heli
_myvec SVAR(caller,_newCaller,true);// person that called the heli 
_toTrace = format ["MRH_MilsimTools_HeliTaxi: new called assigned %1", _newCaller];
TRACE(_toTrace);
_newCaller