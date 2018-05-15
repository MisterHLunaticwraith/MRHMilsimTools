_EHkilledIdx = player addEventHandler ["killed", {
publicPlayerKilled = publicPlayerKilled + 1;
publicVariable "publicPlayerKilled";

MRH_fnc_AdminDeadCount remoteExec ["Call", 0, true];
player setVariable ["hasDied", true, true];

}]
//call MRH_fnc_AdminDeadCount;