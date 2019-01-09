/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_removeFromGearListActio
Author: Mr H.
Description: Called from button, removes selected gear from onboard list gear
Return value: None
Public:No
Parameters: None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_removeFromGearListAction;
*/
#include "MRH_C_Path.hpp"
_toAddStr= lbData [1503,(lbCurSel 1503)];
if (_toAddStr == "") ExitWith {systemChat (localize "STR_MRH_MRHInsertionHandler_noGearSelectSC")};
_toAdd = [_toAddStr,"Obj"] CFUNC(stringTo);
_toAdd SVAR(isLoaded,false,true);
FUNC(fillGearToGoList);
FUNC(fillGearLoadedList);
FUNC(refreshCargoRoomIntel);