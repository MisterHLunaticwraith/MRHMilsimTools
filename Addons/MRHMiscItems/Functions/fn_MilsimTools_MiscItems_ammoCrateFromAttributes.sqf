/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
if (is3DEN) exitWith {};
_statement = {
params ["_crate"];
	
	_itemCount = _crate getVariable ["mrh_numberOfammo","10"];
	_itemCount = parseNumber _itemCount;
	_refill = _crate getVariable ["mrh_ammoContentIsInfinite",false];
	_canBeRefreshed = _crate getVariable ["mrh_ammoCrateCanBeRefreshed",false];
	_message = format ["MRH Ammocrate from 3den attributes crate: %1,count: %2, autorefill: %3,canBeReFreshed %4",_crate,_itemCount,_refill,_canBeReFreshed];
	TRACE(_message);
	[_crate,_itemCount,_refill,_canBeRefreshed] call MRH_fnc_AmmoCrate;
};
[
    {time>0}, 
    _statement, 
    _this
] call CBA_fnc_waitUntilAndExecute;