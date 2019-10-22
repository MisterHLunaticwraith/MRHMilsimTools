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
params ["_player"];
	private _radioStation = "MRH_117FRadioStation_NoRack" createVehicle (_player modelToWorld [0,1,0]);
	//need to wait until rack is initialized
	[
		{
			!(isNull ( (_this select 0) getVariable ["acre_sys_rack_initplayer",objNull] ) )
		}, 
		{
			[
				{
					params ["_radioStation","_player"];
					private _players117 = ["ACRE_PRC117F",[_player]] call acre_api_fnc_getRadioByType;
					
					private _rackId= ([_radioStation] call acre_api_fnc_getVehicleRacks)select 0;

					[_rackID,_players117,_player] call acre_sys_rack_fnc_mountRadio;
					
					_player removeItem "MRH_MT_FoldedSatcomAntenna";
					[_player, _radioStation] call ace_dragging_fnc_startCarry;
				}, 
				_this, 
				2
			] call CBA_fnc_waitAndExecute; //needs delay after radio creation
		}, 
		[_radioStation,_player]
	] call CBA_fnc_waitUntilAndExecute;