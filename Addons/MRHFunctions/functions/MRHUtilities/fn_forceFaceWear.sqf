//[this,"rhsusf_shemagh2_gogg_tan"] call MRH_fnc_forceFaceWear;
params ["_avatar","_gogles"];
[_avatar,_gogles] Spawn
{
	params ["_avatar","_gogles"];
	waitUntil {(player == player) && (time>1)};
	if (player == _avatar) then {player addGoggles _gogles};
};
true
 