/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_addToGearListAction
Author: Mr H.
Description: adds object to list of objects loaded on board, refreshes lists. Called from button.
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_addToGearListAction;
*/
#include "MRH_C_Path.hpp"
_toAddStr= lbData [1502,(lbCurSel 1502)];
_spaceLeft = FUNC(checkCargoSpace);
if !(_spaceLeft) ExitWith {};
if (_toAddStr == "") ExitWith {systemChat (localize "STR_MRH_MRHInsertionHandler_noGearSelectSC")};
_toAdd = [_toAddStr,"Obj"] CFUNC(stringTo);
_toAdd SVAR(isLoaded,true,true);
FUNC(fillGearToGoList);
FUNC(fillGearLoadedList);
FUNC(refreshCargoRoomIntel);