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

	params ["_pivot",["_distance",-1],["_isForCfg",false]];
	_allObjects = [];
	_allMission= allMissionObjects "All";
	_distanceCond = true;
	{
		if (_distance != -1) then {_distanceCond = ((_x distance _pivot)<= _distance)};
		if (!(isplayer _x) && (_x != _pivot) && (typeOf _x != "logic") && !(_x isKindOf "Man") && _distanceCond) then {_allObjects pushBackUnique _x};
	} forEach _allMission;
	_comp = [_pivot,_allObjects] FUNC(cmpStoreComp);
	_finalComp = str _comp;
	if (_isForCfg) then {
	_toCFG = [_comp]FUNC(arrayToCfgArray);
	_finalComp ="mrhComp[]= " + _toCFG;
	};
	copyToClipboard _finalComp;

	_comp