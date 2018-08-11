/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_createAmmoBox;

*/
#include "MRH_C_Path.hpp"
params [["_Ammount",10],["_side",West],["_position",position player],["_type","B_supplyCrate_F"]];
_PlayableUnits = [player];
if (isMultiplayer) then {_PlayableUnits = [playableUnits,_side]call MRH_fnc_MilsimTools_Core_SortUnitsBySide;};
///get all weapons in all weapons slots for all playable units
_allPlayerWeapons = [];
{
_mainWeapon = (getUnitloadout _x select 0) select 0;
_launcher = (getUnitloadout _x select 1) select 0;
_handGun = (getUnitloadout _x select 2) select 0;
if(!isNil "_mainWeapon") then {_allPlayerWeapons pushBackUnique _mainWeapon};
if(!isNil "_launcher") then {_allPlayerWeapons pushBackUnique _launcher};
if(!isNil "_handGun") then {_allPlayerWeapons pushBackUnique _handGun};
} forEach _PlayableUnits;



//get all fitting munitions for said weapons
_allMagazinesType = [];
{
private ["_uniquemags","_magazineTypeS"];

//_uniquemags = [];
_magazineTypeS = getarray (configfile >> "CfgWeapons" >> _x >>"magazines");

	{
	_uniquemags = _x;
	
	_allMagazinesType pushBackUnique _uniquemags; 
	} forEach _magazineTypeS;



} forEach _allPlayerWeapons;

//create box

_box = _type createVehicle _position;
//Fills box with given content
//clear box
clearItemCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackPackCargoGlobal _box;
//systemChat format ["Weps %1 Mags %2 Box %3", str _allPlayerWeapons, str _allMagazinesType, str _box];
{
_do= _box addMagazineCargoGlobal [_x, _Ammount];

} forEach _allMagazinesType;
_box