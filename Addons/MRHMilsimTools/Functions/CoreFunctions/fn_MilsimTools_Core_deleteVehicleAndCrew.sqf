/*
Function name:MRH_fnc_MilsimTools_Core_deleteVehicleAndCrew
Author: Mr H.
Description: Deletes a vehicle and all units onboardit
Return value: none
Public: No
Parameters:
0 <OBJECT> -vehicle to delete
Example(s):
[myHeli]call MRH_fnc_MilsimTools_Core_deleteVehicleAndCrew;
*/
#include "MRH_C_Path.hpp"
params ["_veh"];
{deleteVehicle _x;}forEach crew _veh;
deleteVehicle _veh;