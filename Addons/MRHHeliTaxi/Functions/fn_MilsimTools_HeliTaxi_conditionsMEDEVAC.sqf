/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"
if (missionNameSpace getVariable ["MRH_HeliTaxi_medEvac_calledForSide_"+ str(side MRH_player),false]) exitWith {false};
_timeCheck = [side MRH_player,"MRH_MilsimTools_MEDEVAC_DelayBetween"] FUNC(returnRemainingWaitTime);
_can = _timeCheck select 0;
if !(_can) exitWith {false};
_condition = true;
_forceLeaderSetting =  ["MRH_MilsimTools_MEDEVAC_ConditionIsFormLeader"] call cba_settings_fnc_get;
if (_forceLeaderSetting) then {_condition =call {isFormationLeader MRH_player};};

_isCustomSettingSet = ["MRH_MilsimTools_MEDEVAC_isCustomConditionSet"] call cba_settings_fnc_get;
if (_isCustomSettingSet) then
	{
		_customSetString = ["MRH_MilsimTools_MEDEVAC_CustomCondition"] call cba_settings_fnc_get;
		//_finalString = _customSetString + "&& (call MRH_fnc_MilsimTools_HeliTaxi_isHeliTaxiAvailable)";
		
		
		_condition =call compile _customSetString;
		if !((typeName _condition) isEqualTo "BOOL") then {_condition = true;
			hintSilent format ["Error custom set condition %1 doesn't return boolean", _customSetString];
		};
		
	};

_allowMed = ["MRH_MilsimTools_MEDEVAC_UseMedEVACInMission"] call cba_settings_fnc_get;
if !(_allowMed) then {_condition = false;};

_condition
