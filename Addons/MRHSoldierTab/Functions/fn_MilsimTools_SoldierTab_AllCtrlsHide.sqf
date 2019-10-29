/*
Function name: MRH_fnc_MilsimTools_SoldierTab_AllCtrlsHide
Author: Mr H.
Description: Hides all tab specific controls
Return value: None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_AllCtrlsHide;
*/
#include "MRH_C_Path.hpp"
_allSpecificCtrls = [1202,1203,1204,1205,1206,1207,1208,1209,9903,9904,1210,9910,9909,12071,7701,7702,7703,7704,7705,7706,7707,7708,7709,7710,7711,7712,7713,7714,7715,7716,7717,7718,7719,7720,7721,7722,7723,8200,8201,8202,8203,8204,8205,1211,1212];
{
ctrlShow [_x,false];
} forEach _allSpecificCtrls;