/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_conditionCall
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_conditionCall;
*/
#include "MRH_C_Path.hpp"



_condition = FUNC(isHeliTaxiAvailable);
_forceLeaderSetting =  ["MRH_MilsimTools_Heli_ConditionIsFormLeader"] call cba_settings_fnc_get;
if (_forceLeaderSetting) then {_condition =call {isFormationLeader player && (FUNC(isHeliTaxiAvailable))};};
_isCustomSettingSet = ["MRH_MilsimTools_Heli_isCustomConditionSet"] call cba_settings_fnc_get;
if (_isCustomSettingSet) then
	{
		_customSetString = ["MRH_MilsimTools_Heli_CustomCondition"] call cba_settings_fnc_get;
		_finalString = _customSetString + "&& (call MRH_fnc_MilsimTools_HeliTaxi_isHeliTaxiAvailable)";
		
		_condition =call compile _finalString;
		
	};
_allowTaxi = ["MRH_MilsimTools_Heli_UseHeliTaxiInMission"] call cba_settings_fnc_get;
if !(_allowTaxi) then {_condition = false;};
_condition