/*
Function name: MRH_fnc_MilsimTools_SoldierTab_RefreshFilesPage
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_RefreshFilesPage;
*/
#include "MRH_C_Path.hpp"
FUNC(AllCtrlsHide);
_pageSpecificCtrls = [1208,1209,9909,8200,8201];
{
ctrlShow [_x,true];
}ForEach _pageSpecificCtrls;
_ctrlTree = FDIS(1208);
_ctrlText = FDIS(1209);
_allDataEntries = MRH_player getVariable ["MRH_SoldierTab_ownedData",[]];

tvClear 1208;
if (_allDataEntries isEqualTo []) ExitWith {_ctrlText ctrlSetStructuredText parseText (localize "STR_MRH_ST_FC_NoData")};
{
 _completeData = [_x] FUNC(findAndReadDataEntry);
_completeData params ["_dataName","_treeBranchTitle","_treeBranchTitleText","_subSections"];


_index = _ctrlTree tvAdd [[], _treeBranchTitle];
_dataPath = _dataName;
_ctrlTree tvSetData [ [_index], _dataPath];
_ctrlTree tvExpand [_index];
_ctrlTree tvSetPicture [[_index],PAAPATH(folder.paa)];
_ctrlTree tvSetPictureColor [[_index], [1,0,1,1]];


	{
	_x params ["_subBranchTitle","_subtext"];
	_dataSubPath = str _x;
	_subIndex = _ctrlTree tvAdd [[_index], _subBranchTitle];
	_ctrlTree tvSetData [ [_index,_subIndex], _dataSubPath];
	}forEach _subSections;

} forEach _allDataEntries;
_ctrlText ctrlSetStructuredText parsetext (localize "STR_MRH_ST_FC_PleaseSelectFile");

/*
//older version just in case
FUNC(AllCtrlsHide);
_pageSpecificCtrls = [1208,1209,9909,8200,8201];
{
ctrlShow [_x,true];
}ForEach _pageSpecificCtrls;
_ctrlTree = FDIS(1208);
_ctrlText = FDIS(1209);
_allDataEntries = player getVariable ["MRH_SoldierTab_ownedData",[]];

tvClear 1208;
if (_allDataEntries isEqualTo []) ExitWith {_ctrlText ctrlSetStructuredText parseText (localize "STR_MRH_ST_FC_NoData")};
{
_treeBranchTitle = gettext (missionConfigFile>>"MRH_SoldierTabData">>_x>>"title");

_index = _ctrlTree tvAdd [[], _treeBranchTitle];
_dataPath = str (missionConfigFile>>"MRH_SoldierTabData">>_x);
_ctrlTree tvSetData [ [_index], _dataPath];
_ctrlTree tvExpand [_index];
_ctrlTree tvSetPicture [[_index],PAAPATH(folder.paa)];
_ctrlTree tvSetPictureColor [[_index], [1,0,1,1]];
_subSections =  [(missionConfigFile >> "MRH_SoldierTabData">>_x)]call BIS_fnc_getCfgSubClasses;
_mainEntry = _x;
	{
	_subBranchTitle = gettext (missionConfigFile>>"MRH_SoldierTabData">>_mainEntry >> _x >> "titleSub");
	_dataSubPath = str (missionConfigFile>>"MRH_SoldierTabData">>_mainEntry >> _x);
	_subIndex = _ctrlTree tvAdd [[_index], _subBranchTitle];
	_ctrlTree tvSetData [ [_index,_subIndex], _dataSubPath];
	}forEach _subSections;

} forEach _allDataEntries;
_ctrlText ctrlSetStructuredText parsetext (localize "STR_MRH_ST_FC_PleaseSelectFile");
*/
