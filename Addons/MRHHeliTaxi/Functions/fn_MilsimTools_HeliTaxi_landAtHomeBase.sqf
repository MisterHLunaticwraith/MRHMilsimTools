/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"
_this spawn {
	params ["_heli"];
	_heli SVAR(isFlyingBackToBase,true,true);
	_heli SVAR(isBusy,false,true);
	_homebase = _heli GVAR(startingPhysicalPos);
	_heli commandMove _homebase;
	waitUntil {(_heli distance _homebase)<200};
	while { ( (alive _heli) && !(unitReady _heli) ) } do
	{
	sleep 1;
	};

	_heli land "LAND";

	[
		{
			params ["_heli"];

			[
				
				{isTouchingGround (_this select 0)}, 
				{
					_pilot = driver (_this select 0);
					_pilot action ["engineOff",(_this select 0)];
					_homebase = (_this select 0)GVAR(startingPhysicalPos);
					if ((_this select 0) distance _homebase <100) then
					{
						(_this select 0) setDamage 0;//full repairs
						(_this select 0) setFuel 1;//ful refuel
					};
				}, 
				[_heli],
				20
			] call CBA_fnc_waitUntilAndExecute;

		}, 
		[_heli], 
		60
	] call CBA_fnc_waitAndExecute;
};