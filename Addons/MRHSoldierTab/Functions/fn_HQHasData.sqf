/*
Function name: MRH_fnc_HQHasData
Author: Mr H.
Description: returns wether the side's hq has received givent data or picture
Return value: <BOOL>
Public: Yes
Parameters: none
0-<SIDE> or <OBJECT> if object side of object will be used
1- <STRING> cfg entry of picture or data, /!\ case sensitive /!\
Example(s):
[player,"pic1"]call MRH_fnc_HQHAsData;
or
[west,"pic1"]call MRH_fnc_HQHAsData;
*/
#include "MRH_C_Path.hpp"

	params ["_player","_data"];
	private _hq = ([_player] call MRH_fnc_MilsimTools_SoldierTab_getSideHQ)#2;
	private _HQHASPIC = [_hq,_data]call MRH_fnc_hasDataOrPicture;
	_HQHASPIC