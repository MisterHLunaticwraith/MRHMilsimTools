#include "MRH_Components.hpp"
["MRHAdminMenu", "MRHAdmin",["Ouvrir le menu admin.", "Ce menu n'est accessible qu'aux admins."],{call MRH_fnc_CustomAdminMenu},{},[DIK_NUMPADMINUS, [true, true, false]]] call CBA_fnc_addKeybind;
_playersteam = profileNameSteam;
player SVAR(SteamProfile,_playersteam,true);
