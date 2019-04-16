/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call ;
*/
#include "MRH_C_Path.hpp"
params ["_tent"];
////0 = closed //1 = open
[false,true] select (_tent animationSourcePhase "Door_Hide")