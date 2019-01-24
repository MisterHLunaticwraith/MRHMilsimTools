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

_display = ctrlParent (_this select 0);
_rawData = [];
_pathCount = count tvcursel 9902;
_title = "";
_text = "";
_subData =[];

if (_pathCount == 1) then 
{
_rawData = [tvdata [9902,tvCurSel 9902]] EFUNC(SoldierTab,findAndReadDataEntry);
_rawData params ["_dataName","_treeBranchTitle","_treeBranchTitleText","_subSections"];
_title = _treeBranchTitle;
_text = _treeBranchTitleText;
};
if (_pathCount == 2) then 
{

_subSectionData = call compile (tvdata [9902,tvCurSel 9902]); 
_title = _subSectionData select 0;
_text = _subSectionData select 1;
};

_textFinal = "<t size = '2'><t color='#ffa42d'>" + _title + "</t></t>" + "<br/><br/>" + _text;
(_display displayCtrl 9903) ctrlSetStructuredText parsetext _textFinal;
[ctrlIDD _display,9903] CFUNC(SetCtrlSize);