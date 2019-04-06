/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_startHaloJump;
*/
#include "MRH_C_Path.hpp"
if !(isServer) exitWith {}; //func mus be called on the server
params ["_dropPos","_UnitsToParachute",["_gearToParachute",[]],["_autoEquipUnits",true],["_forceUnitsAAD",true],["_unitsAADSetting","200"],["_forceGearAAD",true],["_gearAADAltitude","200"]];

diag_log format ["MRH_MilsimTools_HaloJumpStart, units to parachute %1",_UnitsToParachute];

{
	
		[[_x,_dropPos,_autoEquipUnits,_forceUnitsAAD,_unitsAADSetting],
		{
			params ["_unit","_dropPos","_autoEquipUnits","_forceUnitsAAD","_unitsAADSetting"];
			if (isPlayer _unit) then {[_unit,"Halo drop starting","MRH_Zeus_Notif"]call MRH_fnc_MilsimTools_Core_notifyPlayer;};
			if !(isNull curatorCamera) then {findDisplay 312 closeDisplay 2;};
			if (_autoEquipUnits)then {[_unit]FUNC(prepUnitForHalo);};
			
			[
				{
					params ["_forceUnitsAAD","_unit","_unitsAADSetting"];
					if (_forceUnitsAAD) then {_unit setVariable ["MRH_HaloGear_AADOpening_alt",_unitsAADSetting]};
				}, 
				[_forceUnitsAAD,_unit,_unitsAADSetting], 
				1
			] call CBA_fnc_waitAndExecute;

			[
				{
					params ["_unit","_dropPos"];
					_unit setPosASL ([_dropPos,[15,25,30]]CFUNC(scatterPosition));
				}, 
				[_unit,_dropPos], 
				2
			] call CBA_fnc_waitAndExecute;
			
		
		}
		] remoteExec ["Call",_x];
	
} forEach _UnitsToParachute;

{
	group _x setGroupOwner 2;
	if (_forceGearAAD) then 
	{
	
		_x setVariable ["MRH_HaloGear_AADOpening_alt",_gearAADAltitude];
		[_x] spawn MRH_fnc_MilsimTools_HaloGear_objectAADEH;
		
	};
	
	private _logic = _x getVariable ["MRH_ZeusModules_qualifiesForHaloAssociatedLogic",objNull];
	deleteVehicle _logic;

	_x setPosASL ([_dropPos,[30,50,70]]CFUNC(scatterPosition));
	
}forEach _gearToParachute;