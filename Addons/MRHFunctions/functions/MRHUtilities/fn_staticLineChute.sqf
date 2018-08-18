/*
Function name:MRH_fnc_staticLineChute
Author: Mr H.
Description: forces units to eject their plane and open parachute 3 seconds later to emulate a static line.
gives the unit a chute and puts its backpack on chest before the jump. 
You can also add crates and vehicles to the list of objects to parachute

NOTE: is compatible with back pack on chest but BPIC is no longer mandatory to use.
Return value: None
Public: Yes
Parameters:
0-<ARRAY> - Units to parachute.
1 - <BOOLEAN> - Optional - isSteerable if true the unit will receive a steerable parachute otherwise it will be non steerable, default, false.
2 - <NUMBER> -Optional - space in seconds between each jumper, default 0.5
3 - <ARRAY> -Optional - of <STRINGS> an/or <OBJECTS> to paradrop in addition to the units
4- <OBJECT>  -Optional, mandatory if param #3 is given. Vehicle used for the paradrop.
Example(s):
[playableUnits] call MRH_fnc_staticLineChute;
or
[units group player, true] call MRH_fnc_staticLineChute;
or
[allPlayers] call MRH_fnc_staticLineChute;
or
[[unit1,unit2,unit3],true]call MRH_fnc_staticLineChute;
or 
[playableUnits, false, 2 ] call MRH_fnc_staticLineChute;
or
[units group player, true,0.5,["B_supplyCrate_F",myCrate,"B_Quadbike_01_F"],vehicle player] call MRH_fnc_staticLineChute;// send in the guys and their gear!
*/

params ["_jumpersArray",["_isSteerable",false],["_jumpInterval",0.5],["_extraGear",[]],["_sourceVehicle",objNull]];
[_jumpersArray, _isSteerable, _jumpInterval,_extraGear,_sourceVehicle] spawn
	{
		params ["_jumpersArray","_isSteerable","_jumpInterval","_extraGear","_sourceVehicle"];
		
		if (!(_extraGear isEqualTo []) && !isNull _sourceVehicle) then 
		{
		_sourceVehicle allowDamage false;
			{
				[_x,_sourceVehicle modelToWorld [0,0,-10]] call MRH_fnc_parachuteObject;
				sleep (_jumpInterval + random [0.1,0.15,0.5]);
			}ForEach _extraGear;
		_sourceVehicle allowDamage true;
		};
		
		
		
		{

		
			[[_x,_isSteerable],{
				params ["_unit","_isSteerable"];
				
									MRH_inside_fnc_removeBackpack =
									{
									params ["_unit"];
									_unitLoadOut = getUnitLoadout _unit;
									_unit setVariable ["MRH_Utilities_Parachute_Jump_loadOutBeforeJump",_unitLoadOut];


									_gwh = "Weapon_Empty" createVehicle position _unit;
									_unit action ["DropBag", _gwh, typeOf unitBackpack _unit];

									_gwh attachTo [_unit,[0,0,-0.1],"pelvis"];


									_gwh setVectorDirandUp [[-0.25,-1,0],[0,0,-1]];
									_unit setVariable ["MRH_Utilities_Parachute_Jump_DummyBP",_gwh];

									};


									MRH_inside_fnc_restoreBackpack = 
									{
									params ["_unit"];
									waitUntil {isTouchingGround _unit};
									sleep 1;
									_gwh = "Weapon_Empty" createVehicle position _unit; 
									_unit action ["DropBag", _gwh, typeOf unitBackpack _unit];
									sleep 2;
									_loadoutToRestore = _unit getVariable "MRH_Utilities_Parachute_Jump_loadOutBeforeJump";
									_dummyToDelete = _unit getVariable "MRH_Utilities_Parachute_Jump_DummyBP";
									deleteVehicle _dummyToDelete;
									_unit setUnitLoadout _loadoutToRestore;

									};
				_hasBPOC = false;
				if ("zade_boc" in activatedAddons) then {_hasBPOC = true};
				
				_unit action ["Eject", vehicle _unit];
				
				if (_hasBPOC) then {[_unit] call zade_boc_fnc_actionOnChest;} else {[_unit] call MRH_inside_fnc_removeBackpack;};
				sleep 1;
				_chute = "ACE_NonSteerableParachute";
				if (_isSteerable) then {_chute = "B_Parachute";};
				_unit addBackPack _chute;
				
				sleep 4;//org3
				_unit action ["OpenParachute", _unit];
				if (_hasBPOC) then {
				if (!isPlayer _unit) then {
				waitUntil {isTouchingGround _unit};
				sleep 1;
				_gwh = "Weapon_Empty" createVehicle position _unit; 
				_unit action ["DropBag", _gwh, typeOf unitBackpack _unit];
				[_unit] call zade_boc_fnc_actionOnBack;
				};
				} else {[_unit] spawn MRH_inside_fnc_restoreBackpack;};

			}] RemoteExec ["Spawn",_x,true];
		sleep _jumpInterval;
		} forEach _jumpersArray;
		

	};