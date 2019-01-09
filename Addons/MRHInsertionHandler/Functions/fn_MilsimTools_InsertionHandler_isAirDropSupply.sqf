/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_isAIrDropSupply
Author: Mr H.
Description: makes object available in the planner, with optional custom set name
Return value: None
Public: Yes
Parameters:
0-<OBJECT> - object to add.
1- <SIDE> - side it will be available for
2- <BOOLEAN> - optional true to add object, false to remove, default true
3- <STRING> -optional custom name to display in the planner, requires parameter 2 to be set to true.
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


