/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_;
*/
#include "MRH_C_Path.hpp"
	params ["_unit"];
	if !(_unit isEqualTo MRH_player) exitWith {}; // safety against multiple exec
	if !(hasInterface) exitWith {}; // double surfaceType
	playsound "MRH_InsertionHandler_subAmbiant";
	[] spawn {["\MRHInsertionHandler\Paa\subtransfer.paa", 16] call MRH_fnc_SplashScreen;};
	sleep 16;
	hintC (localize "STR_MRH_MRHInsertionHandler_SubTakeLocMess");