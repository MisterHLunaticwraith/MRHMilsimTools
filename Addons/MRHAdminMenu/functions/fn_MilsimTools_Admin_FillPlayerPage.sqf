/*
Function name: MRH_fnc_MilsimTools_Admin_FillPlayerPage
Author: Mr H.
Description: fills the player page when the tab is clicked
Return value: none
Public: No
Parameters:none
Example(s):
call MRH_fnc_MilsimTools_Admin_FillPlayerPage;
*/
#include "MRH_C_Path.hpp"



disableSerialization;

_playerUid = lbdata [1500,(lbCurSel 1500)];
_player = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID; 

_ctrlToHide = [1100,2300,1101,1602,1603,1604,1605,2100,1102,1103,2800,1104,2801,2101,2301,1105];
_ctrlToShow = [1106,2302,1107,1607,1608,2102,1609,1610,1200,1611,1108];
{
ctrlShow [_x,false];
} forEach _ctrlToHide;

if (_playerUid == "") ExitWith {

((findDisplay 260518) displayctrl 1601) ctrlSetText (localize "STR_MRH_FILL_PL_PAGE_NO_PL_SEL");
};
{
ctrlShow [_x,true];
} forEach _ctrlToShow;


//FUNC(RefreshPlayersList);

_playerNameTextZone = FDIS(1106);
_playerNameText = (localize "STR_MRH_FILL_PL_PAGE_YOUHAVESELECTED") + " " + "<t color='#ffa42d'>" + name _player + "</t>";
_playerNameTextZone ctrlSetStructuredText parseText _playerNameText;

_playerIntelTextZone = FDIS(1107);
_playerIntel = _player getVariable "MRH_MilsimTools_Core_PlayerIntel";
_rankIntel = [_player] call MRH_fnc_MilsimTools_Core_LocRankIntel;

_playerGRP = _playerIntel select 0;
_playerRole = _playerIntel select 1;
_playerRF = _playerIntel select 2;
_rankLoc = _rankIntel select 0;
_rankPaa = _rankIntel select 1;

_playerIntelText =
(localize "STR_MRH_FILL_PL_PAGE_ROLE") + " " + "<t color='#ffa42d'>" +_playerRole+ "</t>" + "<br/>" +
(localize "STR_MRH_FILL_PL_PAGE_GRP") + " " + "<t color='#ffa42d'>" +_playerGRP+ "</t>" + "<br/>" +
(localize "STR_MRH_FILL_PL_PAGE_RANK") + " " +  "<t color='#ffa42d'>" +_rankLoc+ "</t>" + " " +"<img image='"+ _RankPaa +"' />" + "<br/>" +
(localize "STR_MRH_FILL_PL_PAGE_RADIOF") + " "+"<t color='#ffa42d'>"+ _playerRF+ "</t>" + "<br/>" +
"UID:" + " " + "<t color='#ffa42d'>" +_playerUid+ "</t>";
_playerIntelTextZone ctrlSetStructuredText parseText _playerIntelText;


[_player] FUNC(PlayerCam);
//
[_player] FUNC(HandleMiniMap);
//
FUNC(FillPunishmentsCombo);
