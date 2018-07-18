/*
Function name:MRH_fnc_MilsimTools_Core_resultForSide
Author: Mr H.
Description: returns <ARRAY> of results set for object's side
Return value: 
Public: No
Parameters:
0 - <OBJECT> object whose sides will be used
1 - <ANY> anything that will be returned if side is BLUFOR
2 - <ANY> anything that will be returned if side is OPFOR - optionnal, will return empty string if not set
3 - <ANY> anything that will be returned if side is INDEPENDANT - optionnal, will return empty string if not set
4 - <ANY> anything that will be returned if side is CIVILIANS - optionnal, will return empty string if not set
Example(s):
[player,"BF","OF","INDE","CIV"]call MRH_fnc_MilsimTools_Core_resultForSide; // will return <STRING> CIV if player is a civilian
[player,1,2,3,4]call MRH_fnc_MilsimTools_Core_resultForSide; // will return <NUMBER> 4  if player is a civilian
*/
//#include "MRH_C_Path.hpp"
params ["_sideObject","_forBluFor",["_forOpFor",""],["_forInde",""],["_forCivs",""]];
_result = "";
_side = side _sideObject;
	switch (true)do 
	{
	case (_side == west):{_result = _forBluFor};
	case (_side == east):{_result = _forOpFor};
	case (_side == resistance):{_result = _forInde};
	case (_side == civilian):{_result = _forCivs};
	default {_result = ""};
	};
_result