/*
Function name:MRH_fnc_removeNVGs
Author: Mr H.
Description: this function lists all NVGs From config files, checks if they are in the given unit's inventory OR/AND NVG dedicated slot and removes them, stores them in a variable. 
Return value:None
Public: Yes
Parameters:
0 - <OBJECT> - Unit to remove NVGs from.
Example(s):
[player] call MRH_fnc_removeNVGs;
*/
params ["_unit"];


//get all objects from cfgWeapons
_allWeaponsConfigs = "true" configClasses (configFile >> "CfgWeapons");
_allWeaponsConfigNames = _allWeaponsConfigs apply {configName _x};

_allNVGsArray = [];
{
_disp = getnumber (configfile >> "CfgWeapons" >> _x >> "scope");
_macro = gettext (configfile >> "CfgWeapons" >> _x >> "_generalMacro");
if (isNil "_macro") then {_macro = "";};
if ((_disp == 2) && (_macro == "NVGoggles")) then 
{
_allNVGsArray pushBackUnique _x; 

}; 

} forEach _allWeaponsConfigNames;

_assignedItems = assigneditems _unit;
_items = items _unit;
_toSave = [];
_toSaveAssigned = [];
{
if (_x in _items) then {_unit removeItem _x; _toSave pushBack _x;};
if (_x in _assignedItems) then {_unit unlinkItem _x; _toSaveAssigned pushBackUnique _x;};

} forEach _allNVGsArray;
_passedToVar = [_toSave, _toSaveAssigned];
_unit setVariable ["MRH_SavedPreviousNVGs", _passedToVar,false];
