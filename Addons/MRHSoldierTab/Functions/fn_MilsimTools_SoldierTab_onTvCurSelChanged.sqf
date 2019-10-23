/*
Function name: MRH_fnc_MilsimTools_SoldierTab_onTvCurSelChanged
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_onTvCurSelChanged;
*/
#include "MRH_C_Path.hpp"
_rawData = [];
_pathCount = count tvcursel 1208;
_title = "";
_text = "";
_subData =[];

if (_pathCount == 1) then 
{
_rawData = [tvdata [1208,tvCurSel 1208]] FUNC(findAndReadDataEntry);
_rawData params ["_dataName","_treeBranchTitle","_treeBranchTitleText","_subSections"];
_title = _treeBranchTitle;
_text = _treeBranchTitleText;
};
if (_pathCount == 2) then 
{

_subSectionData = call compile (tvdata [1208,tvCurSel 1208]); 
_title = _subSectionData select 0;
_text = _subSectionData select 1;
_rawData = [(tvdata [1208,[((tvCurSel 1208)select 0)]])] FUNC(findAndReadDataEntry);
};

_textFinal = "<t size = '2'><t color='#ffa42d'>" + _title + "</t></t>" + "<br/><br/>" + _text;
FDIS(1209) ctrlSetStructuredText parsetext _textFinal;
CTRLRSZ(1209);
["MRH_ST_dataViewedChanged",_rawData] call CBA_fnc_localEvent;
/*
//oold version just in case
_rawData = [tvdata [1208,tvCurSel 1208], []] call BIS_fnc_configPath;
_pathCount = count tvcursel 1208;
_cfgPath = "";
_cfgtitle = "";
_cfgText= "";
if (_pathCount == 1) then 
{
_cfgPath = missionconfigfile >>"MRH_SoldierTabData">>(_rawData select 2);
_cfgtitle = "title";
_cfgText = "text";
};
if (_pathCount == 2) then 
{
_cfgPath = missionconfigfile >>"MRH_SoldierTabData">>(_rawData select 2)>>(_rawData select 3);
_cfgtitle = "titleSub";
_cfgText = "textSub";
};
_title = gettext (_cfgPath>>_cfgtitle);
_text = gettext (_cfgPath>>_cfgText);
_textFinal = "<t size = '2'><t color='#ffa42d'>" + _title + "</t></t>" + "<br/><br/>" + _text;
FDIS(1209) ctrlSetStructuredText parsetext _textFinal;
// CTRLRSZ(1209);
*/