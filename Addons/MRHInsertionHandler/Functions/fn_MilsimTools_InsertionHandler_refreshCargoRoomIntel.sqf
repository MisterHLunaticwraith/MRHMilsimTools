/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_refreshCargoRoomIntel
Author: Mr H.
Description: Refreshes the cargo room intel control depending on the selected vehicle's available cargo space and current on board gear and players.
Return value:None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_refreshCargoRoomIntel;
*/
#include "MRH_C_Path.hpp"
_ctrlStrText = FDIS(1102);
_text = (localize "STR_MRH_MRHInsertionHandler_AvailCgStlotsVeh");

_planeType = lbData [2100,(lbCurSel 2100)];
_cargoSPace = ([_planeType]FUNC(readVehicleCfg)) select 1;
_currentAssigned = player GVARDef(playersToGo,[]);
_cargoItemsLoaded = (FUNC(sortGear)) select 0;
_cargoCount = (count _cargoItemsLoaded)*3;
_hasSpace = FUNC(checkCargoSpace);
_stats = str ((count _currentAssigned)+_cargoCount) + "/" + str _cargoSPace;
_color = "";
if !(_hasSpace) then {_color = "'#f90000'"} else {_color = "'#04ce69'"};
_statsTextColored = "<t color =" + _color+">" + _stats + "</t>";
_finalText = _text + " "+ _statsTextColored;
_ctrlStrText ctrlSetStructuredText parseText _finalText;