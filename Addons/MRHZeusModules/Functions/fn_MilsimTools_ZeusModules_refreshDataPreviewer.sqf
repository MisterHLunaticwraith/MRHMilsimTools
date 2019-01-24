/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_refreshDataPreviewer;
*/
#include "MRH_C_Path.hpp"

/*
controlpath definitions
*/


disableSerialization;
_display = ctrlParent ((_this select 0) select 0);

#define CTRLF(ARG) ((_display) displayCtrl ARG)
_ctrlTree = CTRLF(9902);
_ctrlText = CTRLF(9903);
_picsListBox = CTRLF(9904);
_picPreview =CTRLF(9905);
_refreshButton = CTRLF(9907);
/*
Data section
*/

_allDataEntries = missionNamespace getVariable ["MRH_SoldierTab_TEMPORARY_missionData",[]];
if (_allDataEntries isEqualTo []) then {
_allDataEntries = missionNamespace getVariable ["MRH_SoldierTab_missionData",[]];
};

tvClear 9902;
if (_allDataEntries isEqualTo []) then {_ctrlText ctrlSetStructuredText parseText (localize "STR_MRH_ST_FC_NoData")};
{
 _completeData = [_x] EFUNC(SoldierTab,findAndReadDataEntry);

_completeData params ["_dataName","_treeBranchTitle","_treeBranchTitleText",["_subSections",[]]];


_index = _ctrlTree tvAdd [[], _treeBranchTitle];
_dataPath = _dataName;
_ctrlTree tvSetData [ [_index], _dataPath];
_ctrlTree tvExpand [_index];



	{
	_x params ["_subBranchTitle","_subtext"];
	_dataSubPath = str _x;
	_subIndex = _ctrlTree tvAdd [[_index], _subBranchTitle];
	_ctrlTree tvSetData [ [_index,_subIndex], _dataSubPath];
	}forEach _subSections;

} forEach _allDataEntries;
_ctrlText ctrlSetStructuredText parsetext (localize "STR_MRH_ST_FC_PleaseSelectFile");
for "_i" from 0 to ((count _allDataEntries)-1) do
{
_ctrlTree tvCollapse [_i];
};
/*
pics section
*/

_missionPics = missionNamespace getVariable ["MRH_SoldierTab_missionPics",[]];



lbClear 9904;

if (_missionPics isEqualTo []) then
{
_index = _picsListBox lbAdd (localize "STR_MRH_ST_FC_NoDataStored");
_picsListBox lbSetData [_index,PAAPATH(nodata.paa)];
_picsListBox lbSetSelected [_index, true]; 
_picPreview ctrlSetText PAAPATH(nodata.paa);
};


{
_data = _x select 0;
_caption = _x select 1;
_picture = _x select 2;

_index = _picsListBox lbAdd _caption;
_picsListBox lbSetPicture [_index,_picture];
_picsListBox lbSetData [_index,_data];
_picsListBox lbsetTooltip [_index,_caption];
}forEach _missionPics;
_picsListBox lbSetCurSel 0;

_refreshButton buttonSetAction format ["[[(findDisplay %1 displayCtrl 9902)]] spawn MRH_fnc_MilsimTools_ZeusModules_refreshDataPreviewer", ctrlIDD _display]; // hack since button action doesn't return ctrl