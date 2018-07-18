

_myvec = player getVariable "MRH_TaxiHeli";
[_myvec] spawn {
	params ["_myvec"];
	sleep 3;
	hintC localize "STR_MRH_HeliTaxi_TaxiCanceled";
	_myvec commandMove (player modelToWorld [0,+2000,0]);
	sleep 30;
	{deleteVehicle _x;}forEach crew _myvec;
		deleteVehicle _myvec;
	};




	[[player,_myvec],{
		params ["_player","_myvec"];
		if ((group player) != (group _player)) ExitWith {};
		playSound "MRH_HeliTaxi_CancelT";
	_player sideChat format [localize "STR_MRH_HeliTaxi_RequestCancel",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	sleep 4;
		playSound "MRH_HeliTaxi_Cancelled";
	_myvec sideChat format [localize "STR_MRH_HeliTaxi_ReceivedCancelRequest",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	}] RemoteExec ["Spawn", [-2,0] select isServer];

call MRH_fnc_MilsimTools_Heli_clearDataSpace;