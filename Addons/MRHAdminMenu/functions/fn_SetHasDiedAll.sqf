params ["_hasdied"];
{_x setVariable ["HasDied", _hasdied, true];} forEach AllPlayers;
systemchat format ["La variable HASDIED de tous les joueurs a été passée à %1", str _hasdied];
if (!_hasdied) then {
publicPlayerKilled = 0;
publicVariable "publicPlayerKilled";
};