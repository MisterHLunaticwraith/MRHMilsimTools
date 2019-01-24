/*
Function name:MRH_fnc_MilsimTools_HaloGear_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HaloGear_;
*/
#include "MRH_C_Path.hpp"
params ["_object"];

createDialog 'MRH_AAS_Cypres2Menu';
_display = (findDisplay 211218);
(_display  displayCtrl 1400) ctrlSetText (_object getVariable ['MRH_HaloGear_AADOpening_alt',(['MRH_MilsimTools_HaloGear_AADDefaultOpeningAltitude'] call cba_settings_fnc_get)]);
_display setVariable ["MRH_AAD_InterfaceHandlingObject",_object];