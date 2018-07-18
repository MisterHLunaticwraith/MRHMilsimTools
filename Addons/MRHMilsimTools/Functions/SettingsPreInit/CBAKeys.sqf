#include "\a3\editor_f\Data\Scripts\dikCodes.h"
["MRH_Admin_Menu_openKey", "MRH_MilsimTools - Admin menu",[localize "STR_MRH_KEY_OPENADMINMENUPRETTY", localize "STR_MRH_KEY_OPENADMINMENUTOOLTIP"],{call MRH_fnc_MilsimTools_Admin_OpenMenu;},{},[DIK_NUMPADMINUS, [true, true, false]]] call CBA_fnc_addKeybind;

["MRH_MilSimTools_ToggleZeusAcre", "MRH_MilsimTools - Zeus",[localize "STR_MRH_KEY_ToggleInvisibleZeus",localize "STR_MRH_KEY_ToggleInvisibleZeusToolTip"],
{
 if (!isNull curatorCamera) then {call MRH_fnc_MilsimTools_Core_toggleCuratorInv;};
},{},[DIK_RETURN, [false, false, false]]] call CBA_fnc_addKeybind;