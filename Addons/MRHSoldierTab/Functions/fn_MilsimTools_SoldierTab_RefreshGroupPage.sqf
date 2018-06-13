/*
Function name: MRH_fnc_MilsimTools_SoldierTab_RefreshGroupPage
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_RefreshGroupPage;
*/
#include "MRH_C_Path.hpp"
FUNC(AllCtrlsHide);
_pageSpecificCtrls = [9910,1210];
{
ctrlShow [_x,true];
}ForEach _pageSpecificCtrls;
_parameters = CFUNC(ApplyRosterTextSettings);
_rosterText =  _parameters CFUNC(GenerateRosterText);
_ctrlRst = FDIS(1210);
_introText = "<t size = '2'><t color='#ffa42d'>" + (localize "STR_MRH_ST_FC_TeamRoster") + "</t></t>";
_rosterText = _introText + "<br/><br/>" + _rosterText;
_ctrlRst ctrlSetStructuredText parseText _rosterText;
CTRLRSZ(1210);
