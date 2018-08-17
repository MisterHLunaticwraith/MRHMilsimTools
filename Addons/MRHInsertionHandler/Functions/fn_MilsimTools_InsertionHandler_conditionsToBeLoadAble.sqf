/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_conditionsToBeLoadAble;
*/
#include "MRH_C_Path.hpp"
params ["_object"];
//base will only apply to thingX "LandVehicle" "Boat_F"
_allConditionsCheck = false;
//----detect if there is a planner in the area
_allNearObjects = _object nearObjects 50;
_isNearEnough = false;
{
	_var= _x getVariable ["MRH_InsertionHandler_isAirInsertionPlanner_"+ (str side player),false];
  if(_var) then {_isNearEnough =true};
}forEach _allNearObjects;
//----- mass condition
_okMass = false;
if (((getmass _object) < 10000) && ((getmass _object) >= 5)) then {_okMass = true};

//-----check that all conditions are met and return verdict
if (_isNearEnough && _okMass) then {_allConditionsCheck = true};
//----FORCE OVERRIDES
/* Can be forced by mission maker by setting MRHMT_canBeLoaded variable to true*/
_forcedByMission = _object getVariable ["MRHMT_canBeLoaded",false];
if (_forcedByMission && _isNearEnough) then {_allConditionsCheck = true};
/* Can be forced by mod makers by adding to cfg vehicles*/
_typeOf = typeOf _object;
_check = getNumber (configFile>>"cfgVehicles">>_typeOf>>"MRHMT_canBeLoaded");
_isForcedFromCfg = [false,true] select _check;
if (_isForcedFromCfg && _isNearEnough) then {_allConditionsCheck = true};
/* preping is disabled for this object*/
_prepingDisabled = _object getVariable ["MRHMT_forceUnloadable",false];
if (_prepingDisabled) then {_allConditionsCheck = false};
//----------return
_allConditionsCheck