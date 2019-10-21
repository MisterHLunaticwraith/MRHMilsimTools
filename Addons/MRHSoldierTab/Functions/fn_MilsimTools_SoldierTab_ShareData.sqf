/*
Function name: MRH_fnc_MilsimTools_SoldierTab_ShareData
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_ShareData;
*/
#include "MRH_C_Path.hpp"
if (ctrlShown FDIS(8202)) ExitWith {ctrlShow [8202,false];ctrlShow [8205,false];};
ctrlShow [8202,true];

lbclear 8202;
_unitsToSort = allPlayers;
_unitsForPlayerside = [_unitsToSort,side MRH_player] CFUNC(SortUnitsBySide);
_cbList = FDIS(8202);

private _isConnectedToAntenna = [MRH_player]CFUNC(isConnectedToAntenna);


private _toList = [];
private _hq = [MRH_player] FUNC(getSideHQ);
if !(_isConnectedToAntenna) then {
{
	private _distance = MRH_player distance _x;
	if ((vehicle _x) isEqualTo (vehicle MRH_player)) then {_distance =0};//so that it always works in shared vehicle

		if ((_distance <= 10) && !(_x isEqualTo MRH_player)) then 
			{
				_toList pushBackUnique [name _x,getPlayerUID _x];
			};
	} forEach _unitsForPlayerside;
}
else
{
	{
		private _REMOTEXisConnectedToAntenna = [_x]CFUNC(isConnectedToAntenna);
		if (_REMOTEXisConnectedToAntenna && !(_x isEqualTo MRH_player)) then 
			{
				_toList pushBackUnique [name _x,getPlayerUID _x];
			};
	} forEach _unitsForPlayerside;
	if (_hq select 0 != "nohqWildCard")then {_toList pushBackUnique _hq};
};
if (_toList isEqualTo []) 
exitWith 
{
	_index = _cbList lbAdd (localize "STR_MRH_ST_noOneInRange");
	_cbList lbSetData [_index,""];
	_cbList lbSetCurSel 0;
	hint (localize "STR_MRH_ST_noOneInRangeHint");
};
{
	_index = _cbList lbAdd (_x select 0);
	_cbList lbSetData [_index,(_x select 1)];
}forEach _toList;
_cbList lbSetCurSel 0;