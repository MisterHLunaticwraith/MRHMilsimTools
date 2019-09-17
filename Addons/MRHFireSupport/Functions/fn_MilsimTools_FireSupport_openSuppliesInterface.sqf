/*
Function name:MRH_fnc_MilsimTools_FireSupport_openSuppliesInterface
Author: Mr H.
Description: Opens arty interface and modify it to fit supply requests
Return value: None
Public:No
Parameters:None
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_openSuppliesInterface;

*/
#include "MRH_C_Path.hpp"

disableSerialization;
_allAvailablePlanes = missionNamespace getVariable ["MRH_FireSupport_TypesSupportPlanes"+ (str side MRH_player),[]];
if (_allAvailablePlanes isEqualTo []) exitWith {systemChat localize "STR_MRH_FireSupport_SC_NoSuppsAVSIDE"};
_handle = createDialog "MRHArtilleryInterface";
//redefine from arty interface
_Title = FDIS(1100);
_Title ctrlSetStructuredText parseText (localize "STR_MRH_FireSupport_SC_SDrequesterTitle");
_type = FDIS(1105);
_type ctrlSetStructuredText parseText (localize "STR_MRH_FireSupport_SC_SelectTypeSupplies");
_attack = FDIS(1104);
_attack ctrlSetStructuredText parseText (localize "STR_MRH_FireSupport_SC_SelectTypeSPAir");
_availableTIP = FDIS(1102);
_availableTIP ctrlSetStructuredText parseText (localize "STR_MRH_FireSupport_SC_NumberOfAvailSD");


_ctrlGridRef = FDIS(1400);
_savedGridGref = MRH_player getVariable ["MRH_FireSupport_PreviouslyEnteredGridRefSUPPLY","00000-00000"];
_ctrlGridRef ctrlSetText _savedGridGref;
_ctrlAvailable = FDIS(1103);
_ctrlNumberCombo = FDIS(2100);
_ctrlAmmotypeCombo = FDIS(2101);

_availableShots = missionNamespace getVariable ["MRH_FireSupport_NumberOfAvailableSupplyDrops" + (str side MRH_player),0]; //temporary do 0 after settings
_ctrlAvailable ctrlSetStructuredText parseText (str _availableShots);

_numberAvailableSP = ["MRH_MilsimTools_FireSupport_NumberOfSuppliesDrops"] call cba_settings_fnc_get;
if ((parseNumber _numberAvailableSP)<0) then {_ctrlAvailable ctrlSetStructuredText parseText "∞"};
{
_nameofplane = getText (configFile>>"cfgVehicles">>_x>>"displayName");
_index = _ctrlNumberCombo lbAdd _nameofplane;
_ctrlNumberCombo lbSetData [_index, _x];
} forEach _allAvailablePlanes;
_ctrlNumberCombo lbSetCurSel 0;

_availableSupplies = missionNamespace getVariable ["MRH_FireSupport_AvailableSupplyDropsTypes" + (str side MRH_player),[]]; //temporary do 0 after settings
//onEachFrame {systemChat str (lbData [2100,lbcursel 2100]);};
_index = _ctrlAmmotypeCombo lbAdd (localize "STR_MRH_FireSupport_SC_AmmoResupCratePretty");
_ctrlAmmotypeCombo lbsetData [_index,"MRH_SupplyCrate_special"];
{

_index = _ctrlAmmotypeCombo lbAdd (getText (configFile>>"cfgVehicles">>_x>>"displayName"));
_ctrlAmmotypeCombo lbsetData [_index,_x]; 
}forEach _availableSupplies;
_ctrlAmmotypeCombo lbSetCurSel 0;

_button = FDIS(1601);
_button ctrlSetText (localize "STR_MRH_FireSupport_SC_CallSupplyInterfaceButton");
_button buttonSetAction "[] spawn MRH_fnc_MilsimTools_FireSupport_startSupplyDrop";