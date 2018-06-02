/*
Function name: MRH_fnc_MilsimTools_Admin_SingleResetHasDied
Author: Mr H.
Description: resets has died variable for selected player
Return value: none
Public: no
Parameters:none
Example(s):
call MRH_fnc_MilsimTools_Admin_SingleResetHasDied;
*/
#include "MRH_C_Path.hpp"

_playerUid = lbdata [1500,(lbCurSel 1500)];
_player = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID; 
[_player] CFUNC(SetRevived);


FUNC(RefreshPlayersList);
systemchat format [localize "STR_MRH_SINGLERESETHASDIEDSYSTEMCHAT", str _player];