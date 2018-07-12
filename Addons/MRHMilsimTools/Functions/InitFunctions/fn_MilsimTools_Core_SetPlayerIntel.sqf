/*
Function name: MRH_fnc_MilsimTools_Core_SetPlayerIntel;
Author: Mr H.
Description: Sets player Intel by reading role description. Attributes each playable unit the variable "MRH_MilsimTools_Core_PlayerIntel"
is called at Init
Return value: returns true when done
Public: No
Parameters: None
Example(s):
call MRH_fnc_MilsimTools_Core_SetPlayerIntel;
*/

//first assign variables to teamleaders
{
	if (isFormationLeader _x) then 
	{
	    private ["_full","_role","_group","_radioFrequency","_splitRole"];
		_full = roleDescription _x;
		if (_full == "") then {_full = getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName");};
		_role = _full;
		_group = groupId (group _x);
		_radioFrequency = "Undefined";
		
		
		_splitRole = _full splitString "@|";
		
		
		_definedByMission = count _splitRole;
		Diag_log str _definedByMission;
		switch (true) do {
		
			case (_definedByMission == 1) : {Diag_log format ["MRHMilsimTools Init Player Variables- no role defined for unit: %1 ",str _x]};
			case (_definedByMission == 2) : {_role = _splitRole select 0; _group = _splitRole select 1;(group _x) setGroupID [_group];Diag_log format ["MRHMilsimTools Init Player Variables- unit: %1,group defined: %2 role defined %3, no radio frequency defined",str _x, _group,_role]};
			case (_definedByMission == 3) : {_role = _splitRole select 0; _group = _splitRole select 1;(group _x) setGroupID [_group];_radioFrequency = _splitRole select 2;Diag_log format ["MRHMilsimTools Init Player Variables- unit: %1,group defined: %2 role defined %3,radio frequency defined: %4",str _x, _group,_role, _radioFrequency]};
			case (_definedByMission > 3 or _definedByMission ==0) :{Diag_log format ["MRHMilsimTools Init Player Variables- ERROR for unit: %1, characters '@' and '|' are to be used only once each and in that order",str _x]}
			
		};
		_x setVariable ["MRH_MilsimTools_Core_PlayerIntel",[_group,_role,_radioFrequency],true];
		
	
	};
} forEach playableUnits;

// then use it to assign variables to teamMembers

{
	if (!isFormationLeader _x) then 
	{
	_role = roleDescription _x;
	if (_role == "") then {_role = getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName");};
	_leaderInfo = (leader group _x) getVariable "MRH_MilsimTools_Core_PlayerIntel";
	if (!isNil "_leaderInfo") then 
		{
		_group = _leaderInfo select 0;
		_radioFrequency = _leaderInfo select 2;
		_x setVariable ["MRH_MilsimTools_Core_PlayerIntel",[_group,_role,_radioFrequency],true];
		};
	};
}  forEach playableUnits;
