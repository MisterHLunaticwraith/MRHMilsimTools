/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_insertMarkUp;
*/
#include "MRH_C_Path.hpp"
//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
params ["_type"];
_toInsert = "";
switch (true) do {
	case (_type == "RED") : {_toInsert = "<t color='#ff0000'>Red text</t>"};
	case (_type == "GREEN") : {_toInsert = "<t color='#48f442'>Green text</t>"};
	case (_type == "LINED") : {_toInsert = "<t underline='1'>Underlined&#160;Underlined Text</t>"};
	case (_type == "URL") : {_toInsert = "<t colorLink='#0000ff'><a href='http://www.arma3.com/'>Blue hyperlink</a></t>"};

};

_text = ctrlText 1401; 
_text = _text + _toInsert; 
ctrlSetText [1401, _text];