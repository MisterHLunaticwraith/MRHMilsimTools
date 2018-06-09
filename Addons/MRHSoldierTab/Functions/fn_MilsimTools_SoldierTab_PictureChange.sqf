/*
Function name: MRH_fnc_MilsimTools_SoldierTab_PictureChange
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_PictureChange;
*/
#include "MRH_C_Path.hpp"
_pic = lbdata [1206,(lbCursel 1206)]; 
_ctrl = FDIS(1207); 
_ctrl ctrlSetText _pic;
_whereto = player getVariable ["MRH_SoldierTab_ownedPics",[]];


_caption = lbText [1206,(lbCursel 1206)];

_captionTextZone = FDIS(12071);
_captionTextZone ctrlSetStructuredText parseText _caption;
