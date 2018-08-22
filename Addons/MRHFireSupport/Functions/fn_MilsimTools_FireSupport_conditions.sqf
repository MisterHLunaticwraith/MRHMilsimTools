/*
Function name:MRH_fnc_MilsimTools_conditions
Author: Mr H.
Description: Checks all conditions for the ace action to be displayed
Return value:
<BOOL> true if conditions are met, false otherwise
Public:No
Parameters:
0- <STRING> can be "Arty","CAS","SupplyD"
Example(s):
["Arty"] call MRH_fnc_MilsimTools_FireSupport_conditions;

*/
#include "MRH_C_Path.hpp"
params ["_actionsString"];
private _condition = true;
switch (true) do {

	case (_actionsString == "") :{};
	

	case (_actionsString == "Arty") :
		{
			
			private _forceLeaderSetting =  ["MRH_MilsimTools_FireSupport_ConditionIsFormLeader"] call cba_settings_fnc_get;
			if (_forceLeaderSetting) then {_condition = isFormationLeader player;};
			private _isCustomSettingSet = ["MRH_MilsimTools_FireSupport_isCustomConditionSet"] call cba_settings_fnc_get;
			if (_isCustomSettingSet) then
				{
					private _customSetString = ["MRH_MilsimTools_FireSupport_CustomCondition"] call cba_settings_fnc_get;
					
					
					_condition =call compile _customSetString;
					
				};
				private _allowFS = ["MRH_MilsimTools_FireSupport_useFireSupport"] call cba_settings_fnc_get;
				if !(_allowFS) then  {_condition = false;};
		};

	case (_actionsString == "CAS") :
		{
			
			private _forceLeaderSetting =  ["MRH_MilsimTools_FireSupport_CAS_ConditionIsFormLeader"] call cba_settings_fnc_get;
			if (_forceLeaderSetting) then {_condition = isFormationLeader player;};
			private _isCustomSettingSet = ["MRH_MilsimTools_FireSupport_CAS_isCustomConditionSet"] call cba_settings_fnc_get;
			if (_isCustomSettingSet) then
				{
					_customSetString = ["MRH_MilsimTools_FireSupport_CAS_CustomCondition"] call cba_settings_fnc_get;
					
					
					_condition =call compile _customSetString;
					
				};
			private _allowFS = ["MRH_MilsimTools_FireSupport_useCASSupport"] call cba_settings_fnc_get;
			if !(_allowFS) then {_condition = false;};
		};
	case (_actionsString == "SupplyD") :
		{
			
			private _forceLeaderSetting =  ["MRH_MilsimTools_FireSupport_Supplies_ConditionIsFormLeader"] call cba_settings_fnc_get;
			if (_forceLeaderSetting) then {_condition = isFormationLeader player;};
			private _isCustomSettingSet = ["MRH_MilsimTools_FireSupport_Supplies_isCustomConditionSet"] call cba_settings_fnc_get;
			if (_isCustomSettingSet) then
				{
					private _customSetString = ["MRH_MilsimTools_FireSupport_Supplies_CustomCondition"] call cba_settings_fnc_get;
					
					
					_condition =call compile _customSetString;
					Diag_Log format ["MRH_MilsimTools_FireSupport_Supplies - User set condition: %1" ,str _condition];
				};
			private _allowFS = ["MRH_MilsimTools_FireSupport_Supplies_useSupplyDrops"] call cba_settings_fnc_get;
			if !(_allowFS) then {_condition = false;};
		};
};
_condition