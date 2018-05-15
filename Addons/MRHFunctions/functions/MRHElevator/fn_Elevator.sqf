params ["_object", "_PointA"];
_object setVariable ["passdestination", _PointA];

[_object, _PointA] execVM "\MRHFunctions\scripts\scr_ElevatorAddAceAction.sqf"; 