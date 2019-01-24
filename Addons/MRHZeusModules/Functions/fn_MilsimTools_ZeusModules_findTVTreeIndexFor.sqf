/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
["MRH_dataGen_10",220119,9902] call MRH_fnc_MilsimTools_ZeusModules_findTvTreeIndexFor;
*/
#include "MRH_C_Path.hpp"
//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
params ["_data","_displayIdd","_treeIdd"];
_index = 0;
_ctrl = ((findDisplay _displayIdd) displayCtrl _treeIdd);
//systemChat str (_ctrl tvCount []);


for "_i" from 0 to ((_ctrl tvCount [])-1) do {
	if ((_ctrl tvdata [_i]) == _data) then {_index = _i};
	
};
_index
