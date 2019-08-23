/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_checkForAllClear
Author: Mr H.
Description: Cheks that all conditions are met to start the insertion
Return value: <BOOL> -true if all are met false otherwise
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_checkForAllClear;
*/
#include "MRH_C_Path.hpp"
_positionSet = true;
if (getMarkerColor "MRH_LZ_Marker" == "") then {_positionSet = false};

_cargoSpaceClear = FUNC(checkCargoSpace);

_playersListClear = (count (MRH_player GVARDef(playersToGo,[]))) >=1;


_allClear = false;
if (_positionSet && _cargoSpaceClear && _playersListClear) then{_allClear = true};
_return = [_allClear,_positionSet,_cargoSpaceClear,_playersListClear];
_return