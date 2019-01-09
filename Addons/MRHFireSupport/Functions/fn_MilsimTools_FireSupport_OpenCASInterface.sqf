/*
Function name:MRH_fnc_MilsimTools_FireSupport_OpenCASInterface
Author: Mr H.
Description: Opens the artillery interface and modifies its contents to fit CAS requests
Return value:None
Public:No
Parameters:None
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_OpenCASInterface

*/
#include "MRH_C_Path.hpp"

disableSerialization;
_allAvailablePlanes = missionNamespace getVariable ["MRH_FireSupport_TypesCASPLANES"+ (str side player),[]];
if (_allAvailablePlanes isEqualTo []) exitWith {systemChat localize "STR_MRH_FireSupport_CASnoCASForYourSide"};
_handle = createDialog "MRHArtilleryInterface";
//redefine from arty interface
_Title = FDIS(1100);
_Title ctrlSetStructuredText parseText (localize "STR_MRH_FireSupport_RequestCASInterface");
_type = FDIS(1105);
_type ctrlSetStructuredText parseText (localize "STR_MRH_FireSupport_CASSelectTypeInterFace");
_attack = FDIS(1104);
_attack ctrlSetStructuredText parseText (localize "STR_MRH_FireSupport_CASSelectPlaneTypeInterface");
_availableTIP = FDIS(1102);
_availableTIP ctrlSetStructuredText parseText (localize "STR_MRH_FireSupport_CASAvailableNumberOfCasSupportInterface");


_ctrlGridRef = FDIS(1400);
_savedGridGref = player getVariable ["MRH_FireSupport_PreviouslyEnteredGridRefCAS","00000-00000"];
_ctrlGridRef ctrlSetText _savedGridGref;
_ctrlAvailable = FDIS(1103);
_ctrlNumberCombo = FDIS(2100);
_ctrlAmmotypeCombo = FDIS(2101);

_availableShots = missionNamespace getVariable ["MRH_FireSupport_NumberOfAvailableCAS" + (str side player),0]; //temporary do 0 after settings
_ctrlAvailable ctrlSetStructuredText parseText (str _availableShots);
{
_nameofplane = getText (configFile>>"cfgVehicles">>_x>>"displayName");
_index = _ctrlNumberCombo lbAdd _nameofplane;
_ctrlNumberCombo lbSetData [_index, _x];
} forEach _allAvailablePlanes;
_ctrlNumberCombo lbSetCurSel 0;

//onEachFrame {systemChat str (lbData [2100,lbcursel 2100]);};
{

_index = _ctrlAmmotypeCombo lbAdd (_x select 1);
_ctrlAmmotypeCombo lbsetData [_index,(str (_x select 0))]; 
}forEach [[0,(localize "STR_MRH_FireSupport_CASChooseGuns")],[1,(localize "STR_MRH_FireSupport_CASChooseMissiles")],[2,(localize "STR_MRH_FireSupport_CASChooseGunsAndMissiles")],[3,(localize "STR_MRH_FireSupport_CASChooseBomb")]];
_ctrlAmmotypeCombo lbSetCurSel 0;

_button = FDIS(1601);
_button buttonSetAction "[] spawn MRH_fnc_MilsimTools_FireSupport_FireCAS";