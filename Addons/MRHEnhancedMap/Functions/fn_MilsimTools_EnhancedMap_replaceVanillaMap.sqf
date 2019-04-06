/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_EnhancedMap_;
*/
#include "MRH_C_Path.hpp"
//toDo make this optionable
_CAman = _this select 0;

if (is3DEN) ExitWith {};

_code = {
params ["_CAman"];

_replaceVanillaMap = ["MRH_MilsimTools_Map_ReplaceVanillaMap"] call cba_settings_fnc_get;
if (_replaceVanillaMap) then {
		if ("ItemMap" in assigneditems _CAman) then
		{
			_CAman unlinkItem "ItemMap";
			if !("MRH_Map" in items _CAman) then {_CAman addItem "MRH_Map";};
		};
	};
	

	
};

[{time>1},_code,[_CAman]] call CBA_fnc_waitUntilAndExecute;