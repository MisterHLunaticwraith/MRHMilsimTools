/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_

*/
#include "MRH_C_Path.hpp"
//create parent action
[] spawn {
_allowFS = ["MRH_MilsimTools_FireSupport_useFireSupport"] call cba_settings_fnc_get;
_allowFS2 = ["MRH_MilsimTools_FireSupport_useCASSupport"] call cba_settings_fnc_get;
_allowFS3 = ["MRH_MilsimTools_FireSupport_Supplies_useSupplyDrops"] call cba_settings_fnc_get;
if (!_allowFS && !_allowFS2 && !_allowFS3) ExitWith {Diag_Log "MRH_MilsimTools_FireSupport_All - All supports disabled in this mission"};


_action = ["MRH_FireSupport_Actions",localize "STR_MRH_FireSupport_AceBaseActionCall",PAAPATH(radiocall.paa),{},{true}] call ace_interact_menu_fnc_createAction;
["CAManBase",1,['ACE_SelfActions'],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
//create action for Artillery
[] spawn {
_allowFS = ["MRH_MilsimTools_FireSupport_useFireSupport"] call cba_settings_fnc_get;
if !(_allowFS) ExitWith {Diag_Log "MRH_MilsimTools_FireSupport_Arty - Artillery support disabled in this mission"};

_condition = {true};
_forceLeaderSetting =  ["MRH_MilsimTools_FireSupport_ConditionIsFormLeader"] call cba_settings_fnc_get;
if (_forceLeaderSetting) then {_condition = {isFormationLeader player};};
_isCustomSettingSet = ["MRH_MilsimTools_FireSupport_isCustomConditionSet"] call cba_settings_fnc_get;
if (_isCustomSettingSet) then
	{
		_customSetString = ["MRH_MilsimTools_FireSupport_CustomCondition"] call cba_settings_fnc_get;
		//_finalString = _customSetString + "&& (call MRH_fnc_MilsimTools_Heli_isHeliTaxiAvailable)";
		
		_condition = compile _customSetString;
		Diag_Log format ["MRH_MilsimTools_FireSupport_Arty - User set condition: %1" ,str _condition];
	};


_action = ["MRH_FireSupport_Call",localize "STR_MRH_FireSupport_CallArtilleryStrikeAceAction",PAAPATH(mortar.paa),{call MRH_fnc_MilsimTools_FireSupport_OpenArtyInterface;},_condition] call ace_interact_menu_fnc_createAction;
["CAManBase",1,['ACE_SelfActions','MRH_FireSupport_Actions'],_action,true] call ace_interact_menu_fnc_addActionToClass;
};

//create action for CAS
[] spawn {
_allowFS = ["MRH_MilsimTools_FireSupport_useCASSupport"] call cba_settings_fnc_get;
if !(_allowFS) ExitWith {Diag_Log "MRH_MilsimTools_FireSupport_CAS - CAS support disabled in this mission"};

_condition = {true};
_forceLeaderSetting =  ["MRH_MilsimTools_FireSupport_CAS_ConditionIsFormLeader"] call cba_settings_fnc_get;
if (_forceLeaderSetting) then {_condition = {isFormationLeader player};};
_isCustomSettingSet = ["MRH_MilsimTools_FireSupport_CAS_isCustomConditionSet"] call cba_settings_fnc_get;
if (_isCustomSettingSet) then
	{
		_customSetString = ["MRH_MilsimTools_FireSupport_CAS_CustomCondition"] call cba_settings_fnc_get;
		//_finalString = _customSetString + "&& (call MRH_fnc_MilsimTools_Heli_isHeliTaxiAvailable)";
		
		_condition = compile _customSetString;
		Diag_Log format ["MRH_MilsimTools_FireSupport_CAS - User set condition: %1" ,str _condition];
	};


_action = ["MRH_FireSupport_CAS_Call",localize"STR_MRH_FireSupport_CallCASACEAction",PAAPATH(fighterjet.paa),{call MRH_fnc_MilsimTools_FireSupport_OpenCASInterface;},_condition] call ace_interact_menu_fnc_createAction;
["CAManBase",1,['ACE_SelfActions','MRH_FireSupport_Actions'],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
//create action for supply drops

[] spawn {
_allowFS = ["MRH_MilsimTools_FireSupport_Supplies_useSupplyDrops"] call cba_settings_fnc_get;
if !(_allowFS) ExitWith {Diag_Log "MRH_MilsimTools_FireSupport_SupplyDrops - Suplly drops disabled in this mission"};

_condition = {true};
_forceLeaderSetting =  ["MRH_MilsimTools_FireSupport_Supplies_ConditionIsFormLeader"] call cba_settings_fnc_get;
if (_forceLeaderSetting) then {_condition = {isFormationLeader player};};
_isCustomSettingSet = ["MRH_MilsimTools_FireSupport_Supplies_isCustomConditionSet"] call cba_settings_fnc_get;
if (_isCustomSettingSet) then
	{
		_customSetString = ["MRH_MilsimTools_FireSupport_Supplies_CustomCondition"] call cba_settings_fnc_get;
		//_finalString = _customSetString + "&& (call MRH_fnc_MilsimTools_Heli_isHeliTaxiAvailable)";
		
		_condition = compile _customSetString;
		Diag_Log format ["MRH_MilsimTools_FireSupport_Supplies - User set condition: %1" ,str _condition];
	};


_action = ["MRH_FireSupport_SupplyDrop_Call",localize "STR_MRH_FireSupport_SC_AskSupplyAceAction",PAAPATH(paradrop.paa),{call MRH_fnc_MilsimTools_FireSupport_openSuppliesInterface;},_condition] call ace_interact_menu_fnc_createAction;
["CAManBase",1,['ACE_SelfActions','MRH_FireSupport_Actions'],_action,true] call ace_interact_menu_fnc_addActionToClass;
};