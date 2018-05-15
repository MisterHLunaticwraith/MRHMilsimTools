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
uinamespace setVariable ["tospawnclassname", _classname];