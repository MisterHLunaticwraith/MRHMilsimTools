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
//uncomment the following for funcs called by modules
#include "MRH_MODULE_FUNC_MACROS_INC.sqf"

_unit = attachedTo _logic;
if (isNull _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRNOOBJESEL"]FUNC(deleteAndError)};


_logic setVariable ["MRH_fnc_MilsimTools_ZeusModules_attachedUnit",_unit];
createDialog "MRHAttributeDataMenu";
_display = findDisplay 200119;
_display setVariable ["MRH_ZeusModules_displayparams",[_logic,_unit]];
/*
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_ctrlTree = CTRLF(9902);
_ctrlText = CTRLF(9903);
_picsListBox = CTRLF(9904);
_picPreview =CTRLF(9905);
_refreshButton = CTRLF(9907);

_toAddDataListBox = CTRLF(1500);
_toAddPictureListBox = CTRLF()
*/