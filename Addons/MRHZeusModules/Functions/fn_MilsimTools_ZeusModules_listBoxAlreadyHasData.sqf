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
params ["_data","_displayIDD","_lisBoxIDD"];

_return = false;
_display = findDisplay _displayIDD;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_listBox = CTRLF(_lisBoxIDD);

for "_i" from 0 to ((lbsize _listBox)-1) do
{
	if (_i == -1) exitWith {};
	_dataFromBox = _listBox lbData _i;
	if (_dataFromBox == _data) then {_return = true};

	
};
_return