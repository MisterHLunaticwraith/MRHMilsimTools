/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
	params ["_pos"];
	
	_pos = [_pos select 0,_pos select 1,0];
	_inter = lineIntersectsSurfaces [_pos, _pos vectorAdd [0,0,-4999]];
	if (_inter isEqualTo []) exitWith {systemchat "depth error";0};
	_depth =((((_inter) select 0) select 0) select 2);


_depth