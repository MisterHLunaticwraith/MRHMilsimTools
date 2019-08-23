/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_prepareCargoForLoading
Author: Mr H.
Description: Opens cargo prepping interface and handles what's shown
Return value: None
Public:No
Parameters: 
0-<OBJECT> target object passed from ace action
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_prepareCargoForLoading;
*/
#include "MRH_C_Path.hpp"
params ["_object"];

MRH_player SVAR(currentAdressedLoadingObj,_object,false);
_handle = createDialog "MRHCargoPrepareInterface";
_ctrlPic = FDIS2(1200);
_ctrlEdit = FDIS2(1400);
_ctrlInfoText = FDIS2(1100);
_ctrlActionButton = FDIS2(1600);
_pic = getText (configfile>>"cfgVehicles">>(typeOf _object)>>"editorpreview");
_ctrlPic ctrlSetText _pic;
//---
_ctrlActionButton buttonSetAction "_prettyname = ctrlText 1400; MRH_player setVariable ['MRH_InsertionHandler_setPrettyName',_prettyname];call MRH_fnc_MilsimTools_InsertionHandler_prepObject;";
//-----
_isAlreadyCargo = _object getVariable ["MRH_InsertionHandler_isAirDropSupply_"+ (str side MRH_player),false];
if (_isAlreadyCargo) then 
{
	_nameDefined = _object GVAR(supplyDropName);
	_ctrlEdit ctrlSetText _nameDefined;
	_ctrlInfoText ctrlSetStructuredText parsetext (localize "STR_MRH_MRHInsertionHandler_objectAlreadyPreparedQuestion");
	_ctrlActionButton ctrlSetText (localize "STR_MRH_MRHInsertionHandler_RemoveButtTextChg");
	_ctrlActionButton ctrlSetTextColor [1,0,0,1];
	_ctrlActionButton buttonSetAction "call MRH_fnc_MilsimTools_InsertionHandler_unprepObject;";
};