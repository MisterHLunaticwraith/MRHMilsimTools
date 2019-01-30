/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[handles] call MRH_fnc_MilsimTools_DebugTools_batchRemovePFEH;
*/
#include "MRH_C_Path.hpp"
params [["_handles",[]]];

{
	[_x] call CBA_fnc_removePerFrameHandler;
}forEach _handles;
_toTrace = format ["Handles removed: %1",_handles];
TRACE(_toTrace);