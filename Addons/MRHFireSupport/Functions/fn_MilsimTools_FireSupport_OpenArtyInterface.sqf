/*
Function name:MRH_fnc_MilsimTools_OpenArtyInterface
Author: Mr H.
Description: Opens the interface for artillery
Return value: None
Public:No
Parameters:None
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_OpenArtyInterface

*/
#include "MRH_C_Path.hpp"
disableSerialization;
_allShellMagazines = missionNamespace getVariable "MRH_FireSupport_TypesOfArtyMags";
_handle = createDialog "MRHArtilleryInterface";
_ctrlGridRef = FDIS(1400);
_savedGridGref = MRH_player getVariable ["MRH_FireSupport_PreviouslyEnteredGridRef","00000-00000"];
_ctrlGridRef ctrlSetText _savedGridGref;
_ctrlAvailable = FDIS(1103);
_ctrlNumberCombo = FDIS(2100);
_ctrlAmmotypeCombo = FDIS(2101);

_availableShots = missionNamespace getVariable ["MRH_FireSupport_NumberOfAvailableArtilleryShots" + (str side MRH_player),0]; //temporary do 0 after settings
_ctrlAvailable ctrlSetStructuredText parseText (str _availableShots);
_numberAvailableArty = ["MRH_MilsimTools_FireSupport_ArtyShots"] call cba_settings_fnc_get;
if ((parseNumber _numberAvailableArty)<0) then {_ctrlAvailable ctrlSetStructuredText parseText "∞"};
{
_index = _ctrlNumberCombo lbAdd (str _x);
_ctrlNumberCombo lbSetData [_index,str _x];
} forEach [1,2,3];
_ctrlNumberCombo lbSetCurSel 0;
//onEachFrame {systemChat str (lbData [2100,lbcursel 2100]);};
{
_name = getText (configFile>>"cfgMagazines">>_x>>"displayName");
_index = _ctrlAmmotypeCombo lbAdd _name;
_ammo = getText( configFile >> "CfgMagazines" >>_x>> "ammo" );
_ctrlAmmotypeCombo lbsetData [_index,_ammo]; 
} foreach _allShellMagazines;
_ctrlAmmotypeCombo lbSetCurSel 0;