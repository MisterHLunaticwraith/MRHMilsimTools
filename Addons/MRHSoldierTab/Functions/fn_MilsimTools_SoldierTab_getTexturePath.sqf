/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_getTexturePath;
*/
#include "MRH_C_Path.hpp"
params ["_object"];
private _path = 0;
private _0is1 =["Land_Laptop_03_base_F"];
{
	if (_object isKindOf _x) exitWith {_path =1};
}forEach _0is1;
_path