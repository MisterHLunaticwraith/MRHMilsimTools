#include "MRH_components.hpp"
_player = player GVAR(AdminSelectedPlayer);
params ["_punishment"];
systemchat _punishment;
switch (true) do {
case (_punishment == "pushups") : {[[_player], { (_this select 0) playMove "AmovPercMstpSnonWnonDnon_exercisePushup"}] RemoteExec ["Spawn",0, false];};
case (_punishment == "squats") : {[[_player], { (_this select 0) playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA"; sleep 6; (_this select 0) playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";}] RemoteExec ["Spawn",0, false];};

case (_punishment == "chicken") : {_expl1 = "Cock_random_F" createVehicle position _player; _expl1 attachTo [_player, [-0.1, 0.1, 0.15], "Head"]; _expl1 setVectorDirAndUp [ [0.5, 0.5, 0], [-0.5, 0.5, 0] ]; _player SVAR(SpawnedChicken,_expl1,true)};

case (_punishment == "removechicken") : {_chicken = _player GVAR(SpawnedChicken); deleteVehicle _chicken;};
/*
case (_punishment ==) : {};
case (_punishment ==) : {};
*/
};