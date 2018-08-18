/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_addToPlayerListAction;
*/
#include "MRH_C_Path.hpp"
_toAddStr= lbData [1500,(lbCurSel 1500)];
_spaceLeft = FUNC(checkCargoSpace);
if !(_spaceLeft) ExitWith {FUNC(fillPlayersToGoList);};
if (_toAddStr == "") ExitWith {systemChat (localize "STR_MRH_MRHInsertionHandler_noPlayerSelectedSC")};
_toAdd = [_toAddStr,"PlUnits"] CFUNC(stringTo);
[_toAdd,"playersToGo"] FUNC(addToVarList);
FUNC(fillPlayersToGoList);
FUNC(fillPlayersToAddList);