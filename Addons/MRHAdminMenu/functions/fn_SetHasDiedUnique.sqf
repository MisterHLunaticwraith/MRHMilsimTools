params ["_givenplayer", "_hasdied"];
_givenplayer setVariable ["HasDied", _hasdied, true];
systemchat format ["La variable HASDIED du joueur a été passée à %1", str _hasdied];