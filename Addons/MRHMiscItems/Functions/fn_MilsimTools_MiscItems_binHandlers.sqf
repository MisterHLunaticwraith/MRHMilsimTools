/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[cursortarget] call MRH_fnc_MilsimTools_MiscItems_binHandlers;
*/
#include "MRH_C_Path.hpp"
params ["_wheeliebin"];
if (is3DEN) exitWith {};
_wheeliebin addEventHandler ["ContainerOpened", {
	params ["_container", "_unit"];
	clearItemCargoGlobal _container;
	clearMagazineCargoGlobal _container;
	clearWeaponCargoGlobal _container;
	clearBackpackCargoGlobal _container;
}];

_wheeliebin addEventHandler ["ContainerClosed", {
	params ["_container", "_unit"];
	clearItemCargoGlobal _container;
	clearMagazineCargoGlobal _container;
	clearWeaponCargoGlobal _container;
	clearBackpackCargoGlobal _container;
}];
_toTrace = format  ["Clear cargo handlers added to %1",_wheeliebin];
TRACE(_toTrace)