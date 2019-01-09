/*
Function name:MRH_fnc_MilsimTools_FireSupport_createAmmoBox
Author: Mr H.
Description: Creates an ammobox, fills it with magazines fitting the weapons currently equipped by all players of the given side
Return value:
<OBJECT> created box
Public: No, but the public version calls this function
Parameters:
PLEASE NOTE: if calling on the server on a dedicated machine parameters 0,1 and 2 must be filled since the default values based on player object are not known by the server.
0 - <NUMBER> -optional, default 10: quantity added per magazine type
1- <SIDE> - optional default: side of the player on whose machine the function is called. Can be West / Blufor (Arma 3), East / Opfor (Arma 3), Resistance / Independent (Arma 3), Civilian, sideLogic, Friendly, Enemy or Unknown.
2 - <ARRAY> -optionnal, default: position of the player on whose machine the function is called. - position AGL
3 -<STRING> -optional, classname of a container object, default "B_supplyCrate_F". Object will be emptied of its default config contents first. Can be a vehicle

Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_createAmmoBox;
see public version for more examples

*/
#include "MRH_C_Path.hpp"
params [["_Ammount",10],["_side",West],["_position",position player],["_type","B_supplyCrate_F"]];
_PlayableUnits = [player];
if (isMultiplayer) then {_PlayableUnits = [allplayers,_side]call MRH_fnc_MilsimTools_Core_SortUnitsBySide;};
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