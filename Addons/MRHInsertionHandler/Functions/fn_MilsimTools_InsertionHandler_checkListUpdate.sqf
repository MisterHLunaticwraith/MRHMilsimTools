/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_checkListUpdate
Author: Mr H.
Description: Keeps the side check list up to date, generates text and text color
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_checkListUpdate;
*/
#include "MRH_C_Path.hpp"


_allClearParams = FUNC(checkForAllClear);
_go = _allClearParams select 0;
_posSet = _allClearParams select 1;


_cargoSpaceClear = _allClearParams select 2;
_passengersClear = _allClearParams select 3;
_okPic = PAAPATH(ok.paa);
_okPic = "<img image =" +str _okPic + "/>";
_notOkPic =PAAPATH(pasok.paa);
_notOkPic = "<img image =" + str _notOkPic + "/>";
_inside_fnc_decideColor =
{
	params ["_bool","_text"];
	
_false = "<t color = '#ff0707'>";
_true = "<t color= '#06d609'>";
_end = "</t>";
_textFinal = ([_false,_true] select _bool) + _text + _end;

_textFinal
};

_ctrl = FDIS(1104);
//--------check position is set
_posSetText = (localize "STR_MRH_MRHInsertionHandler_YouHaventSetDest") + _notOkPic +"<br/>";
if(_posSet) then {
_pos = getMarkerPos "MRH_LZ_Marker";
_realisticPos = [_pos] CFUNC(realisticGrid);
_posSetText = (localize "STR_MRH_MRHInsertionHandler_DestSetForGrid") +" " + _realisticPos +" " + _okPic + "<br/>";
};
_posSetText = [_posSet,_posSetText] call _inside_fnc_decideColor;
//-----------check cargo space is clear
_cargoSpaceText = (localize "STR_MRH_MRHInsertionHandler_ExcededCGSpace")+ _notOkPic +"<br/>";

if (_cargoSpaceClear) then { _cargoSpaceText = (localize "STR_MRH_MRHInsertionHandler_ThereIsEnoughCGSpace")+ _okPic + "<br/>";};
_cargoSpaceText = [_cargoSpaceClear,_cargoSpaceText] call _inside_fnc_decideColor;
//---- text for passengers
_passengersText = (localize "STR_MRH_MRHInsertionHandler_NoPassengersAdded") + _notOkPic +"<br/>";
if(_passengersClear) then {_passengersText = (localize "STR_MRH_MRHInsertionHandler_YouHaveAddedPass") + _okPic + "<br/>";};
_passengersText = [_passengersClear,_passengersText] call _inside_fnc_decideColor;
//----- ready to launch 
_goText = (localize "STR_MRH_MRHInsertionHandler_YouHaventRequiredParams")+ _notOkPic +"<br/>";
if (_go) then {_goText = (localize "STR_MRH_MRHInsertionHandler_allParamsAreOk") + _okPic + "<br/>"};
_goText = [_go,_goText] call _inside_fnc_decideColor;

_finaText = _posSetText + _cargoSpaceText + _passengersText + _gotext;
_ctrl ctrlSetStructuredText parseText _finaText;

_goButton = FDIS(1600);
_goButton ctrlSetTextColor ([[1,0,0,1],[0,1,0,1]] select _go);