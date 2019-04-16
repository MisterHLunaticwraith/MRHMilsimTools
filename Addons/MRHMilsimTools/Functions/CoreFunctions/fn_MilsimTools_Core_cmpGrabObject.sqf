/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_pivot","_objectToGrab"];

_relPos = _pivot worldToModel (getPosATL _objectToGrab);
_dir = getDir _pivot;
_objDir = getDir _objectToGrab;
_relDir = (_objDir - _dir);
_className = typeOf _objectToGrab;
_isAceMedicalFacility =_objectToGrab getVariable ["ace_medical_ismedicalfacility",false];
_isMRHSatelliteConsole = _objectToGrab getVariable ["MRH_Sat_isSatelliteConsole",false];
_isMRHSatelliteScreen = _objectToGrab getVariable ["MRH_Sat_isSatelliteScreen",false];
_AmmoCrateParams = _objectToGrab getVariable ["MRH_AmmoCrateParameters",[]];
_isAmmoBox = false;
_isAceRepairFacility = _objectToGrab getVariable ["ace_isrepairfacility",0];
if !(_AmmoCrateParams isEqualTo[]) then {
	_isAmmoBox = true,
	_AmmoCrateParams deleteAt 0;
	};
_return = [_className,_relPos,_reldir,_isAceMedicalFacility,_isMRHSatelliteConsole,_isMRHSatelliteScreen,_isAmmoBox,_AmmoCrateParams,_isAceRepairFacility];
_return