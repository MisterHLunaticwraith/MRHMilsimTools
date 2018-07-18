_allowTaxi = ["MRH_MilsimTools_Heli_UseHeliTaxiInMission"] call cba_settings_fnc_get;
if !(_allowTaxi) ExitWith {Diag_Log "MRH_MilsimTools_HeliTaxi - Heli taxi disabled in this mission"};

_condition = {call MRH_fnc_MilsimTools_Heli_isHeliTaxiAvailable};
_forceLeaderSetting =  ["MRH_MilsimTools_Heli_ConditionIsFormLeader"] call cba_settings_fnc_get;
if (_forceLeaderSetting) then {_condition = {isFormationLeader player && (call MRH_fnc_MilsimTools_Heli_isHeliTaxiAvailable)};};
_isCustomSettingSet = ["MRH_MilsimTools_Heli_isCustomConditionSet"] call cba_settings_fnc_get;
if (_isCustomSettingSet) then
	{
		_customSetString = ["MRH_MilsimTools_Heli_CustomCondition"] call cba_settings_fnc_get;
		_finalString = _customSetString + "&& (call MRH_fnc_MilsimTools_Heli_isHeliTaxiAvailable)";
		
		_condition = compile _finalString;
		Diag_Log format ["MRH_MilsimTools_HeliTaxi - User set condition: %1" ,str _condition];
	};
//{isFormationLeader player && (call MRH_fnc_isHeliTaxiAvailable)}

_action = ["MRH_HeliTaxi_Call","Demander un transport aérien","",{call MRH_fnc_MilsimTools_Heli_helicopterChoice;},_condition] call ace_interact_menu_fnc_createAction;//,{},[],[],1,[],{}
/*
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 */
["CAManBase",1,['ACE_SelfActions'],_action,true] call ace_interact_menu_fnc_addActionToClass;

/*
 * Argument:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 * 4: Use Inheritance (Default: False) <BOOL><OPTIONAL>
 */
