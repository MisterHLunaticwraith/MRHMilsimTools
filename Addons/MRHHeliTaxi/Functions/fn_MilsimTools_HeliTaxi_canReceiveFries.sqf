/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
_can = [typeOf vehicle player]call MRH_fnc_MilsimTools_HeliTaxi_canReceiveFries;
*/
#include "MRH_C_Path.hpp"
params["_className"];
private _config = configFile >> "CfgVehicles" >> _className;
(isNumber (_config >> "ace_fastroping_enabled"))