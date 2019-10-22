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
		[[_radioStation,_rackId],acre_api_fnc_removeRackFromVehicle] remoteExec ["Call",2];
		private _toTrace = format ["Rack %1 unmounted for radiostation %2 by player %3",_rackID,_radioStation,_player];
		TRACE(_toTrace);
		[
			{
				deleteVehicle _this;
			}, 
			_radioStation, 
			1
		] call CBA_fnc_waitAndExecute;

		