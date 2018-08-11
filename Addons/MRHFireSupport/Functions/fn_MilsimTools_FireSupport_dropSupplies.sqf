/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] spawn MRH_fnc_MilsimTools_FireSupport_dropSupplies

*/
#include "MRH_C_Path.hpp"

params ["_plane","_dropZone","_supply","_side","_startDisToDrop","_caller"];
	_height = 400;
	if (_plane isKindOf "Helicopter") then {_height = 150};
	//_randomPos = [nil,nil,{((_this distance2D _dropZone) >= _startDisToDrop) && ((_this distance2D _dropZone) <= (_startDisToDrop + 200))}] call BIS_fnc_randomPos;
	_randomPos = [_dropzone,_startDisToDrop] FUNC(randomPosAroundAt);
	_vecarray = [[(_randomPos select 0),(_randomPos select 1),_height], 0, _plane,_side] call bis_fnc_spawnvehicle;
	_myvec = _vecarray select 0;
	_myvec setDir (_myvec getRelDir _dropZone);
	_myvec setVariable ["MRH_MilsimTools_SupplyDrop_caller",_caller];
	
	//play message
	
		[[_caller,[_dropZone select 0,_dropZone select 1],_myvec,_dropZone],{
				params ["_player","_LZ","_myvec","_dropZone"];
				
				
				if ((group player) != (group _player)) ExitWith {};
				//playSound "";
				if (_player == player) then {
			playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio2.wss",player];
				};
			_player sideChat format [localize "STR_MRH_FireSupport_SC_SupplyDialog1",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
			sleep 4;
				//playSound "MRH_HeliTaxi_HeliEnRoute";
				
			[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_SC_SupplyDialog2",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
			sleep 10;
			_ETA = [_myvec,_dropZone] call MRH_fnc_travelTimeEta;
				_ETA = [_ETA, 0] call BIS_fnc_cutDecimals;
				if (_player == player) then {
			playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio3.wss",player];
				};
			[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_SC_SupplyDialog3",_ETA,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];	
			}] RemoteExec ["Spawn", [-2,0] select isServer];
	
	_myvec addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
		[[_unit],MRH_fnc_MilsimTools_FireSupport_onSupplierDestroyed] RemoteExec ["Call",0];
		}];
	
	_myvec commandMove _dropZone;
	_myvec flyInHeight _height;
	_myvec lockDriver true;
	_myvec setBehaviour "CARELESS";
	_myvec setCombatMode "GREEN";
	waitUntil {(_myvec distance2D _dropZone) <100};
	_pos = _myvec modelToWorld [0,0,-10];
	sleep 1;
	missionNamespace setVariable ["MRH_FireSupport_isAvailableSUPPLYfor_"+ str _side,true,true];
	[_supply,_pos] spawn MRH_fnc_MilsimTools_FireSupport_parachuteObject;
	[[_caller,[_dropZone select 0,_dropZone select 1]],{
				params ["_player","_LZ"];
				
				
				if ((group player) != (group _player)) ExitWith {};
				//playSound "";
				if (_player == player) then {
			playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio2.wss",player];
				};
			
			[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_SC_SupplyDialog5",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
			}] RemoteExec ["Spawn", [-2,0] select isServer];
	_myvec commandMove (_myvec modelToWorld [0,3000,_height]);
	waitUntil {(_myvec distance2D _dropZone) >2000};
	{deleteVehicle _x;}forEach crew _myvec;
	deleteVehicle _myvec;