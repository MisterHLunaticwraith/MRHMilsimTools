/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_checkCargoSpace;
*/
#include "MRH_C_Path.hpp"
_planeType = lbData [2100,(lbCurSel 2100)];
_cargoSPace = ([_planeType]FUNC(readVehicleCfg)) select 1;
_currentAssigned = player GVARDef(playersToGo,[]);
_cargoItemsLoaded = (FUNC(sortGear)) select 0;
_cargoCount = (count _cargoItemsLoaded)*3;
if (((count _currentAssigned)+_cargoCount)>= _cargoSPace +1) ExitWith {false};
true