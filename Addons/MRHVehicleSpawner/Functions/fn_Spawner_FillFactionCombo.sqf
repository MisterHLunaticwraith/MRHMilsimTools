/*
Function name: MRH_fnc_FillFactionCombo
Author: Mr H.
Description: Refreshes the interface with the list of allowed factions
Return value: none
Public: no
Parameters: none 
Example(s):
call MRH_fnc_Spawner_FillFactionCombo;
*/

disableserialization;
_allVehicleConfigNames = missionNamespace getVariable "SPAWNER_ALLConfigVehicles";
_allAllowedDLCs = missionNamespace getVariable "SPAWNER_Allowed_DLCsList";
_allAllowedFactions = missionNamespace getVariable "SPAWNER_Allowed_FactionsList";
_selectedDLC = player getVariable "userSelectedDLC";
if ("All" in _selectedDLC) then {_selectedDLC = _allAllowedDLCs};

_allVehiclesInDLCsArray = [];
{
_dlc = gettext (configfile >> "CfgVehicles" >> _x >> "dlc");
if (_dlc == "") then {_dlc = "Vanilla";};
if (_dlc in _selectedDLC && _dlc in _allAllowedDLCs && !(_dlc in _allVehiclesInDLCsArray)) then {_allVehiclesInDLCsArray pushBack _x};

} forEach _allVehicleConfigNames;


///////////////////
_allFactionsFromAllowedFactions = [];
{
_faction = gettext (configfile >> "CfgVehicles" >> _x >> "faction");
if (_faction in _allAllowedFactions && !(_faction in _allFactionsFromAllowedFactions)) then { _allFactionsFromAllowedFactions pushBack _x};
} forEach _allVehiclesInDLCsArray;



/////////
_allRemainingFactions = ["All"];
{
_faction = gettext (configfile >> "CfgVehicles" >> _x >> "faction");
if !(_faction in _allRemainingFactions) then {_allRemainingFactions pushBack _faction};
} forEach _allFactionsFromAllowedFactions;


//////////////////////////////////////////////////////



////setsFactionChoice
_FilteredFactions = missionNamespace getVariable "SpawnerFilteredFactions";
//_AllowedFactionList = missionNamespace getVariable "SPAWNER_Allowed_FactionsList";
lbClear 2102;
_ctrlcomboFL = ((findDisplay 2121) displayCtrl 2102);
{

_prettyFactionName = (gettext (configfile >> "CfgFactionClasses" >> _x >> "displayname"));
if (_x == "All") then { _prettyFactionName = localize "STR_MRH_SPAWNER_ALL_FEMALE";};
//if (_prettyFactionNameName =="") then {_prettyDLCName = "Vanilla"};
_indexFaction = _ctrlcomboFL lbAdd _prettyFactionName; 
lbSetData [2102, _indexFaction, _x];
} forEach _allRemainingFactions;
//_allRemainingFactions;
//////endsetsdlcChoice