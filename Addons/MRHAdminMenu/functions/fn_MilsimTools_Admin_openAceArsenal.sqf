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

//create a dummy copy of the selected player
//_dummy = group player createUnit ["C_man_p_beggar_F", player modelToWorld [0,0,1000], [], 0, "FORM"];
_dummy = "C_man_p_beggar_F" createVehicleLocal (player modelToWorld [0,0,1000]);
_dummy setPos (player modelToWorld [0,0,1000]);
_dummy enableSimulation false;
waitUntil {!isNull _dummy};
_dummyChangeSCript = [_player,_dummy] spawn {
params ["_player","_dummy"];
_face = Face _player;
_goggles = goggles _player;
_loadOut = getUnitLoadOut _player;
Diag_log format ["MRH_MilsimTools_AdminMenu Saved remote loadout for player %1: %2",str _player, str _loadOut];
waitUntil {!(_loadOut isEqualTo [])};
_dummy setUnitLoadout _loadout;
_dummy setFace _face;
_dummy addGoggles _goggles;
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
player setVariable ["MRH_MilsimTools_AdminMenu_ACE_Arsenal_Closed",nil];
deleteVehicle _dummy;
deleteVehicle _light;