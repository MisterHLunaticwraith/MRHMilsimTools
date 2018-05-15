_allVehicleConfigNames = missionNamespace getVariable "SPAWNER_ALLConfigVehicles";
_allAllowedDLCs = missionNamespace getVariable "SPAWNER_Allowed_DLCsList";
_allAllowedFactions = missionNamespace getVariable "SPAWNER_Allowed_FactionsList";


_allVehiclesInDLCsArray = [];
{
_dlc = gettext (configfile >> "CfgVehicles" >> _x >> "dlc");
if (_dlc == "") then {_dlc = "Vanilla";};
if (_dlc in _allAllowedDLCs && !(_dlc in _allVehiclesInDLCsArray)) then {_allVehiclesInDLCsArray pushBack _x};

} forEach _allVehicleConfigNames;


///////////////////
_allFactionsFromAllowedFactions = [];
{
_faction = gettext (configfile >> "CfgVehicles" >> _x >> "faction");
if (_faction in _allAllowedFactions && !(_faction in _allFactionsFromAllowedFactions)) then { _allFactionsFromAllowedFactions pushBack _x};
} forEach _allVehiclesInDLCsArray;



/////////
_allRemainingFactions = [];
{
_faction = gettext (configfile >> "CfgVehicles" >> _x >> "faction");
if !(_faction in _allRemainingFactions) then {_allRemainingFactions pushBack _faction};
} forEach _allFactionsFromAllowedFactions;

missionNamespace setVariable ["SpawnerFilteredFactions", _allRemainingFactions];
//////////////////////////////////////////////////////
//_selectedDLC = player getVariable "userSelectedDLC";

