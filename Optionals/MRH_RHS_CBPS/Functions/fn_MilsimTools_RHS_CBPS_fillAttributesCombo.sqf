/*
Function name:MRH_fnc_MilsimTools_RHS_CBPS_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RHS_CBPS_;
*/
#include "MRH_C_Path.hpp"
params ["_ctrl"];

lbClear _ctrl;

_default = [[localize "STR_MRH_MRH_RHS_CBPS_None","None"]];

_addonComps = FUNC(listAddonCompositions);


_missionComps = FUNC(listMissionCompositions);

_all = _default + _addonComps + _missionComps;

{
	 _index = _ctrl lbAdd (_x select 0);
	_ctrl lbSetData [_index,(_x select 1)];
} forEach _all;