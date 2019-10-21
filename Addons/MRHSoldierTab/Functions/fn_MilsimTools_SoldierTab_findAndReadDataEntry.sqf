/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
["dataEntry7"]call MRH_fnc_MilsimTools_SoldierTab_findAndReadDataEntry;
//returs [entryClass,entryTitle,entryBody,[subentries in format [subEntryTitle,subEntryBody]]]
*/
#include "MRH_C_Path.hpp"
params ["_dataEntry"];
_allData =  missionNamespace getVariable ["MRH_SoldierTab_missionDataSubs",[]];
if (_allData isEqualTo []) exitWith {Diag_Log "MRH_MilsimTools_SoldierTab: No data"};

//find corresponding entry;
_selectedData = [];
{
	if ((_x select 0) == _dataEntry) then {_selectedData = _x};
}forEach _allData;

if (_selectedData isEqualTo []) exitWith {Diag_Log "MRH_MilsimTools_SoldierTab: Data not found"};

_selectedData