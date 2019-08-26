/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_addToPlayerListAction
Author: Mr H.
Description: Adds select unit to the list of onboard units
Return value: None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_addToPlayerListAction;
*/
#include "MRH_C_Path.hpp"
_toAddStr= lbData [1500,(lbCurSel 1500)];
_spaceLeft = FUNC(checkCargoSpace);
if !(_spaceLeft) ExitWith {FUNC(fillPlayersToGoList);};
if (_toAddStr == "") ExitWith {systemChat (localize "STR_MRH_MRHInsertionHandler_noPlayerSelectedSC")};
_toAdd = [_toAddStr,"AllUnits"] CFUNC(stringTo);
[_toAdd,"playersToGo"] FUNC(addToVarList);
FUNC(fillPlayersToGoList);
FUNC(fillPlayersToAddList);