/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[this,WEST,true,"MyFantasticCrate"] call MRH_fnc_MilsimTools_InsertionHandler_isAirDropSupply;
*/
#include "MRH_C_Path.hpp"
params ["_object","_side",["_is",true],["_prettyName",""]];
_object setVariable ["MRH_InsertionHandler_isAirDropSupply_"+ (str _side),_is,true];
_nameToShow = "";
if !(_prettyName == "") then {_nameToShow = _prettyName}else
{_nameToShow = getText (configFile>>"cfgVehicles">>(typeOf _object)>>"displayName");};
_object SVAR(supplyDropName,_nameToShow,true);


