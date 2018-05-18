/*
Function name: MRH_fnc_Refresh
Author: Mr H.
Description: Refreshes the list with data on selected vehicle
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_Spawner_Refresh;
*/

disableserialization;

_ctrlLIST = ((findDisplay 2121) displayCtrl 1500);
_cursel = lbCurSel 1500;
_classname = _ctrlLIST lbData _cursel;
_pic = gettext (configfile >> "CfgVehicles" >> _classname >> "editorpreview");
((findDisplay 2121) displayCtrl 1201) ctrlSetText _pic;
_icon = gettext (configfile >> "CfgVehicles" >> _classname >> "icon");
((findDisplay 2121) displayCtrl 1203) ctrlSetText _icon;

_name = gettext (configfile >> "CfgVehicles" >> _classname >> "displayName");

_name = "<t font = 'PuristaLight'><t size = '1'><t color = '#ba2f01'>" + _name + "</t>";
_name = parsetext _name;

((findDisplay 2121) displayCtrl 1100) ctrlSetStructuredText _name;
uinamespace setVariable ["MRH_Spawner_tospawnclassname", _classname];