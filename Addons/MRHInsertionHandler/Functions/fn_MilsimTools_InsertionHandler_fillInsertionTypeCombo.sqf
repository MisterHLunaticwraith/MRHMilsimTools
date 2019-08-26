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
#include "displays.sqf"
_availableTypes = [];

_useStatic = ["MRH_MilsimTools_InsertionHandler_allowStatic"] call cba_settings_fnc_get;
if (_useStatic) then {_availableTypes pushBackUnique [(localize "STR_MRH_MRHInsertionHandler_StaticLinePrettyName"),"Standard"]};
_useHalo = ["MRH_MilsimTools_InsertionHandler_allowHALO"] call cba_settings_fnc_get;
if (_useHalo) then {_availableTypes pushBackUnique [(localize "STR_MRH_MRHInsertionHandler_HALOJumpPrettyName"),"Halo"]};
_useSub = ["MRH_MilsimTools_InsertionHandler_allowSub"] call cba_settings_fnc_get;
if (_useSub) then {_availableTypes pushBackUnique [(localize "STR_MRH_MRHInsertionHandler_SubmarinePrettyName"),"Submarine"]};
if (_availableTypes isEqualTo []) exitWith {closedialog 0; []spawn {sleep 1;hintC ("STR_MRH_MRHInsertionHandler_ErrorNoSetting")}};





{
_index = _selectInsertionTypeCombo lbAdd (_x select 0);
_selectInsertionTypeCombo lbSetData [_index,(_x select 1)];
} forEach _availableTypes;
_selectInsertionTypeCombo lbSetCurSel 1;