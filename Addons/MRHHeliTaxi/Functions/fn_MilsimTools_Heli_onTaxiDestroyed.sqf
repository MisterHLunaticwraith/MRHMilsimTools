params ["_unit"];

[[player,_unit],{
		params ["_player","_unit"];
		if ((group player) != (group _player)) ExitWith {};
		playSound "MRH_HeliTaxi_ReaperDown";
[side _player, "HQ"] sideChat format [localize "STR_MRH_HeliTaxi_HeliDown",(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,([position _unit] call MRH_fnc_MilsimTools_Core_realisticGrid)];
}] RemoteExec ["Spawn", [-2,0] select isServer];

call MRH_fnc_MilsimTools_Heli_clearDataSpace;