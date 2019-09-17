/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_conditionsPhysicalHeli;
*/
#include "MRH_C_Path.hpp"


_heli = (group MRH_player)GVARDef(slavedHeli,objNull);

if (isNull _heli) exitWith {false};
if (!alive _heli) exitWith {false};
if ((MRH_player distance _heli)<200) exitWith {false};
_isBusy = _heli GVARDef(isBusy,false);
if(_isBusy) exitWith {false};

_condition = true;
_forceLeaderSetting =  ["MRH_MilsimTools_Heli_ConditionIsFormLeader"] call cba_settings_fnc_get;
if (_forceLeaderSetting) then {_condition =call {isFormationLeader MRH_player};};
_isCustomSettingSet = ["MRH_MilsimTools_Heli_isCustomConditionSet"] call cba_settings_fnc_get;
if (_isCustomSettingSet) then
	{
		_customSetString = ["MRH_MilsimTools_Heli_CustomCondition"] call cba_settings_fnc_get;
		_finalString = _customSetString;// + "&& (call MRH_fnc_MilsimTools_HeliTaxi_isHeliTaxiAvailable)";
		
		_condition =call compile _finalString;
		
	};
_allowTaxi = ["MRH_MilsimTools_Heli_UseHeliTaxiInMission"] call cba_settings_fnc_get;
if !(_allowTaxi) then {_condition = false;};

_condition