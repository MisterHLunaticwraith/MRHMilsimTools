/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
["picture1"]call MRH_fnc_MilsimTools_SoldierTab_findAndReadPictureInfo;
//returns [picEntry,caption,picpath]
*/
#include "MRH_C_Path.hpp"
params ["_picEntry"];
private _allPics =  missionNamespace getVariable ["MRH_SoldierTab_missionPics",[]];
if (_allPics isEqualTo []) exitWith {Diag_Log "MRH_MilsimTools_SoldierTab: No pictures"};

//find corresponding entry;
_selectedPic = [];
{
	if ((_x select 0) == _picEntry) then {_selectedPic = _x};
}forEach _allPics;

if (_selectedPic isEqualTo []) exitWith {Diag_Log "MRH_MilsimTools_SoldierTab: Picture not found"};

_selectedPic