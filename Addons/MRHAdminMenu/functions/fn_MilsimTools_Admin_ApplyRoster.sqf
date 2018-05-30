/*
Function name: MRH_fnc_MilsimTools_Admin_ApplyRoster
Author: Mr H.
Description: Applies roster with settings to the menu
Return value: None
Public: No
Parameters:
Example(s):
call MRH_fnc_MilsimTools_Admin_ApplyRoster;
*/
#include "MRH_C_Path.hpp"
//get settings
_showAIgrps = cbChecked FDIS(2800);
_showAIinPlayergrps = cbChecked FDIS(2801);
_sideToShow = lbdata [2101,(lbCurSel 2101)];

// select side to sort according with settings
_sideToPass = west;
switch (true) do {
case (_sideToShow == "Blu"): {_sideToPass = West};
case (_sideToShow == "Op"): {_sideToPass = East};
case (_sideToShow == "Inde"): {_sideToPass = Independent};
case (_sideToShow == "Civ"): {_sideToPass = Civilian};
};

// sort groups according to selected side


_allGroups = allGroups;
if (!_showAIinPlayergrps) then {_showAIgrps= false};
if (!_showAIgrps) then {_allGroups = CFUNC(ListGroupsWithPlayers);};
_allGroups = [_allGroups,_sideToPass] CFUNC(SortGroupsBySide);

_rostertext = [_allGroups,_showAIinPlayergrps] CFUNC(GenerateRosterText);
_rostertext = "<t size = '0.8'"+ _rostertext +"</t>";
_roster = FDIS(1105);
_roster ctrlSetStructuredText parseText _rostertext;
[260518,1105] CFUNC(SetCtrlSize);
