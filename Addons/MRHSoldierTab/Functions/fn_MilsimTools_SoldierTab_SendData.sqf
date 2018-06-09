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
if (_receiver == "") ExitWith {hint "no player selected"};
_pics = player getVariable ["MRH_SoldierTab_ownedPics",[]];
_data = player getVariable ["MRH_SoldierTab_ownedData",[]];
if ((_pics isEqualTo []) &&(_data isEqualTo [])) ExitWith {hint "No data or pictures to share"};
_ctrls = [8203,8204];
ctrlShow [8205,false];
{
	ctrlshow [_x,true];
} forEach _ctrls;
_progressBar = FDIS(8203);
_transferText = FDIS(8204);
_transferText ctrlSetStructuredText parsetext "Transfering data";
for "_i" from 1 to 100 do 
{
_progressBar progressSetPosition (_i/100);
sleep 0.1;
};
_transferText ctrlSetStructuredText parsetext "Data sent";

_receivingPlayer = [_receiver] CFUNC(findPlayerByUID);
if !(_pics isEqualTo []) then {[_receivingPlayer,_pics] FUNC(attributePictures);};
if !(_data isEqualTo []) then {[_receivingPlayer,_data] FUNC(attributeData);};
playsound "MRH_TAB_doublebip";
sleep 2;
{
	ctrlshow [_x,false];
} forEach _ctrls;
};