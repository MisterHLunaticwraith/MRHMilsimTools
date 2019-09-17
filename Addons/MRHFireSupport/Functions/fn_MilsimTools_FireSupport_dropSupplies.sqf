/*
Function name:MRH_fnc_MilsimTools_FireSupport_dropSupplies
Author: Mr H.
Description: Creates a plane, sends it to provided coordinates and drops the cargo (itesms and players, parachutes are then added to everything
Return value:None
Public: No, but there is a public version
Parameters:
0 -<STRING> classname of plane to spawn
1 -<ARRAY> position where to drop the supplies
2 -<STRING> or <OBJECT> if string: classname of object to create, if object, object present in the missionConfigFile
3 -<SIDE> - Side of the created plane can be West / Blufor (Arma 3), East / Opfor (Arma 3), Resistance / Independent (Arma 3), Civilian, sideLogic, Friendly, Enemy or Unknown.
4- <NUMBER> optional, distance (in meters) from the dropzone where the plane will be created, default is 3000m 
//only for private version:
5-<OBJECT> caller player who called the script 
6- <BOOL> is for mod, will include playing dialogs
Example(s):
unlike the public version this function must be spawned (executed ins scheduled environment) to allow suspension 
see public for more examples
[] spawn MRH_fnc_MilsimTools_FireSupport_dropSupplies

*/
#include "MRH_C_Path.hpp"

params ["_plane","_dropZone","_supply","_side","_startDisToDrop",["_caller",objNull],["_isForMod",true]];
	_height = 400;
	if (_plane isKindOf "Helicopter") then {_height = 150};
	//_randomPos = [nil,nil,{((_this distance2D _dropZone) >= _startDisToDrop) && ((_this distance2D _dropZone) <= (_startDisToDrop + 200))}] call BIS_fnc_randomPos;
	_randomPos = [_dropzone,_startDisToDrop] FUNC(randomPosAroundAt);
	_vecarray = [[(_randomPos select 0),(_randomPos select 1),_height], 0, _plane,_side] call bis_fnc_spawnvehicle;
	_myvec = _vecarray select 0;
	_myvec setDir (_myvec getRelDir _dropZone);
	
	if (_isForMod) then {
	_myvec setVariable ["MRH_MilsimTools_SupplyDrop_caller",_caller];
	
	//play message
	
		[[_caller,[_dropZone select 0,_dropZone select 1],_myvec,_dropZone],{
				params ["_player","_LZ","_myvec","_dropZone"];
				
				
				if ((group MRH_player) != (group _player)) ExitWith {};
				//playSound "";
				if (_player == MRH_player) then {
			playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio2.wss",MRH_player];
				};
			_player sideChat format [localize "STR_MRH_FireSupport_SC_SupplyDialog1",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
			sleep 4;
				//playSound "MRH_HeliTaxi_HeliEnRoute";
				
			[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_SC_SupplyDialog2",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
			sleep 10;
			_ETA = [_myvec,_dropZone] call MRH_fnc_travelTimeEta;
				_ETA = [_ETA, 0] call BIS_fnc_cutDecimals;
				if (_player == MRH_player) then {
			playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio3.wss",MRH_player];
				};
			[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_SC_SupplyDialog3",_ETA,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];	
			}] RemoteExec ["Spawn", [-2,0] select isServer];
	
	_myvec addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
		[[_unit],MRH_fnc_MilsimTools_FireSupport_onSupplierDestroyed] RemoteExec ["Call",0];
		}];
	}; // end _isformod
	_myvec commandMove _dropZone;
	_myvec flyInHeight _height;
	_myvec lockDriver true;
	_myvec setBehaviour "CARELESS";
	_myvec setCombatMode "GREEN";
	waitUntil {(_myvec distance2D _dropZone) <100};
	_pos = _myvec modelToWorld [0,0,-10];
	sleep 1;
	if (_isForMod) then {
	missionNamespace setVariable ["MRH_FireSupport_isAvailableSUPPLYfor_"+ str _side,true,true];
	missionNamespace setVariable [("MRH_MilsimTools_SupplyDrop_DelayBetween_"+ (str _side)),CBA_missionTime,true];
	missionNamespace setVariable ["MRH_FireSupport_SDisInActionFor_"+ (str _side),false,true];
	};
	_myvec allowDamage false;
	[_supply,_pos] spawn MRH_fnc_MilsimTools_FireSupport_parachuteObject;
	
	if (_isForMod) then {
	[[_caller,[_dropZone select 0,_dropZone select 1]],{
				params ["_player","_LZ"];
				
				
				if ((group MRH_player) != (group _player)) ExitWith {};
				//playSound "";
				if (_player == MRH_player) then {
			playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio2.wss",MRH_player];
				};
			
			[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_SC_SupplyDialog5",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
			}] RemoteExec ["Spawn", [-2,0] select isServer];
	};//end _isForMod
	_myvec commandMove (_myvec modelToWorld [0,3000,_height]);
	waitUntil {(_myvec distance2D _dropZone) >200};
	_myvec allowDamage true;
	waitUntil {(_myvec distance2D _dropZone) >2000};
	{deleteVehicle _x;}forEach crew _myvec;
	deleteVehicle _myvec;