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

	params ["_pivot","_dataInput"];

	_compObjects = [];
	{

		_x params ["_class","_relPos","_relDir","_isAceMedicalFacility","_isMRHSatelliteConsole","_isMRHSatelliteScreen","_isAmmoBox","_AmmoCrateParams",["_isAceRepairFacility",0]];
		private _object = [_pivot,_class,_relPos,_relDir,_isAceMedicalFacility,_isMRHSatelliteConsole,_isMRHSatelliteScreen,_isAmmoBox,_AmmoCrateParams,_isAceRepairFacility] FUNC(cmpCreateObject);
		_compObjects pushBackUnique _object;
	} forEach _dataInput;
	_compObjects