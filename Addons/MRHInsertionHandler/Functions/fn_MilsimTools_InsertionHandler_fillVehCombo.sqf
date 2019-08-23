/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_fillVehCombo
Author: Mr H.
Description: Fills the vehicle choice combo with the vehicles that are available to the player's side
Return value:None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_fillVehCombo;
*/
#include "MRH_C_Path.hpp"
_combo = FDIS(2100);
_allVehs = missionNamespace getVariable ["MRH_InsertionHandler_AvailVehs"+(str side MRH_player),["C_Heli_Light_01_civil_F"]];
{
	_name = ([_x] FUNC(readVehicleCfg)) select 0;
	_index = _combo lbAdd _name;
	_data = _combo lbSetData [_index,_x];
}forEach _allVehs;
_combo lbSetCurSel 0;