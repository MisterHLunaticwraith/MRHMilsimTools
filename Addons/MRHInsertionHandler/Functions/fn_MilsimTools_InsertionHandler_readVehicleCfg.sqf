/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_readVehicleCfg
Author: Mr H.
Description: reads configfile to get vehicle info
Return value: <ARRAY> 0-displayname 1-cargoslots 2-maxspeed
Public:No
Parameters:
0-<STRING> vehicle config classname
Example(s):
[typeOf (vehicle player)] call MRH_fnc_MilsimTools_InsertionHandler_readVehicleCfg;
*/
#include "MRH_C_Path.hpp"
params ["_classname"];

_displayName = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
_cargoSlots = getNumber (configFile >> "CfgVehicles" >> _classname >> "transportSoldier");
_maxSpeed = getNumber (configFile >> "CfgVehicles" >> _classname >> "maxSpeed");
_return = [_displayName,_cargoSlots,_maxSpeed];
_return