/////////////General List

_allVehicleConfigs = "true" configClasses (configFile >> "CfgVehicles");
_allVehicleConfigNames = _allVehicleConfigs apply {configName _x};

_allVehiclesArray = [];
{
_disp = getnumber (configfile >> "CfgVehicles" >> _x >> "scope");
_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory");
if (_disp == 2) then {
if (_x isKindOf "Helicopter_Base_F" or _x isKindOf "Plane_Base_F" or _x isKindOf "UAV" or _x isKindOf "Car_F" or _x isKindOf "Tank_F") then {_allVehiclesArray pushBackUnique _x; }
}
} forEach _allVehicleConfigNames;
missionNameSpace setVariable ["SPAWNER_ALLConfigVehicles", _allVehiclesArray, true];










_array = [];
/////////List Dlcs and put them as options
{
_dlc = gettext (configfile >> "CfgVehicles" >> _x >> "dlc");

if (_dlc == "") then {_dlc = "Vanilla";};
if !(_dlc in _array) then {
_array pushBack _dlc;};
} forEach _allVehiclesArray;

missionNameSpace setVariable ["SPAWNER_DLCsList", _array];

{
[_x , "CHECKBOX",gettext (configfile >> "CfgMods" >> _x >> "name"), "MRHSpawner Allowed DLCs", true,1, { call MRH_fnc_SpawnerAllowedDLCs;}] call cba_settings_fnc_init;
} forEach _array;
/////////////////////////Listfactions and put them as options
_FactionsArray = [];
{
_faction = gettext (configfile >> "CfgVehicles" >> _x >> "faction");


if !(_faction in _FactionsArray) then {
_FactionsArray pushBack _faction;};
} forEach _allVehiclesArray;
{
[_x , "CHECKBOX",gettext (configfile >> "CfgFactionClasses" >> _x >> "displayname"), "MRHSpawner Allowed Factions", true,1, { call MRH_fnc_SpawnerAllowedFactions;}] call cba_settings_fnc_init;
} forEach _FactionsArray;
missionNameSpace setVariable ["SPAWNER_FactionsList", _FactionsArray];

call MRH_fnc_SortFactionsAlgo;

