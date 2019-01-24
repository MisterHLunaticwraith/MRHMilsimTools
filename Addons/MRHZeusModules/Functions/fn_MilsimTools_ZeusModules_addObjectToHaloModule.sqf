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
#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_unit = attachedTo _logic;
//systemChat format ["%1 %2",_logic,attachedObjects _logic];

if (isNull _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRNOOBJESEL"]FUNC(deleteAndError)};
if (_unit isKindOf "Man") exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRCANTBEMAN"]FUNC(deleteAndError)};

_logic setVariable ["MRH_fnc_MilsimTools_ZeusModules_attachedUnit",_unit];
_unit setVariable ["MRH_ZeusModules_qualifiesForHalo",true,true];
_unit setVariable ["MRH_ZeusModules_qualifiesForHaloAssociatedLogic",_logic,true];

_displayName = getText (configFile >> "cfgVehicles">>typeOf _unit>>"displayName");
[_unit, format [localize "STR_MRH_MRHMRHZeusModules_HALOADDEDMESS",_displayName]] call BIS_fnc_showCuratorFeedbackMessage;

_logic addEventHandler ["Deleted", {
	params ["_entity"];
	_unit = _entity getVariable ["MRH_fnc_MilsimTools_ZeusModules_attachedUnit",objNull];
	_unit setVariable ["MRH_ZeusModules_qualifiesForHalo",nil,true];
	_displayName = getText (configFile >> "cfgVehicles">>typeOf _unit>>"displayName");
	[_unit, format [localize "STR_MRH_MRHMRHZeusModules_HALORMVLIST",_displayName]] call BIS_fnc_showCuratorFeedbackMessage;
}];

_unit addEventHandler ["Deleted", {
	params ["_entity"];
	_logic = _entity getVariable ["MRH_ZeusModules_qualifiesForHaloAssociatedLogic",objNull];
	deleteVehicle _logic;
}];