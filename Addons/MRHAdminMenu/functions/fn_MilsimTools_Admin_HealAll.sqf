/*
Function name: MRH_fnc_MilsimTools_Admin_HealAll
Author: Mr H.
Description: Heals all players (ACE wounds)
Return value:  None
Public: No
Parameters:
Example(s):None
call MRH_fnc_MilsimTools_Admin_HealAll;
*/
#include "MRH_C_Path.hpp"
{[_x, _x] call ACE_medical_fnc_treatmentAdvanced_fullHeal;} forEach AllPlayers;
[[],{["MRH_BeenHealed",[localize "STR_MRH_ADM_NOT_HEALED"]] call BIS_fnc_showNotification;}] RemoteExec ["Spawn",[0,-2] select isDedicated,false];