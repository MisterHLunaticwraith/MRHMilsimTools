/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: adds item to the receiver's inventory, if there's no room collectible object is added to the ground. An <OBJECT> whose classname corresponds to a cfgWeapons entry can be added (object will be deleted). If cfgWeapons and cfgVehicles classname are not identical a third parameter (cfgWeapons classname) must be provided. In effect it allows you to make a world object collectible and replaced in inventory by any object.
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_item",["_receiver",objNull],["_weaponsClassname",""]];
if (isNull _receiver) then {_receiver = player};
_itemClass = _item;
_isObject = false;
_pos = (getPosATL _receiver);
if (typeName _item == "OBJECT") then {_itemClass = typeOf _item;_isObject = true; _pos = (getPosATL _item)}; //this implies that cfgWeapons and cfgVehicles have same classnames

if (_weaponsClassname != "") then {_itemClass = _weaponsClassname};
if (_receiver canAdd _itemClass) then {
_receiver addItem _itemClass;
} else {
	_test = "GroundWeaponHolder" createVehicle _pos;
	_test addItemCargoGlobal [_itemClass,1];
	_test setPosATL _pos;
};
if (_isObject) then {deleteVehicle _item};