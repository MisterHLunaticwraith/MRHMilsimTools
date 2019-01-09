/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_helicopterChoice
Author: Mr H.
Description: Opens helicopter choice interface and fills it
Return value: None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_helicopterChoice;
*/
#include "MRH_C_Path.hpp"

 disableSerialization;
createDialog "MRHHeliChoice";

 


_settingsEntry = [player,"MRH_MilsimTools_BluForHelis","MRH_MilsimTools_BluForOpFor","MRH_MilsimTools_BluForInde","MRH_MilsimTools_BluForCivs"] CFUNC(resultForSide);
_allHelis =[_settingsEntry] FUNC(returnHeliListFromSettings);
_ctrlBox = ((findDisplay 160718) displayCtrl 2100);
{
_prettyName = gettext (configfile >> "CfgVehicles" >> _x >> "displayName");
_index = _ctrlBox lbAdd _prettyName;
_ctrlBox lbSetData [_index,_x];


}forEach _allHelis;



_ctrlBox lbSetCurSel 0;

_ctrlButton = ((findDisplay 160718) displayCtrl 1600);

_ctrlButton buttonSetAction "
	_heli = lbdata [2100,(lbCurSel 2100)];
	
	player setVariable ['MRH_HeliTaxi_UserSelectedHeli',_heli,true];
	call MRH_fnc_MilsimTools_HeliTaxi_HeliTaxiCall; 
	closedialog 0;
	";
	
