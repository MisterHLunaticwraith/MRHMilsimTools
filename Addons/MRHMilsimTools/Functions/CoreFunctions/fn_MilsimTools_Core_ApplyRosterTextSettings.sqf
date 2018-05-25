/*
Function name: MRH_fnc_MilsimTools_Core_ApplyRosterTextSettings
Author: Mr H.
Description: prepares the parameters for the roster function, applying cba settings, this is separated from the roster script because admins will have the possibility to bypass these parameters: None
Return value: <ARRAY> [groups, showAi]
Public: No
Parameters:None
Example(s):
_parameters = call MRH_fnc_MilsimTools_Core_ApplyRosterTextSettings;
_rosterText =  _parameters call MRH_fnc_MilsimTools_Core_GenerateRosterText;
*/

_showAllSides = ["MRH_MilsimTools_Roster_AllowAllSides"] call cba_settings_fnc_get;

_showGroupsWithPlayers = ["MRH_MilsimTools_Roster_ShowAIgroups"] call cba_settings_fnc_get;
_showAIs =  ["MRH_MilsimTools_Roster_ShowAiWithinGrps"] call cba_settings_fnc_get;
if (!_showAIs) then {_showGroupsWithPlayers = false};
_allGroups = allGroups;


if (!_showGroupsWithPlayers) then {_allGroups = call MRH_fnc_MilsimTools_Core_ListGroupsWithPlayers;};
if (!_showAllSides) then {_allGroups =[_allGroups,side player]call MRH_fnc_MilsimTools_Core_SortGroupsBySide;};
[_allgroups,_showAIs]