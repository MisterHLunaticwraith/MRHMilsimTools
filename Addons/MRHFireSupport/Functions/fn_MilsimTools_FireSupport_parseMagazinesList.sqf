/*
Function name:MRH_fnc_MilsimTools_FireSupport_parseMagazinesList
Author: Mr H.
Description: Unaptly named, also used elsewhere for other purposes, converts a string of words separated by comas into an array of strings
Return value:
<ARRAY> of strings, used for classnames 
Public:No
Parameters:
<STRING> expressions separated by ,
Example(s):
["I_Heli_Transport_02_F,I_Heli_light_03_unarmed_F,I_C_Plane_Civil_01_F"] call MRH_fnc_MilsimTools_FireSupport_parseMagazinesList
// returns: ["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F","I_C_Plane_Civil_01_F"]

*/
#include "MRH_C_Path.hpp"
params ["_string"];

_resultingArray = _string splitString ",";
_resultingArray