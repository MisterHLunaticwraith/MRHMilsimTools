/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_EnhancedMap_;
*/
#include "MRH_C_Path.hpp"
_map = "MRH_MapObject" createVehicle (MRH_player modelToWorld [0,1,0.6]);
//_map setPos (player modelToWorld [0,1,0]);
//[player, _map] call ace_dragging_fnc_carryObject;
[MRH_player, _map] call ace_dragging_fnc_startCarry;
MRH_player removeItem "MRH_Map";
FUNC(closeFoldableMap); //to be on the safe side
FUNC(playRandomSound);