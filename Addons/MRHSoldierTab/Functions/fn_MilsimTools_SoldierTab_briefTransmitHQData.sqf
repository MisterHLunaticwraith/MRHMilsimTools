/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_;
*/
#include "MRH_C_Path.hpp"
params ["_briefingObject","_sendingPlayer"];
private _HQRef = [_sendingPlayer]FUNC(getSideHQ);
_HQRef params ["_HQName","_unusued","_HQObject"];
private _allData = _HQObject getVariable ["MRH_SoldierTab_ownedData",[]];
private _allPics = _HQObject getVariable ["MRH_SoldierTab_ownedPics",[]];

{
	if ((_x distance _briefingObject)<20) then 
		{
			[_x,_allData,_HQObject]FUNC(attributeData); 
			[_x,_allPics,_HQObject]FUNC(attributePictures); 
			};
}forEach allPlayers;
