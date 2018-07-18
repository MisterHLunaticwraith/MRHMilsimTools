openMap [true,true];
hint localize "STR_MRH_HeliTaxi_HintSelectLZ";
onMapSingleClick {
	onMapSingleClick "";
	deleteMarkerLocal "MRH_LZ_Marker";
	hint localize "STR_MRH_HeliTaxi_HintLZSet";

		[_pos] spawn {
		params ["_pos"];
		_LZ = [_pos] call MRH_fnc_MilsimTools_Heli_findSuitableLZ;
		

		
		_marker = createMarkerLocal ["MRH_LZ_Marker_Back", _LZ];
		_marker setMarkerTypeLocal "MRH_Heli";
		_marker setMarkerTextLocal (localize "STR_MRH_HeliTaxi_MarkerSelectedLz");
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerAlphaLocal 1;
		sleep 5; openMap [false,false];
		_myvec = player getVariable "MRH_TaxiHeli";
		
		[[player,_myvec,_LZ],{
		params ["_player","_myvec","_LZ"];
		if !(player in _myvec) ExitWith {};
		playSound "MRH_HeliTaxi_OkPilot";
		_player sideChat format [localize "STR_MRH_HeliTaxi_GivePiloTCoord",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
		sleep 2;
		playSound "MRH_HeliTaxi_ReadyTakeOff";
		_myvec sideChat format [localize "STR_MRH_HeliTaxi_CoordinatesReceived",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
		}
		] RemoteExec ["Spawn", [-2,0] select isServer];
		//reset vars & action
		player setVariable ["MRH_TaxiHeli",nil];
		[player,1,["ACE_SelfActions","MRH_Taxi_Go"]] call ace_interact_menu_fnc_removeActionFromObject;
		[player,1,["ACE_SelfActions","MRH_Taxi_Cancel"]] call ace_interact_menu_fnc_removeActionFromObject;
		_myvec commandMove _LZ;
		_myvec flyInHeight 60;
		_myvec limitSpeed 99999;
		//[_myvec,_LZ] spawn {params ["_myvec","_LZ"]; while {alive _myvec} do {_dist = _myvec distance _LZ; hintSilent str _dist;};};
		[_myvec,_LZ] call MRH_fnc_MilsimTools_Heli_oneMikeMark;
		waitUntil {(_myvec distance _LZ) < 1500};
		_myvec limitSpeed 90;
		waitUntil {(_myvec distance _LZ) < 150};
		//_myvec flyInHeight 60;
		_helipad = "Land_HelipadEmpty_F" createVehicle _LZ;
		//_smokeRedgear = "SmokeShellGreen" createVehicle (position _helipad);
		//_smokeRedgear attachto [_helipad, [0,0,0]];
		while { ( (alive _myvec) && !(unitReady _myvec) ) } do
		{
			   sleep 1;
		};
		_myvec land "GET IN";
		waitUntil {isTouchingGround _myvec};
		
		[[player,_myvec,_LZ],{
		params ["_player","_myvec","_LZ"];
		if !(player in _myvec) ExitWith {};
		playSound "MRH_HeliTaxi_ThereGodSpeed";
		_myvec sideChat format [localize "STR_MRH_HeliTaxi_WeReThereGodSpeed",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
		sleep 3;
		playSound "MRH_HeliTaxi_Thanks";
		
		_player sideChat format [localize "STR_MRH_HeliTaxi_ThanksFlySafe",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
		}
		] RemoteExec ["Spawn", [-2,0] select isServer];
		sleep 2;
		
		
		[[_myvec],{params ["_heli"]; if (player in _heli) then {moveOut player};}] RemoteExec ["Call",[-2,0] select isServer];
		
		_myvec setVehicleLock "LOCKED"; //voir en mp si des joueurs ne restent pas coincés.
		deleteMarkerLocal "MRH_LZ_Marker_Back";
		sleep 25;
		_myvec commandMove (_myvec modelToWorld [0,1000,0]);
		_myvec flyInHeight 60;
		_myvec limitSpeed 99999;
		_VarName = "MRH_HeliTaxi_Available" + str (side player);
		missionNamespace setVariable [_VarName,true,true];
		sleep 25;
		{deleteVehicle _x;}forEach crew _myvec;
		deleteVehicle _myvec;
	};
};