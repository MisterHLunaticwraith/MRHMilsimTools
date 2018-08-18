/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_removeFromPlayerListAction;
*/
#include "MRH_C_Path.hpp"
_toRemoveStr= lbData [1501,(lbCurSel 1501)];

if (_toRemoveStr == "") ExitWith {systemChat (localize "STR_MRH_MRHInsertionHandler_noPlayerSelectedSC")};
_toRmv = [_toRemoveStr,"PlUnits"] CFUNC(stringTo);
[_toRmv,"playersToGo"] FUNC(removeFromVarList);
FUNC(fillPlayersToGoList);
FUNC(fillPlayersToAddList);