/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
*/
#include "MRH_C_Path.hpp"
#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
_altASL = round ([_logic]CFUNC(returnAltitude));
createDialog "MRHSimpleHalo";

_display =findDisplay 170119;
_display setVariable ["MRH_ZeusModules_AssociatedLogic",_logic];
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_PLAYERLIST = CTRLF(1500);
_INCLUDEGRP =CTRLF(2800);
_AUTOADDGEAR =CTRLF(2801);
_STARTALTITUDE =CTRLF(1400);
_PLAYERAADFORCE = CTRLF(2802);
_PLAYERAADALTITUDE=CTRLF(1401);
_ONBOARDITEMS =CTRLF(1501);
_AVAILABLEITEMS =CTRLF(1502);
_OBJECTSAADFORCE =CTRLF(2803);
_OBJECTSAADALT =CTRLF(1402);
_MODULEALTTEXT=CTRLF(1028);

_MODULEALTTEXT ctrlSetText format [localize "STR_MRH_MRHMRHZeusModules_LZABOVESEALVLFORMAT",_altASL];

//set default values and fill lists

{
	private _index = _PLAYERLIST lbAdd name _x;
	_PLAYERLIST lbSetData [_index,str _x];
}forEach allPlayers;

_INCLUDEGRP cbSetChecked true;

_AUTOADDGEAR cbSetChecked true;

_STARTALTITUDE ctrlSetText "6000";

_PLAYERAADFORCE cbSetChecked true;

_PLAYERAADALTITUDE ctrlSetText (['MRH_MilsimTools_HaloGear_AADDefaultOpeningAltitude'] call cba_settings_fnc_get);

_avail = [];
{
	if (_x getVariable ["MRH_ZeusModules_qualifiesForHalo",false]) then {_avail pushBackUnique _x};
}forEach allMissionObjects "All";

{
	private _index = _AVAILABLEITEMS lbAdd (getText (configFile>>"cfgVehicles">>typeOf _x>>"displayName"));
	_AVAILABLEITEMS lbSetData [_index,str _x];
} forEach _avail;

_OBJECTSAADFORCE cbSetChecked true;

_OBJECTSAADALT ctrlSetText (['MRH_MilsimTools_HaloGear_AADDefaultOpeningAltitude'] call cba_settings_fnc_get);