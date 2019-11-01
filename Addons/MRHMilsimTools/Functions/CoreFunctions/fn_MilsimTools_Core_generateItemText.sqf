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

	//[player,headGear player] call MRH_fnc_MilsimTools_Core_generateItemText
	params ["_type",["_isBackPack",false],["_isMagazine",false],["_isLongWeapon",false]];
	private ["_width","_height","_heightNumber"];
	private _info = [_type,_isBackPack,_isMagazine,_isAttachment]FUNC(getCfgInfo);
	_info params ["_displayName","_picture","_desc"];
	if (_displayName isEqualTo "N/A") exitWith {(localize "STR_MRH_LO_Di_NoGear")};
	_heightNumber =["MRH_MilsimTools_LD_loadoutDisplaySize"] call cba_settings_fnc_get;
	_height = "'"+(str _heightNumber) +"'";
	_width = "'"+(str _heightNumber) +"'";
	if (_isLongWeapon) then {_width ="'"+(str (_heightNumber*2)) +"'";};
	private _result = _displayName + "<br/>" +  "<img image='" +_picture + "' width=" + _width +  "height=" + _height + "/><br/>" + _desc + "<br/>";
	//<img image='media\img\9.jpg' width='300' height='200'/>
	//<br/><br/>
	_result