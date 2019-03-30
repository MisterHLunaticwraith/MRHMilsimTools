/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_;
*/
#include "MRH_C_Path.hpp"

if (IS_DEBUG) then {hint "isDebug"} else {hint "is NOT Debug"};

_something = 1;
_toTrace = format ["something, %1",_something];
TRACE(_toTrace);