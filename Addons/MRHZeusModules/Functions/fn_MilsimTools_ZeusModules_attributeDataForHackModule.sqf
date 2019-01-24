/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
*/
#include "MRH_C_Path.hpp"
//uncomment the following for funcs called by modules
#include "MRH_MODULE_FUNC_MACROS_INC.sqf"

_unit = attachedTo _logic;

if (_unit isKindOf "Man") exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRCANTBEMAN"]FUNC(deleteAndError)};
createDialog "MRHAttributeDataForHackMenu";

_display = findDisplay 200119;
_display setVariable ["MRH_ZeusModules_displayparams",[_logic,_unit]];
_createAndAddText = localize "STR_MRH_MRHMRHZeusModules_CREATEANDADDHCK";
_addHackText = localize "STR_MRH_MRHMRHZeusModules_ADDHACKTOOBJ";
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_TITLETEXT = CTRLF(1000);
_TITLETEXT ctrlSetText _createAndAddText;
_ADDBUTTON = CTRLF(1604);
_ADDBUTTON ctrlSetText _createAndAddText;
_CREATETITLE = CTRLF(1010);
_CREATECOMBO = CTRLF(2100);
if !(isNull _unit) exitWith {
	{
		_x ctrlShow false;
	} forEach [_CREATECOMBO,_CREATETITLE];
	_TITLETEXT ctrlSetText _addHackText;
	_ADDBUTTON ctrlSetText _addHackText;
};

_creatable = ["Land_DataTerminal_01_F","Land_Laptop_device_F"];
{
	_index = _CREATECOMBO lbAdd (getText(configFile>>"cfgVehicles">>_x>>"displayName"));
	_CREATECOMBO lbSetData [_index,_x];

}forEach _creatable;
_CREATECOMBO lbSetCurSel 0;