params ["_player"];
[_player] spawn {
params ["_player"];
waitUntil {alive player};
_heli = player getVariable "MRH_TaxiHeli";
_heli setDamage 1;
Diag_Log "MRH_MilsimTools_HeliTaxi: owner was killed and heli destroyed";
};