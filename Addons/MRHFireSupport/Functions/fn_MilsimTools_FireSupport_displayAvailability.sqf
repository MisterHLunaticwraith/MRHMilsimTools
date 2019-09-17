/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_displayAvailability;

*/
#include "MRH_C_Path.hpp"

_availSupports =[
	["\MRHMarkers\paa\paradrop.paa","MRH_MilsimTools_SupplyDrop_DelayBetween","MRH_MilsimTools_FireSupport_Supplies_useSupplyDrops","MRH_FireSupport_SDisInActionFor_"],
	["\MRHMarkers\paa\medical.paa","MRH_MilsimTools_MEDEVAC_DelayBetween","MRH_MilsimTools_MEDEVAC_UseMedEVACInMission","MRH_HeliTaxi_medEvac_calledForSide_"],
	["\MRHMarkers\paa\mortar.paa","MRH_MilsimTools_Arty_DelayBetween","MRH_MilsimTools_FireSupport_useFireSupport","MRH_FireSupport_ARTYisInActionFor_"],
	["\MRHMarkers\paa\fighterjet.paa","MRH_MilsimTools_CAS_DelayBetween","MRH_MilsimTools_FireSupport_useCASSupport","MRH_FireSupport_CASisInActionFor_"]

	];
_toCreateCtrls = [];
{
	if ([(_x select 2)]call cba_settings_fnc_get) then {_toCreateCtrls pushBackUnique _x};
}forEach _availSupports;

if (_toCreateCtrls isEqualTo []) exitWith {};

070919 cutRsc ["MRHEmptyDisplay", "PLAIN"];
disableSerialization;
_display = uiNamespace getVariable "MRHEmptyDisplay";

_ypos = 1/0.05;
_colorRGB = [[1,0,0,1],[0,1,0,1]];
_colorHex = [];
{
	_x params ["_picPath","_settingName","_unusedUseS","_inActionVar"];
	private _avail = (([side MRH_player,_settingName]call MRH_fnc_MilsimTools_HeliTaxi_returnRemainingWaitTime) select 0); //CHANGETHIS
	private _inAction = missionNameSpace getVariable [_inActionVar + (str (side MRH_player)),false];
	if (_inAction) then {_avail = false};
	private _ctrlPic = _display ctrlCreate ["RscPicture", -1]; 
	_ctrlPic ctrlSetPosition [0 * safezoneW + safezoneX,((0.07*_forEachIndex)+0.1) * safezoneH + safezoneY,0.02 * safezoneW,0.03 * safezoneH]; 
	_ctrlPic ctrlSetText _picPath; 
	_ctrlPic ctrlSetTextColor (_colorRGB select _avail);
	_ctrlPic ctrlCommit 0; 

	private _ctrlText = _display ctrlCreate ["RscStructuredText", -1]; 
	_ctrlText ctrlSetPosition [0.03 * safezoneW + safezoneX,((0.07*_forEachIndex)+0.1) * safezoneH + safezoneY,0.5 * safezoneW,0.03 * safezoneH];
	private _textToShow = ("<t font='Unifont' valign='bottom' size = '1'>" + (format ["%1",[([side MRH_player,_settingName]call MRH_fnc_MilsimTools_HeliTaxi_returnRemainingWaitTime) select 2,(localize "STR_MRH_FireSupport_supportIsAvailable")]select _avail]) + "</t>");
	if (_inAction) then {_textToShow = (localize "STR_MRH_FireSupport_supportIsInAction")};
	_ctrlText ctrlSetStructuredText parseText  _textToShow;
	_ctrlText ctrlSetTextColor (_colorRGB select _avail);
	_ctrlText ctrlCommit 0; 

}forEach _toCreateCtrls