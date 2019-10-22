/*
Function name: MRH_fnc_MilsimTools_SoldierTab_SendData
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_SendData;
*/

[] spawn {
#include "MRH_C_Path.hpp"
_receiver = lbData [8202,(lbCurSel 8202)];
if (_receiver == "") ExitWith {hint (localize "STR_MRH_ST_FC_NoPlayerSelected")};
/*
_pics = player getVariable ["MRH_SoldierTab_ownedPics",[]];
_data = player getVariable ["MRH_SoldierTab_ownedData",[]];
*/
_pics = [];
_data = [];
private _display = (findDisplay 03062018);
private _picsCtrl = _display displayCtrl 1206;
private _dataCtrl = _display displayCtrl 1208;

if (ctrlShown _picsCtrl) then 
{

	if !((lbData [1206, lbCurSel 1206]) isEqualTo "") then 
	{
		_pics = 
			[
				(lbData [1206, lbCurSel 1206])
			];
	};
	
}; 
if (ctrlShown _dataCtrl && !((tvCursel 1208)isEqualTo [])) then
{
	if !((tvdata [1208,[((tvCurSel 1208)select 0)]]) isEqualTo "") then 
	{
		_data =
			[
				(tvdata [1208,[((tvCurSel 1208)select 0)]])
			];
	};
};




if ((_pics isEqualTo []) &&(_data isEqualTo [])) ExitWith {hint (localize "STR_MRH_ST_FC_NothingToShare")};
_ctrls = [8203,8204];
ctrlShow [8205,false];
{
	ctrlshow [_x,true];
} forEach _ctrls;
_progressBar = FDIS(8203);
_transferText = FDIS(8204);
_transferText ctrlSetStructuredText parsetext (localize "STR_MRH_ST_FC_TransferingData");
for "_i" from 1 to 100 do 
{
_progressBar progressSetPosition (_i/100);
sleep 0.1;
};
_transferText ctrlSetStructuredText parsetext "Data sent";

_receivingPlayer = [_receiver] CFUNC(findPlayerByUID);
if ((_receiver) isEqualTo "MRH_virtual_HQ") then {_receivingPlayer =(([MRH_player]FUNC(getSideHQ))select 2)};
if !(_pics isEqualTo []) then {[_receivingPlayer,_pics,MRH_player] FUNC(attributePictures);};
if !(_data isEqualTo []) then {[_receivingPlayer,_data,MRH_player] FUNC(attributeData);};
playsound "MRH_TAB_doublebip";
sleep 2;
{
	ctrlshow [_x,false];
} forEach _ctrls;
};