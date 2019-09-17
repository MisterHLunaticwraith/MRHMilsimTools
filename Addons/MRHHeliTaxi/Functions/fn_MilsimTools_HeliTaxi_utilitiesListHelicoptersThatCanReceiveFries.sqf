/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_utilitiesListHelicoptersThatCanReceiveFries;
*/
#include "MRH_C_Path.hpp"
_allHelis= "true" configClasses (configFile >> "CfgVehicles");
_allHeliNames = _allHelis apply {configName _x};

_allCan = [];
_allCANNOT = [];
{
	if (((getNumber (configFile >> "cfgVehicles">>_x>>"Scope"))>1) &&(_x isKindOf "Helicopter_Base_F") && !(_x isKindOf "UAV")&& 
	(gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory")!= "EdSubcat_Drones" )) then
	{
		private _name = getText (configFile >> "cfgVehicles">>_x>>"DisplayName");
		if ([_x]FUNC(canReceiveFries)) then {_allCan pushBackUnique [_name,_x]} else {_allCANNOT pushBackUnique [_name,_x]};
	};
}forEach _allHeliNames;
_textCan = "//---Helicopters that accept fries";
{
	_textCan = _textCan + ([endl,(_x select 0)," : ",(_x select 1)] joinString "");
} forEach _allCan;

_textCant = "//--- Helicopters that don't accept fries";

{
	_textCant = _textCant + ([endl,(_x select 0)," : ",(_x select 1)] joinString "");
} forEach _allCANNOT;
_textFinal = [_textCan,endl,endl, _textCant] joinString "";
copyToClipboard _textFinal;
hint "Results copied to clipboard";
