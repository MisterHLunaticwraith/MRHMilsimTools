hint "called";
/*
_object = _this select 0;
_PointA = _this select 1;
hint str _object;
_object say3D "ElevatorDing";
_progress =
[5, 
[],
{hint "L'ascenseur démarre"; 
_object = _this select 0;
_PointA = _this select 1;

[[_object, _PointA], ["\MRHFunctions\scripts\scr_ElevatorCore.sqf"]] RemoteExec ["ExecVM", 0, false];///
},
{hint "Action annulée"},
"Vous allez prendre l'ascenseur"


] call ace_common_fnc_progressBar;
*/