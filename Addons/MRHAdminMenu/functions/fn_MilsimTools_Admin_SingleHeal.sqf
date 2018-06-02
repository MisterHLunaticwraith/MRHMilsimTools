/*
Function name: MRH_fnc_MilsimTools_Admin_SingleHeal
Author: Mr H.
Description: Heals selected player, sends him a notification
Return value:  none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_Admin_SingleHeal;
*/
#include "MRH_C_Path.hpp"
_playerUid = lbdata [1500,(lbCurSel 1500)];
_player = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID; 
[_player, _player] call ACE_medical_fnc_treatmentAdvanced_fullHeal; 
systemchat format [localize "STR_MRH_ADMIN_SINGLEHEALSYSTEMCHAT",str _player];

[_playerUid,
{
	["MRH_BeenHealed",[localize "STR_MRH_ADM_NOT_HEALED"]] call BIS_fnc_showNotification;

},[]] call MRH_fnc_MilsimTools_Core_RemoteFor;