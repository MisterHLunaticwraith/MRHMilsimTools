#include "\a3\editor_f\Data\Scripts\dikCodes.h"
["MRH_Admin_Menu_openKey", "MRH_MilsimTools - Admin menu",[localize "STR_MRH_KEY_OPENADMINMENUPRETTY", localize "STR_MRH_KEY_OPENADMINMENUTOOLTIP"],{call MRH_fnc_MilsimTools_Admin_OpenMenu;},{},[DIK_NUMPADMINUS, [true, true, false]]] call CBA_fnc_addKeybind;

["MRH_MilSimTools_ToggleZeusAcre", "MRH_MilsimTools - Zeus",[localize "STR_MRH_KEY_ToggleInvisibleZeus",localize "STR_MRH_KEY_ToggleInvisibleZeusToolTip"],
{
 if (!isNull curatorCamera) then {call MRH_fnc_MilsimTools_Core_toggleCuratorInv;};
},{},[DIK_RETURN, [false, false, false]]] call CBA_fnc_addKeybind;

["MRH_MilSimTools_HaloGear_openChuteKey", "MRH_MilsimTools - Parachute",[localize "STR_MRH_CBA_HaloGear_openChuteKey",localize "STR_MRH_CBA_HaloGear_openChuteKeyToolTip"],
{
 if (([player] call MRH_fnc_MilsimTools_HaloGear_isFreeFalling) && ([player] call MRH_fnc_MilsimTools_HaloGear_hasParachute)) then {player action ["OpenParachute", player];};
},{},[DIK_SPACE, [false, false, false]]] call CBA_fnc_addKeybind;

["MRH_DebugTools_showLog", "MRH_MilsimTools - Debug Tools",[localize "STR_MRH_DEBUG_TOOLS_KEY", localize "STR_MRH_KEY_OPENADMINMENUTOOLTIP"],
{
	_isDebugMode = ["MRH_MilsimTools_DebugTools_isDebugMode"] call cba_settings_fnc_get;
	if (_isDebugMode) then
	{ 
		call MRH_fnc_MilsimTools_DebugTools_openLogViewer;
	};
},{},[DIK_X, [true, true, false]]] call CBA_fnc_addKeybind;