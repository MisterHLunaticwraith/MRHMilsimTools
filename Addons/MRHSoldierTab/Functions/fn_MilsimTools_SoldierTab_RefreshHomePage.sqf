/*
Function name: MRH_fnc_MilsimTools_SoldierTab_RefreshHomePage
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_RefreshHomePage;
*/
#include "MRH_C_Path.hpp"
FUNC(AllCtrlsHide);
_pageSpecificCtrls = [1202,1203,1204,9903,9904];
{
ctrlShow [_x,true];
}ForEach _pageSpecificCtrls;

// webcam
_sstime = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _sstime select 0;
_sunset = _sstime select 1;
_missiontime = daytime;
_pip = "";

//nuit
if ((_missiontime < _sunrise) or (_missiontime > _sunset))
then { _pip = 1}
else
{_pip = 0};

_camMRHRoster = "camera" camCreate (MRH_player modelToWorld [0,0.7,1.7]);
_camMRHRoster attachTo [MRH_player, [0,3,3]];
_camMRHRoster camSetTarget MRH_player;
_camMRHRoster cameraEffect ["internal", "BACK"];
_camMRHRoster camCommit 0;
_camMRHRoster cameraEffect ["internal","back","rttmrhtest"]; 
"rttmrhtest" setPiPEffect [_pip]; 
FDIS(1202) ctrlSetText "#(argb,512,512,1)r2t(rttmrhtest,1.0)";

//fillplayerintel
_playerIntel = player getVariable "MRH_MilsimTools_Core_PlayerIntel";
if !(isPlayer MRH_player)then {_playerIntel = [groupId (group MRH_player),(getText (configFile>>"cfgVehicles">>(typeOf MRH_player)>>"displayName")),"N/A"]};//if remote ctrld unit
_rankIntel = [MRH_player] call MRH_fnc_MilsimTools_Core_LocRankIntel;

_playerGRP = _playerIntel select 0;
_playerRole = _playerIntel select 1;
_playerRF = _playerIntel select 2;
_rankLoc = _rankIntel select 0;
_rankPaa = _rankIntel select 1;
_roleText = (localize "STR_MRH_ST_FC_YourRole") + " " +"<t color='#ffa42d'>" + _playerRole + "</t>";
_rankText = (localize "STR_MRH_ST_FC_YourRank") + " " + "<t color='#ffa42d'>" +_rankLoc + "</t>" + "<img image='"+ _RankPaa +"' />";
_grpText = (localize "STR_MRH_ST_FC_YourGrp") + " " + "<t color='#ffa42d'>" +_playerGRP + "</t>";
_radioFrText = (localize "STR_MRH_ST_FC_YourRF") + " " + "<t color='#ffa42d'>" +_playerRF+ "</t>";
_playerText =(localize "STR_MRH_ST_FC_WelcomeMess")+" "+ name MRH_player+ "<br/><br/>" + _roleText +"<br/>" + _rankText +"<br/>" + _grpText +"<br/>" + _radioFrText;
FDIS(1203) ctrlSetStructuredText parseText _playerText;
CTRLRSZ(1203);
//set grp text
_strucuredRosterText= [[group MRH_player],true] CFUNC(GenerateRosterText);
_introText = "<t size = '1'><t color='#ffa42d'>" + "YOUR TEAM:" + "</t></t><br/><br/>";
_strucuredRosterText = _introText + _strucuredRosterText;
FDIS(1204) ctrlSetStructuredText parseText _strucuredRosterText;
CTRLRSZ(1204);