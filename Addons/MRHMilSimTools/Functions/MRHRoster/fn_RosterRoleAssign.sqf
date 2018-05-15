
{
if (isFormationLeader _x) then {
_full = roleDescription _x;
_role = _full splitString "@" select 0;
_group = _full splitString "@" select 1;
_x setVariable ["displayName",_role];
(group _x) setGroupID [_group];
}

else


{
_role = roleDescription _x;
_x setVariable ["displayName",_role];
} 
} forEach playableUnits;



///================TeamRoster==========
[2,true,true] call MRH_fnc_StartUpRoster; //défaut
