/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_removeFromPlayerListAction
Author: Mr H.
Description: Removes given unit from the list of onboard units, called from button
Return value: None
Public: No
Parameters: None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_removeFromPlayerListAction;
*/
#include "MRH_C_Path.hpp"
_toRemoveStr= lbData [1501,(lbCurSel 1501)];

if (_toRemoveStr == "") ExitWith {systemChat (localize "STR_MRH_MRHInsertionHandler_noPlayerSelectedSC")};
_toRmv = [_toRemoveStr,"AllUnits"] CFUNC(stringTo);
[_toRmv,"playersToGo"] FUNC(removeFromVarList);
FUNC(fillPlayersToGoList);
FUNC(fillPlayersToAddList);