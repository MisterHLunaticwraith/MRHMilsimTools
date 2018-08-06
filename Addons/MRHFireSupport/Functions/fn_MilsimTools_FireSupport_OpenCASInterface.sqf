/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_

*/
#include "MRH_C_Path.hpp"

disableSerialization;
_allAvailablePlanes = missionNamespace getVariable ["MRH_FireSupport_TypesCASPLANES"+ (str side player),[]];
if (_allAvailablePlanes isEqualTo []) exitWith {systemChat "There are no CAS available for your side"};
_handle = createDialog "MRHArtilleryInterface";
//redefine from arty interface
_Title = FDIS(1100);
_Title ctrlSetStructuredText parseText "Request Close Air Support";
_type = FDIS(1105);
_type ctrlSetStructuredText parseText "Select Attack Type";
_attack = FDIS(1104);
_attack ctrlSetStructuredText parseText "Select Airplane Type";
_availableTIP = FDIS(1102);
_availableTIP ctrlSetStructuredText parseText "Available number of CAS supports";


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
}forEach [[0,"Guns"],[1,"Missiles"],[2,"Guns and missiles"],[3,"Bomb"]];
_ctrlAmmotypeCombo lbSetCurSel 0;

_button = FDIS(1601);
_button buttonSetAction "[] spawn MRH_fnc_MilsimTools_FireSupport_FireCAS";