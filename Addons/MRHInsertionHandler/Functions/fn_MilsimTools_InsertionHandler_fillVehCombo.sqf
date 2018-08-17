/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_fillVehCombo;
*/
#include "MRH_C_Path.hpp"
_combo = FDIS(2100);
_allVehs = missionNamespace getVariable ["MRH_InsertionHandler_AvailVehs"+(str side player),["C_Heli_Light_01_civil_F"]];
{
	_name = ([_x] FUNC(readVehicleCfg)) select 0;
	_index = _combo lbAdd _name;
	_data = _combo lbSetData [_index,_x];
}forEach _allVehs;
_combo lbSetCurSel 0;