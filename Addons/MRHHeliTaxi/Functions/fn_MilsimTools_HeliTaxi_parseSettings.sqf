/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_parseSettings;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_parseSettings;
*/
#include "MRH_C_Path.hpp"
if (!isServer) ExitWith {};
_numberAvailable = ["MRH_MilsimTools_Heli_NumberSimulTPerSide"] call cba_settings_fnc_get;
_numberAvailable = parseNumber _numberAvailable;
_numberAvailable = floor _numberAvailable;
if (_numberAvailable <1) then {_numberAvailable =1};

missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_" + "EAST",_numberAvailable,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_" + "WEST",_numberAvailable,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_" + "GUER",_numberAvailable,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_" + "CIV",_numberAvailable,true];
