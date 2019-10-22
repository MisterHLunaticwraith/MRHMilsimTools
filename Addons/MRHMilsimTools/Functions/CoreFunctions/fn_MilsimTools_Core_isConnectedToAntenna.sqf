/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[MRH_player]call MRH_fnc_MilsimTools_Core_isConnectedToAntenna;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];
!(isNull (_unit getVariable ['MRH_AntennaLinkedToSoldierTablet',objNull]))