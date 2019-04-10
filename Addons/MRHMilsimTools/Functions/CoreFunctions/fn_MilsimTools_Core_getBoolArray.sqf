/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Larrow (thx!)
Description: 
Return value:
NOTE doesn't work for nested arrays and only works if array only contains BOOLS 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params[ "_path" ];

   getArray( _path ) apply{ _x == "true" }