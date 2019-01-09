/*
Function name: MRH_fnc_MilsimTools_Admin_OpenMenu
Author: Mr H.
Description: Opens the admin menu interface, calls mission page fill function
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_Admin_OpenMenu;
*/
#include "MRH_C_Path.hpp"

_canAccess = FUNC(canAccessAdminMenu);
if !(_canAccess) exitWith {};
/*
// doesn't work because ace disables player input
_isAceConscious = [player] call ace_common_fnc_isAwake;
if !(_isAceConscious) then {
	[player, false] call ace_medical_fnc_setUnconscious;
	[] spawn { waitUntil{dialog}; waitUntil {!dialog}; [player, true] call ace_medical_fnc_setUnconscious;};
};

*/
openMap false;
disableSerialization;
_handle = createDialog "MRHAdminMenu";
FUNC(FillMissionPage);

