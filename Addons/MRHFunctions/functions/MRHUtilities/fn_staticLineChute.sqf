/*
REQUIRES ACE 3 & BACKPACK ON CHEST
forces units to eject their plane and open parachute 3 seconds later to emulate a static line.
gives the unit a chute and puts its backpack on chest before the jump
Params are:
0: units to equip <ARRAY>
1: is steerable <BOOLEAN> if set to true parachute will be steerable (Optional, default FALSE)
2: Delay between jumpers <NUMBER> optional delay in seconds between each jumper, (optional default 0.5s)

eg
[playableUnits] call MRH_fnc_staticLineChute;
or
[units group player, true] call MRH_fnc_staticLineChute;
or
[allPlayers] call MRH_fnc_staticLineChute;
or
[[unit1,unit2,unit3],true]call MRH_fnc_staticLineChute;
or 
[playableUnits, false, 2 ] call MRH_fnc_staticLineChute;
*/
	params ["_jumpersArray","_isSteerable","_jumpInterval"];
	if (isNil "_isSteerable") then {_isSteerable = false;};
	if (isNil "_jumpInterval") then {_jumpInterval = 0.5};
	
	[_jumpersArray, _isSteerable, _jumpInterval] spawn
	 {

		params ["_jumpersArray","_isSteerable","_jumpInterval"];
			{
					[[_x,_isSteerable],{
						params ["_unit","_isSteerable"];
						[_unit] call zade_boc_fnc_actionOnChest;
						_chute = "ACE_NonSteerableParachute";
						if (_isSteerable) then {_chute = "B_Parachute";};
						_unit addBackPack _chute;
							[_unit] spawn {
							params ["_unit"];
							_unit action ["Eject", vehicle _unit];
							sleep 3;
							_unit action ["OpenParachute", _unit];
							if (!isPlayer _unit) then {
								waitUntil {isTouchingGround _unit};
								sleep 1;
								_gwh = "Weapon_Empty" createVehicle position _unit; 
								_unit action ["DropBag", _gwh, typeOf unitBackpack _unit];
								[_unit] call zade_boc_fnc_actionOnBack;
								};
							};
						}] RemoteExec ["Call",_x,true];
					sleep _jumpInterval;
			} forEach _jumpersArray;

	};
/*BELOW: old deprecated code that wouldn't work in MP
params ["_jumpersArray","_isSteerable","_jumpInterval"];
if (isNil "_isSteerable") then {_isSteerable = false;};
if (isNil "_jumpInterval") then {_jumpInterval = 0.5};
[_jumpersArray, _isSteerable, _jumpInterval] spawn {
params ["_jumpersArray","_isSteerable","_jumpInterval"];
	{
		[_x] call zade_boc_fnc_actionOnChest;
		_chute = "ACE_NonSteerableParachute";
		if (_isSteerable) then {_chute = "B_Parachute";};
		_x addBackPack _chute;
			[_x] spawn {
			params ["_unit"];
			_unit action ["Eject", vehicle _unit];
			sleep 3;
			_unit action ["OpenParachute", _unit];
			if (!isPlayer _unit) then {
				waitUntil {isTouchingGround _unit};
				sleep 1;
				_gwh = "Weapon_Empty" createVehicle position _unit; 
				_unit action ["DropBag", _gwh, typeOf unitBackpack _unit];
				[_unit] call zade_boc_fnc_actionOnBack;
				};
			};
		sleep _jumpInterval;
	} forEach _jumpersArray;

};
*/