/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
["DataEntry_7"]call MRH_fnc_hasDataOrPicture;
*/
#include "MRH_C_Path.hpp"
params ["_unit","_data"];
private _dataOwned = _unit getVariable ["MRH_SoldierTab_ownedData",[]];
private _picsOwned = _unit getVariable ["MRH_SoldierTab_ownedPics",[]];
if ((_data in _dataOwned)|| (_data in _picsOwned)) exitWith {true};
false