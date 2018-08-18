params ["_vec","_destination"];
[_vec,_destination] spawn {
		params ["_vec","_destination"];
		waitUntil {([_vec,_destination] call MRH_fnc_travelTimeEta) <= 60};
		_dist = _destination distance _vec;
		_dist = _dist /1000;
		_dist = [_dist, 1] call BIS_fnc_cutDecimals;
		
		[[player,_vec,_dist],{
		params ["_player","_vec","_dist"];
		if !(player in _vec) ExitWith {};
		playSound "MRH_HeliTaxi_ETA";
		_vec sideChat format [localize "STR_MRH_HeliTaxi_ETAoneMike",str _dist,groupID group _vec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
		}] RemoteExec ["Spawn", [-2,0] select isServer];
		
		};