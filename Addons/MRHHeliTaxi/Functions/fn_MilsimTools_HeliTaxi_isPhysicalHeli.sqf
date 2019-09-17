/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
[this,me] call MRH_fnc_MilsimTools_HeliTaxi_isPhysicalHeli;
*/
#include "MRH_C_Path.hpp"

_statement = {
	params ["_myvec","_caller"];
	_toTrace = format ["%1 is now heli taxi slaved to group %2, caller %3",_myvec,group _caller,_caller];
	TRACE(_toTrace);
	if !(isServer) exitWith {};
	//-- create variables
	//attach variables  to the heli 
	_callingGRP = group _caller;
	_myvec SVAR(isPhysicalHeli,true,true);
	_myvec SVAR(startingPhysicalPos,getPos _myvec,true);
	_myvec SVAR(userSetDestination,getPos _myvec,true);
	_myvec SVAR(ownerGroup,_callingGRP,true); //group owning this heli
	_myvec SVAR(caller,_caller,true);// person that called the heli
	//attach variables to the group

	_callingGRP SVAR(isUsingHeli,true,true); //the group currently uses a heli
	_callingGRP SVAR(slavedHeli,_myvec,true); //used heli
	_callingGRP SVAR(ownsPhysicalHeli,true,true);
	//flag crew & lock
	[_myvec] FUNC(flagCrew);
	[_myVec] CFUNC(lockNonCargo); 



	//substract from used by side
	[side _callingGRP,true]FUNC(availabilityCountUpdate);

	//create helipad on stratuppos for returns
	_helipad = "Land_HelipadEmpty_F" createVehicle (getPos _myvec);

	[[(group _myvec)],{(_this select 0) setGroupId ["[REAPER 1-1]"];}] remoteExec ["Call",0];


	//--add event handlers
	//when vehicle is destroyed
	_myvec addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		[_unit] FUNC(onTaxiDestroyed);
	}];

	// when caller is killed
	_EHHeliownerKilled = _caller addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		[_unit] FUNC(onCallerKilled);
	}];
	_caller SVAR(KilledEHIndex,_EHHeliownerKilled,true);
};


[
    {
		(!(isNull (_this select 0)) && !(isNull (_this select 1)) &&(time>1))
	}, 
    _statement, 
    _this
] call CBA_fnc_waitUntilAndExecute;