/*
Function name: MRH_fnc_MilsimTools_SoldierTab_OpenTablet
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_OpenTablet;
*/
#include "MRH_C_Path.hpp"


createdialog "MRHSoldierTablet";

disableSerialization;

_ctrlIcons = FDIS(1500);
_index = _ctrlIcons lbAdd ""; 
lbSetPicture [1500,_index,PAAPATH(iconhome.paa)];
lbSetData [1500,_index,"HomeButton"];

_indexGrp = _ctrlIcons lbAdd ""; 
lbSetPicture [1500,_indexGrp,PAAPATH(icongroup.paa)];
lbSetData [1500,_indexGrp,"GrpButton"];

_showMap = ["MRH_MilsimTools_AllowMapTablet"] call cba_settings_fnc_get;
if ([MRH_player]CFUNC(isConnectedToAntenna)) then {_showMap =true};
if (_showMap) then {
	_indexMap = _ctrlIcons lbAdd ""; 
	lbSetPicture [1500,_indexMap,PAAPATH(iconmap.paa)];
	lbSetData [1500,_indexMap,"MapButton"];
};
_indexPics = _ctrlIcons lbAdd ""; 
lbSetPicture [1500,_indexPics,PAAPATH(iconpics.paa)];
lbSetData [1500,_indexPics,"PicsButton"];

_indexAlarm = _ctrlIcons lbAdd ""; 
lbSetPicture [1500,_indexAlarm,PAAPATH(iconalarm.paa)];
lbSetData [1500,_indexAlarm,"AlarmButton"];

_indexFiles = _ctrlIcons lbAdd ""; 
lbSetPicture [1500,_indexFiles,PAAPATH(iconfiles.paa)];
lbSetData [1500,_indexFiles,"FilesButton"];



//spawn hour script
[] spawn 
{
_timeCtrl = FDIS(1201);
MRH_2digits_number_fnc =
	{
		_data = _this call BIS_fnc_numberDigits;
		_return = "";
		 if (count _data ==1) then {_return = "0" + str _this} else {_return = str _this};
		 _return
	};
#define DIGITS(ARG) ARG call MRH_2digits_number_fnc


while {ctrlShown _timeCtrl} do 
	{
	_now = date;   // _now = [2014,10,30,2,30] (Oct. 30th, 2:30am)
	_month = _now select 1;
	_year = _now select 0;
	_day = _now select 2;
	_hour = _now select 3;
	_min  = _now select 4;
	_strH = DIGITS(_hour);
	_strM = DIGITS(_min);
	_text = "<t color = '#0d7ea6'>"+"          "+ _strH + ":"+ _strM + "</t>";
	_timeCtrl ctrlSetStructuredText parseText _text;
	sleep 1;
	};
};