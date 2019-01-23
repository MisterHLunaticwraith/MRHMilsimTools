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
params ["_displayIDD","_lisBoxIDD",["_isTvTree",true]];
_display = findDisplay _displayIDD;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_ctrlTree = CTRLF(9902);
_ctrlPicBox = CTRLF(9904);
_listBox = CTRLF(_lisBoxIDD);

_data = "";
_dataFaceName = "";
if (_isTvTree) then 
{
_data = (_ctrlTree tvData (tvCurSel _ctrlTree));
_dataFaceName = (_ctrltree tvText (tvCurSel _ctrlTree));
}
else
{
	_data = (_ctrlPicBox lbData(lbCurSel _ctrlPicBox));
	_dataFaceName = (_ctrlPicBox lbText (lbCurSel _ctrlPicBox));
};


if (_data == "") exitWith {[objNull,localize "STR_MRH_MRHMRHZeusModules_ERRORNODATASEL"] call BIS_fnc_showCuratorFeedbackMessage;};

if (_isTvTree) then {
if ((count tvCursel _ctrltree) !=1) exitWith {[objNull,localize "STR_MRH_MRHMRHZeusModules_ERRORMAINTREE"] call BIS_fnc_showCuratorFeedbackMessage;};
};


if ([_data,_displayIDD,_lisBoxIDD] FUNC(listBoxAlreadyHasData)) exitWith {[objNull,localize "STR_MRH_MRHMRHZeusModules_ERRORDATAINLIST"] call BIS_fnc_showCuratorFeedbackMessage;};
_index = _listBox lbAdd _dataFaceName;
_listBox lbSetData [_index,_data];
