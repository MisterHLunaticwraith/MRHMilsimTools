/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_units","_ctrlMap"];
	private _handle = [
		{
			params ["_units","_ctrlMap"];
			_units append [objNull]; //the last unit won't display name for some reason
			{
				if ([_x ]FUNC(showOnBFT)) then {
					if ((isNull objectParent _x) || (objectParent _x) != (objectParent (leader group _x))) then {
					_ctrlMap  drawIcon 
						[
							getText (configFile >>"cfgVehicles">>typeOf _x>>"icon"),
							[([side _x, false] call BIS_fnc_sideColor),[0,1,1,1]]select (_x isEqualTo MRH_player),
							getPos _x,
							24,
							24,
							[getDir _x,0] select isFormationLeader _x,
							name  _x,
							0,
							0.05,
							"Unifont",
							"right"
						];
					};
						if (isFormationLeader _x) then 
						{
						private _icons = [group _x] FUNC(NATO_symbols_for);
						_icons params ["_icon","_modifier"];
							_ctrlMap  drawIcon 
							[
								_icon,
								[([side _x, false] call BIS_fnc_sideColor),[0,1,1,1]]select (_x isEqualTo MRH_player),
								(getPos _x)vectorAdd [0,4,0],
								24,
								24,
								[getDir _x,0] select isFormationLeader _x,
								["",groupId group _x] select isFormationLeader _x,
								0,
								0.05,
								"Unifont",
								"right"
							];
							_ctrlMap  drawIcon 
							[
								_modifier,
								([side _x, false] call BIS_fnc_sideColor),
								(getPos _x)vectorAdd [0,2,0],
								24,
								24,
								[getDir _x,0] select isFormationLeader _x,
								["",groupId group _x] select isFormationLeader _x,
								0,
								0.05,
								"Unifont",
								"right"
							];
						};
				};

			}forEach _units;
			
		},
		[_units,_ctrlMap],
		{},
		{
			((ctrlShown (_this select 1)) && ([MRH_Player] FUNC(isConnectedToAntenna)))
		}
	] FUNC(conditionalPFEH);
	TRACE("BFT called");