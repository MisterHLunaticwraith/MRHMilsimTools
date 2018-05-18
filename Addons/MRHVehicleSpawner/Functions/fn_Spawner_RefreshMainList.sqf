/*
Function name: MRH_fnc_RefreshMainList
Author: Mr H.
Description: refreshes the main list of the interface
Return value: None
Public: No
Parameters: None
Example(s): call MRH_fnc_Spawner_RefreshMainList;
*/

disableserialization;
////////////// puts all vehicles incombolist
//recupere la liste des dlc autorisés:
_DLCisAllowedList = missionNamespace getVariable "SPAWNER_Allowed_DLCsList";
_FactionsAllowedList = missionNamespace getVariable "SPAWNER_Allowed_FactionsList";
_playerSelectedDLC = player getVariable "userSelectedDLC";
////clear previouslist
lbClear 1500;
[] Spawn {
disableserialization;
_sourceObject = player getVariable "SourceObjectSpawner";///ici
_Type = _sourceObject getVariable "TypeToSpawn"; 
waitUntil {!isNil "_Type"};

_array = call MRH_fnc_Spawner_FilterAll;
waitUntil {!isNil "_array"};
//temporaire à remplacer parfiltrées





////////////// puts all vehicles incombolist
//recupere la liste des dlc autorisés:
_DLCisAllowedList = missionNamespace getVariable "SPAWNER_Allowed_DLCsList";
_FactionsAllowedList = missionNamespace getVariable "SPAWNER_Allowed_FactionsList";
_playerSelectedDLC = player getVariable "userSelectedDLC";
_playerSelectedFaction = player getVariable "userSelectedFaction";

{
_ctrlLIST = ((findDisplay 2121) displayCtrl 1500);
_icon = gettext (configfile >> "CfgVehicles" >> _x >> "icon");
_name = gettext (configfile >> "CfgVehicles" >> _x >> "displayName");
_dlc = gettext (configfile >> "CfgVehicles" >> _x >> "dlc");
_dlcPic = gettext (configfile >> "CfgMods" >> _dlc >> "logo");
_faction = gettext (configfile >> "CfgVehicles" >> _x >> "faction");
if (_dlc == "") then {_dlc = "Vanilla";
_dlcPic = "\MRHVehicleSpawner\Paa\arma3.paa";};
//if (_dlc == "All") then {_name = "All";};
///redefinescategories accordinglywith usersettings
_DLCFinal = [];
if !(isNil "_playerSelectedDLC") then {_DLCFinal = _playerSelectedDLC;
if ("All" in _playerSelectedDLC) then {_DLCFinal = _DLCisAllowedList};
} else {_DLCFinal = _DLCisAllowedList};

_FactionFinal = [];
if !(isNil "_playerSelectedFaction") then {_FactionFinal = _playerSelectedFaction;
_allRelevantFactions = missionNamespace getVariable "SpawnerFilteredFactions";
if ("All" in _playerSelectedFaction) then {_FactionFinal = _allRelevantFactions;};
} else {_FactionFinal = _FactionsAllowedList};


//////////////////////////////////PlacesinList
if (_dlc in _DLCFinal && _faction in _FactionFinal) then {
_index = _ctrlLIST  lbAdd  _name;
lbSetPictureColor [1500, _index, [0,0,0,0]];
lbSetPicture [1500, _index, _icon];
lbSetPictureRight [1500, _index, _dlcPic];
lbSetTooltip [1500, _index, _dlc];
_MRHvalue = _x;
lbSetData [1500, _index, _MRHvalue]; 
};
} forEach _array;


////SetsDlcChoice
//_DLCisAllowedList = missionNamespace getVariable "SPAWNER_Allowed_DLCsList";
//_DLCisAllowedList append ["All"];
lbClear 2101;
_ctrlcomboDLC = ((findDisplay 2121) displayCtrl 2101);
_allChoice =_ctrlcomboDLC lbAdd "All";
lbSetData [2101, _allChoice, "All"];
{

_prettyDLCName = (gettext (configfile >> "CfgMods" >> _x >> "name"));
if (_x == "All") then {_prettyDLCName = "All";};
if (_prettyDLCName =="") then {_prettyDLCName = "Vanilla"};
_indexDLC = _ctrlcomboDLC lbAdd _prettyDLCName; 
lbSetData [2101, _indexDLC, _x];
} forEach _DLCisAllowedList;
//////endsetsdlcChoice






//////////endspan
};