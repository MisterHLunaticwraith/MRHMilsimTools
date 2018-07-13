params ["_target"];
_target addEventHandler ["HitPart", {[(_this select 0)] call MRH_fnc_ReturnShotParams;}];
if (_target isKindOf "Man") then {_target addEventHandler ["Hit", {(_this select 0)setVariable ["MRH_TargetReceivedDamage", (_this select 2), true];}];};
