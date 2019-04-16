/*
Function name:MRH_fnc_deleteComposition
Author: Mr H.
Description: Deletes objects generated with MRH_fnc_spawnComposition around pivot, can optionaly delete objects within only a certain radius from given pivot object.

Return value: None

Public: Yes

Parameters:
0 -<OBJECT> pivot object, will not be deleted unless it is part of composition.
1 -<ARRAY> Array of object as returned by MRH_fnc_spawnComposition
2 - <NUMBER> Optional. Distance around pivot object under which object will be deleted. Useful to not delete objects like vehicles that players might have moved away from the composition. -1 (default value) will delete all composition objects anywhere 

Example(s):
[somePivotObject,someObjectsArray] call MRH_fnc_deleteComposition; //will delete all composition objects 
or
[somePivotObject,someObjectsArray,50] call MRH_fnc_deleteComposition; // will only delete composition objects that are within 50 meters of the pivot

*/
#include "MRH_C_Path.hpp"
_this CFUNC(cmpDeleteComp);