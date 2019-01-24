/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
*/
#include "MRH_C_Path.hpp"
//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
_text = ctrlText 1401;
 _text = _text + "<img size ='15' image =" +
 str ([(lbData [9904,(lbCursel 9904)])] FUNC(retrievePicConfigPath))
 +"/>";
 ctrlSetText [1401, _text]