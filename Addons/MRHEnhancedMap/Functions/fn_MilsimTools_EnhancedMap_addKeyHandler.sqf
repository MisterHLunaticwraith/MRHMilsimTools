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

findDisplay 46 displayAddEventHandler ["KeyDown", 
{
    if (inputAction "showMap" >0) then {call MRH_fnc_MilsimTools_EnhancedMap_openMapInputAction;};
}];