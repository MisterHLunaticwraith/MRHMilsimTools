/*
Function name:MRH_fnc_RefillBox
Author: Mr H.
Description: Refills given container object with the content it had at mission start every time it is opened, making it having infinite content.
Return value: None
Public:Yes
Parameters:
0- <OBJECT> - Container object
Example(s):
[this] call MRH_fnc_RefillBox;
*/

params ["_box"];

_ItemContent = getItemCargo _box;
_WeaponsContent = getWeaponCargo _box;
_MagazinesContent = getMagazineCargo _box;
_backbackContent = getBackPackCargo _box;
_allContent = [_ItemContent, _WeaponsContent, _MagazinesContent, _backbackContent];
if (isServer) then {_box setVariable ["MRH_ListBoxContents", _allcontent,true];};

_box addEventHandler ["ContainerOpened", { 
_box = _this select 0;
_allcontent = _box getVariable "MRH_ListBoxContents";
_ItemsArray = _allContent select 0;
_Items = _ItemsArray select 0;
_WeaponsArray = _allContent select 1;
_Weapons = _WeaponsArray select 0;
_MagazinesArray = _allContent select 2;
_Magazines = _MagazinesArray select 0;
_BackPacksArray =  _allContent select 3;
_BackPacks = _BackPacksArray select 0;



clearItemCargoGlobal _box;
{_box addItemCargoGlobal [_x,10];} forEach _Items;

clearWeaponCargoGlobal _box;
{_box addWeaponCargoGlobal [_x,10];} forEach _Weapons;


clearMagazineCargoGlobal _box;
{_box addMagazineCargoGlobal [_x,10];} forEach _Magazines;

clearBackPackCargoGlobal _box;
{_box addBackPackCargoGlobal [_x,10];} forEach _BackPacks;
}

];



