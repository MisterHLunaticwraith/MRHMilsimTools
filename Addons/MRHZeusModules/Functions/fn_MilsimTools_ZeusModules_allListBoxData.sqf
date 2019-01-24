/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
*/
#include "MRH_C_Path.hpp"
//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
params ["_displayIdd","_listBoxIDD"];
_allData = [];
_display = findDisplay _displayIDD;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_listBox = CTRLF(_listBoxIDD);

for "_i" from 0 to ((lbsize _listBox)-1) do
{
	if (_i == -1) exitWith {};
	private _dataFromBox = _listBox lbData _i;
	_allData pushBackUnique _dataFromBox;

	
};
_allData