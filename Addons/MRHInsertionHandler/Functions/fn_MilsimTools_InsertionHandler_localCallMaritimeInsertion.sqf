/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_;
*/
#include "MRH_C_Path.hpp"
		params [
		["_units",[],[[]]],
		["_side",WEST,[sideUnknown]],
		["_position",[0,0,0],[[]],3]
	];



	[[_units,_side,_position],MRH_fnc_MilsimTools_InsertionHandler_serverCallMaritimeInsertion] remoteExec ["Call",2];
