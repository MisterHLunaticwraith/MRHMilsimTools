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
disableSerialization;

_display =ctrlParent (_this select 0);

#define CTRLF(ARG) ((_display) displayCtrl ARG)

_picsListBox = CTRLF(9904);
_picPreview =CTRLF(9905);
_captionTextZone = CTRLF(9906);
_pic = lbPicture [9904,(lbCursel 9904)]; 
 
_picPreview ctrlSetText _pic;



_caption = lbText [9904,(lbCursel 9904)];


_captionTextZone ctrlSetStructuredText parseText _caption;