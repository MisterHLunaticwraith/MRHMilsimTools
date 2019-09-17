/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
0 -<OBJECT> Unit that called the medevac 
1-<ARRAY> in format position LZ 
2- <STRING> classname of the Heli to use as transport
3 -<BOOL> if true,surgeon will be included
4 - <STRING> special items to load in the heli can be "none" or "ACE_MedicalCrate" to load with ace cargo or "MRH_medicalTent"
5 -<BOOL> if set to true helicopter crew will be equipped with NBC outfits (from contact DLC)
6 -<STRING> can be "safe",or "unsafe" if "unsafe" 2 escort helicopters will come along
Example(s):
[player,position player,"B_Heli_Transport_01_F",false,"none",false,"unsafe"]spawn MRH_fnc_MilsimTools_HeliTaxi_medEvacSpawnAndGo;
*/
#include "MRH_C_Path.hpp"
params [["_caller",objNull,[objNull]],["_LZ",[0,0,0],[[]]],["_heliType","B_Heli_Transport_01_F",[""]],["_surgeon",false,[false]],["_specials","none",[""]],["_nbc",false,[false]],["_security","safe",[""]]];
//--create the heli


_vecarray = [_caller modelToWorld [0,-2000,60], getDir _caller, _heliType,side _caller] call bis_fnc_spawnvehicle;
_myvec = _vecarray select 0;
_myvec setVariable [("MRH_HeliTaxi_isMEDEVAC_"+ (str (side _caller))),true,true];
_myvec setVariable ["MRH_HeliTaxi_MEDEVAC_Caller",_caller,true];
_myvec setVariable ["MRH_HeliTaxi_medEvacSide",(side _caller),true];

//-variables for handle messages func

[_myVec] CFUNC(lockNonCargo);
_myvec addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit,"MedEvacDestroyed"]FUNC(handleMessages);
	_side = _unit getVariable ["MRH_HeliTaxi_medEvacSide",sideUnknown];
	[_side] FUNC(resetMedEvacVars);
}];
_myvec SVAR(caller,_caller,true);
_myvec SVAR(userSetDestination,_LZ,true);
missionNamespace setVariable [("MRH_HeliTaxi_CurrentMedEvacHeli_"+ (str (side _caller))),_myvec,true];

[[(group _myvec)],{(_this select 0) setGroupId ["[ANGEL 1-1]"];}] remoteExec ["Call",0];
[_myvec,"MedEvacOnTheWay"]FUNC(handleMessages);
//--- if a surgeon is required create them
_surgeonClass = missionNamespace getVariable ("MRH_MilsimTools_HeliTaxi_Medic_MEDEVAC_" + (str side _caller));
if (_surgeon) then {
	_groupSurgeon = createGroup (side _caller);
	_surgeonUnit= (_groupSurgeon) createUnit [_surgeonClass, [0,0,0],[],0, "CARGO"];
	_surgeonUnit moveInCargo _myVec;
	_myVec SVAR(assignedSurgeon,_surgeonUnit,true);
	[[_surgeonUnit],MRH_fnc_isDoctor] remoteExec ["Call",0,true];
	

	[
		{isTouchingGround (_this select 1)}, 
		{
			params ["_surgeon","_myVec"];
		unassignVehicle _surgeon;
		moveOut _surgeon;
		_surgeon doMove (_myVec modelToWorld [10,0,0]);

		
		}, 
		[_surgeonUnit,_myVec]
	] call CBA_fnc_waitUntilAndExecute;
};
//------ flag crew for cancel /exit action //toDo Make this into a function
[_myVec] FUNC(flagCrew);

// --- add specials if they are required
if (_specials == "ACE_MedicalCrate") then {
	//_crate = "ACE_medicalSupplyCrate_advanced" createVehicle [0,0,0];
	[_myVec, 20] call ace_cargo_fnc_setSpace;
	[
		{isTouchingGround _this},
		{
			["ACE_medicalSupplyCrate_advanced", _this] call ace_cargo_fnc_loadItem;
		},
	_myVec
	
	] call CBA_fnc_waitUntilAndExecute;
	};
if (_specials == "MRH_medicalTent") then {_myVec addItemCargoGlobal ["MRH_FoldedMedicalTent",2]};
//--- incase of NBC
if (_nbc) then {
	{
		_x addGoggles "G_AirPurifyingRespirator_01_F";
		_x forceAddUniform "U_C_CBRN_Suit_01_Blue_F";
		_x addBackpack "B_SCBA_01_F";

	} forEach (crew _myVec);
};
// -- if security is needed
_escortHeliClass =missionNamespace getVariable ("MRH_MilsimTools_HeliTaxi_EscortHeli_MEDEVAC_" + (str side _caller));

if (_security == "unsafe") then 
{
	_vecarray1 = [_myvec modelToWorld [10,50,20], getDir _myvec, _escortHeliClass,side _myVec] call bis_fnc_spawnvehicle;
	_escort1 = _vecarray1 select 0;

	_vecarray2 = [_myvec modelToWorld [10,-50,20], getDir _myvec, _escortHeliClass,side _myVec] call bis_fnc_spawnvehicle;
	_escort2 = _vecarray2 select 0;

	{[_myVec,_x,_LZ,_forEachIndex] FUNC(escortBehavior)}forEach [_escort1,_escort2];
	_myVec setVariable ["MRH_HeliTaxi_escortHelis",[_escort1,_escort2],true];
	_myVec addEventHandler ["Deleted", {
	params ["_entity"];
	//todo
	}];
};


//-- send the heli to Land
_myvec flyInHeight 60;
_myvec lockDriver true;
_myvec setBehaviour "CARELESS";
_myvec setCombatMode "GREEN";
_myvec commandMove _LZ;

waitUntil {(_myvec distance _LZ) < 1500};
_myvec limitSpeed 90;
waitUntil {(_myvec distance _LZ) < 200};
_helipad = "Land_HelipadEmpty_F" createVehicle _LZ;
//_smokeRedgear = "SmokeShellGreen" createVehicle (position _helipad);
//_smokeRedgear attachto [_helipad, [0,0,0]];
while { ( (alive _myvec) && !(unitReady _myvec) ) } do
{
	sleep 1;
};
_isOnWater = [_LZ]FUNC(lzIsOnWater);
if (_isOnWater) then 
{   
	_myvec SVAR(isHoveringAtSea,true,true);
	_myvec land "GET IN";
	waitUntil {(_myvec distance2D _LZ)<6};
	_myvec land "NONE";
	_myvec flyInHeight 3;
	[_helipad]FUNC(deleteHelipad);
} else {
_myvec land "GET IN";
};
[
	{
	(isTouchingGround (_this select 0))
	},
	{
		(_this select 0) setVariable ["MRH_HeliTaxi_medEvacHasLanded",true,true];
		if !(isNull (_this select 1)) then {[(_this select 1)]FUNC(deleteHelipad);};
	},
	[_myvec,_helipad]
] call CBA_fnc_waitUntilAndExecute;