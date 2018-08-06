params ["_LZ"];
[_LZ] spawn {
	params ["_LZ"];
	_heliType = player getVariable "MRH_HeliTaxi_UserSelectedHeli";
	player setVariable ["MRH_HeliTaxi_UserSelectedHeli",nil];
	_vecarray = [player modelToWorld [0,-2000,60], getDir player, _heliType,side player] call bis_fnc_spawnvehicle;
	_myvec = _vecarray select 0;
	_myvec addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
		[_unit] call MRH_fnc_MilsimTools_Heli_onTaxiDestroyed;
		}];
	_myvec commandMove _LZ;
	_myvec flyInHeight 60;
	_myvec lockDriver true;
	_myvec setBehaviour "CARELESS";
	_myvec setCombatMode "GREEN";
	player setVariable ["MRH_TaxiHeli",_myvec];
	
	_EHHeliownerKilled = player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] call MRH_fnc_MilsimTools_Heli_onOwnerPlayerKilled;
	}];
	player setVariable ["MRH_MilsimTools_HeliTaxi_KilledEHIndex",_EHHeliownerKilled];
	
	/////////canceling option
	_condition = {
				
				(vehicle player != (player getVariable "MRH_TaxiHeli")) && (alive (player getVariable "MRH_TaxiHeli"))
				};  
	_statement = {  
		  call MRH_fnc_MilsimTools_Heli_onHeliCancelled;
				};  
	_action = ["MRH_Taxi_Cancel",localize "STR_MRH_HeliTaxi_HeliCancelAce","",_statement,_condition] call ace_interact_menu_fnc_createAction;  
	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	
	
	
	
	
	
	(group _myvec) setGroupId ["[REAPER 1-1]"];
	
	[[player,_myvec,_LZ],{
		params ["_player","_myvec","_LZ"];
		if ((group player) != (group _player)) ExitWith {};
		playSound "MRH_HeliTaxi_Request";
	_player sideChat format [localize "STR_MRH_HeliTaxi_RequestingEvac",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	sleep 4;
		playSound "MRH_HeliTaxi_HeliEnRoute";
	_myvec sideChat format [localize "STR_MRH_HeliTaxi_CopyEnRoute",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	}] RemoteExec ["Spawn", [-2,0] select isServer];
	//copyToClipboard format ["Position: %1, grille %2",str _LZ,([_LZ] call MRH_fnc_realisticGrid)];
	//[_myvec,_LZ] spawn {params ["_myvec","_LZ"]; while {alive _myvec} do {_dist = _myvec distance _LZ; hintSilent str _dist;};};
	waitUntil {(_myvec distance _LZ) < 1500};
	_myvec limitSpeed 90;
	waitUntil {(_myvec distance _LZ) < 150};
	_helipad = "Land_HelipadEmpty_F" createVehicle _LZ;
	_smokeRedgear = "SmokeShellGreen" createVehicle (position _helipad);
    _smokeRedgear attachto [_helipad, [0,0,0]];
	while { ( (alive _myvec) && !(unitReady _myvec) ) } do
{
       sleep 1;
};
	_myvec land "GET IN";

	
	
	if (alive _myvec) then {
	_condition = {vehicle player == (player getVariable "MRH_TaxiHeli")};  
	_statement = {  
		  call MRH_fnc_MilsimTools_Heli_HeliTaxiBack;
				};  
	_action = ["MRH_Taxi_Go",(localize "STR_MRH_HeliTaxi_SetDestination"),"",_statement,_condition] call ace_interact_menu_fnc_createAction;  
	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	};
};




















