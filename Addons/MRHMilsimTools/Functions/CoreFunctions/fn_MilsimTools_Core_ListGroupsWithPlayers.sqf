/*
Function name: MRH_fnc_MilsimTools_Core_ListGroupsWithPlayers
Author: Mr H. (original code grabbed from the web somewhere, I don't remember where...)
Description: Lists groups with players in them
Return value: <ARRAY> of groups
Public: No
Parameters: None
Example(s):
_groupsWithPlayers = call MRH_fnc_MilsimTools_Core_ListGroupsWithPlayers;
*/

_GroupsWithPlayers = [];
	{
		_units = units _x;
		if ({isPlayer _x} count _units >= 1) then 
		{
			_GroupsWithPlayers set [count _GroupsWithPlayers,_x];
		};
	} 
forEach allGroups;
_GroupsWithPlayers