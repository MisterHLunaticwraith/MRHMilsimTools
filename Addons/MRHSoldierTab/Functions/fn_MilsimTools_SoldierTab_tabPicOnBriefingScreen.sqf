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
params ["_picEntry","_caption","_picpath"];
private _remote = MRH_player getVariable ["MRH_isConnectedToRemoteCtrl",objNull];
if (isNull _remote) exitWith {};
if !((_remote getVariable ["MRH_BriefingApp_isCtrldBy",objNull]) isEqualTo MRH_player) exitWith {};
private _screens =_remote getVariable ["MRH_BriefingApp_ControlledScreens",[]];
FUNC(killVideoFeeds);
{
	_x setObjectTextureGlobal [(_x FUNC(getTexturePath)),_picPath];
} forEach _screens;