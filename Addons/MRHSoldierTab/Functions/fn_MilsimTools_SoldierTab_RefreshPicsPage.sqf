/*
Function name: MRH_fnc_MilsimTools_SoldierTab_RefreshPicsPage
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_RefreshPicsPage;
*/
#include "MRH_C_Path.hpp"
FUNC(AllCtrlsHide);
_pageSpecificCtrls = [1206,1207,12071,8200,8201];
{
ctrlShow [_x,true];
}ForEach _pageSpecificCtrls;
_playerPics = MRH_player getVariable ["MRH_SoldierTab_ownedPics",[]];
_missionPics = missionNamespace getVariable ["MRH_SoldierTab_missionPics",[]];
_picsListBox = FDIS(1206);
_picsToDisplay = [];
{
if (_x select 0 in _playerPics) then {_picsToDisplay pushBackUnique _x};
}forEach _missionPics;

lbClear 1206;

if (_picsToDisplay isEqualTo []) ExitWith
{
_index = _picsListBox lbAdd (localize "STR_MRH_ST_FC_NoDataStored");
_picsListBox lbSetData [_index,""];
_picsListBox lbSetSelected [_index, true]; 
FDIS(1207) ctrlSetText PAAPATH(nodata.paa);
};


{
_caption = _x select 1;
_picture = _x select 2;
_data = _x select 0;
_index = _picsListBox lbAdd _caption;
_picsListBox lbSetPicture [_index,_picture];
_picsListBox lbSetData [_index,_data];
_picsListBox lbsetTooltip [_index,_caption];
}forEach _picsToDisplay;
_picsListBox lbSetSelected [0, true];