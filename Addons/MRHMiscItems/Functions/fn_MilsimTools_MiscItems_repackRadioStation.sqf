/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
params ["_radioStation","_player"];
	
		private _rackId= ([_radioStation] call acre_api_fnc_getVehicleRacks)select 0;
		//private _unique117 = [_rackId] call acre_api_fnc_getMountedRackRadio;
		[_rackId,_player] call acre_sys_rack_fnc_unmountRadio;
		[(_player modelToWorld [0,1,0])] call MRH_fnc_MilsimTools_MiscItems_foldAntenna;
		deleteVehicle _radioStation;