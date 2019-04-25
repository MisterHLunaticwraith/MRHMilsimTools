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
#include "MRH_C_Path.hpp"
params ["_remoteVersion", "_localVersion", "_player", "_level"];
systemChat format ["MRH Milsim Tools Optionals RHS_CBPS version mismatch: server version %1. %2 version %3",_remoteVersion,profileName,_localVersion];

[
    {(player == player) && (!isNull (findDisplay 46))}, 
    {
		params ["_remoteVersion", "_localVersion", "_player", "_level"];

		disableSerialization;

		_ctrlBack = (findDisplay 46) ctrlCreate ["RscPicture",-1];
		_ctrlText = (findDisplay 46) ctrlCreate ["RscTextMulti",-1];
		_position = [0.29375 * safezoneW + safezoneX,0.35656 * safezoneH + safezoneY,0.4125 * safezoneW,0.198 * safezoneH];
		{_x ctrlSetPosition _position; _x ctrlCommit 2;} forEach [_ctrlBack,_ctrlText];

		_ctrlText ctrlSetText (format ["MRH MilsimTools - Optionals RHS_CBPS Warning: Version Mismatch you have version %1, server version %2. You will be returned to lobby in 30 seconds",_localVersion,_remoteVersion]);
		_ctrlText ctrlSetTextColor [1, 0, 0, 1];
		_ctrlBack ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

		[
			{
				endMission "LOSER";
			}, 
			[], 
			30
		] call CBA_fnc_waitAndExecute;
	
	}, 
    _this
] call CBA_fnc_waitUntilAndExecute;