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

[] spawn {
waitUntil {(player == player) && (!isNull (findDisplay 46))};
findDisplay 46 displayAddEventHandler ["KeyDown", 
{


if (inputAction "showMap" >0) then {call MRH_fnc_MilsimTools_EnhancedMap_openMapInputAction;};
}];

};








/*
["Open", "onEachFrame", {
    
    if (inputAction "ReloadMagazine" > 0) exitWith { // Check if "Reload" key is pressed
        ["Terminate"] call BIS_fnc_EGSpectator; 
        player enableSimulation true;
        [false] call acre_api_fnc_setSpectator;
        BIS_fnc_feedback_allowPP = true;
        ["exitSpect", "onEachFrame"] call BIS_fnc_removeStackedEventHandler; //  Remove the stackedEventHandler as we no longer need it
    };
}] call BIS_fnc_addStackedEventHandler;
*/