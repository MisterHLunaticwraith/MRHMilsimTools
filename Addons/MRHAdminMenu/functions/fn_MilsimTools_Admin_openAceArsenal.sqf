/*
Function name: MRH_fnc_MilsimTools_Admin_
Author: Mr H.
Description:
Return value: 
Public:
Parameters:
Example(s):
[] spawn MRH_fnc_MilsimTools_Admin_openAceArsenal;
*/
#include "MRH_C_Path.hpp"

//_player = player;
_playerUid = lbdata [1500,(lbCurSel 1500)];
closedialog 0;
_player = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID;
_insignia = [_player] call BIS_fnc_getUnitInsignia;
_loadOut = getUnitLoadOut _player;
//create a dummy copy of the selected player
//_dummy = group player createUnit ["C_man_p_beggar_F", player modelToWorld [0,0,1000], [], 0, "FORM"];
_dummy = "C_man_p_beggar_F" createVehicleLocal (player modelToWorld [0,0,1000]);
_dummy setPos (player modelToWorld [0,0,1000]);
_dummy enableSimulation false;
waitUntil {!isNull _dummy};
_dummyChangeSCript = [_player,_dummy,_insignia] spawn {
params ["_player","_dummy","_insignia"];
_face = Face _player;
_goggles = goggles _player;
_loadOut = getUnitLoadOut _player;
_toTrace = format ["MRH_MilsimTools_AdminMenu Saved remote loadout for player %1: %2",str _player, str _loadOut];
TRACE(_toTrace);
waitUntil {!(_loadOut isEqualTo [])};
_dummy setUnitLoadout _loadout;
_dummy setFace _face;
_dummy addGoggles _goggles;
[_dummy,_insignia] call BIS_fnc_setUnitInsignia;
};
waitUntil {scriptDone _dummyChangeSCript};
//create a light to illuminate the dummy at night
_light = "#lightpoint" createVehicle (_dummy modelToWorld [4,0,0]); 
_light setLightDayLight true;
_light setLightBrightness 1; 
//_light setLightIntensity 4;

_light setLightAmbient [1,1,1]; 
_light setLightColor [1,1,1]; 

[player, _dummy,true] call ACE_arsenal_fnc_openbox;

["ace_arsenal_displayClosed", {player setVariable ["MRH_MilsimTools_AdminMenu_ACE_Arsenal_Closed",true];}] call CBA_fnc_addEventHandler;
waitUntil {player getVariable ["MRH_MilsimTools_AdminMenu_ACE_Arsenal_Closed",false];};

_loadOutChanged = getUnitLoadOut _dummy;
_goggles2 = goggles _dummy;
_player setUnitLoadout _loadOutChanged;
_player addGoggles _goggles2;

[_player,"MRH_reset"] call BIS_fnc_setUnitInsignia;
[_player,_insignia] call BIS_fnc_setUnitInsignia;
player setVariable ["MRH_MilsimTools_AdminMenu_ACE_Arsenal_Closed",nil];
[_player,(localize "STR_MRH_ADM_NOT_LOADOUTCHANGEDBYAD")]call MRH_fnc_MilsimTools_Core_notifyPlayer;
["MRH_admin_menu_playerloadoutchanged_eh", [player,_player,_loadout,_loadoutChanged]] call CBA_fnc_localEvent;
deleteVehicle _dummy;
deleteVehicle _light;