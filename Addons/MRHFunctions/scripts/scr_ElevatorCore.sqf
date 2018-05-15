_object = _this select 0;
_PointA = _object getVariable "passdestination";
_dist = player distance _object;
if (_dist >10) ExitWith {};
player setPosATL (getPosATL _PointA);

_test = [] spawn {_video = ["\MRHFunctions\videos\elevator.ogv"] spawn BIS_fnc_playVideo; waitUntil {!(isNil "BIS_fnc_playVideo_finished")};};
sleep 7;
playsound "ElevatorDing";