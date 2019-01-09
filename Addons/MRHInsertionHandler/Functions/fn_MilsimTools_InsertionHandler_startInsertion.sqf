/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_startInsertion
Author: Mr H.
Description: checks that all parameters are okay and starts the insertion function, clears varibles set on the player afterwards
Return value:None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_startInsertion;
*/
#include "MRH_C_Path.hpp"
_canGo = (FUNC(checkForAllClear)) select 0;
if !(_canGo) ExitWith {};

_unitsToDrop = player GVARDef(playersToGo,[]);


_typeOfPlane = lbData [2100,(lbCurSel 2100)];
_startPos = getMarkerPos (str player);
_dropPos = getMarkerPos "MRH_LZ_Marker";
{
	[[_x,_dropPos],
	{
		params ["_unit","_pos"]; 
		moveOut _unit;
			deleteMarkerLocal "MRH_Insertion_LZ_Marker";
			_marker = createMarkerLocal ["MRH_Insertion_LZ_Marker", _pos];
			_marker setMarkerTypeLocal "MRH_paradrop";
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerAlphaLocal 1;
	}] RemoteExec ["Spawn",_x];
} forEach _unitsToDrop;

_height =parseNumber (ctrlText (FDIS(1000)));
if (_height<200) then {_height =200};
_extraGear = (FUNC(sortGear)) select 0;


_parameters=[_unitsToDrop,_typeOfPlane,_startPos,_dropPos,_height,side player,true,_extraGear];


_parameters call MRH_fnc_completeAirInsertion;
closeDialog 0;
player SVAR(playersToGo,nil,false);
{
	_x SVAR(isLoaded,false,true);
	[_x,side player,false]FUNC(isAirDropSupply);

} forEach _extraGear;
