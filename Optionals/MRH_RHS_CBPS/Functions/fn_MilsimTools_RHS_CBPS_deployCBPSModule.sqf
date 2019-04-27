/*
Function name:MRH_fnc_MilsimTools_RHS_CBPS_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RHS_CBPS_;
*/
#include "MRH_C_Path.hpp"
#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_unit = attachedTo _logic;
//systemChat format ["%1 %2",_logic,attachedObjects _logic];

if (isNull _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORNOUNSELECTED"]EFUNC(ZeusModules,deleteAndError)};
if !(_unit isKindOf "rhsusf_M1085A1P2_B_Medical_fmtv_usarmy") exitWith {[_logic,localize "STR_MRH_MRH_RHS_CBPS_ZeusErrorMustBeCBPS"]EFUNC(ZeusModules,deleteAndError)};
if (!alive _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORMUSTBEALIVE"]EFUNC(ZeusModules,deleteAndError)};
_logic setVariable ["MRH_fnc_MilsimTools_ZeusModules_attachedUnit",_unit];
disableSerialization;

createDialog "MRHZeusCBPS";
_display = findDisplay 220419;
_display setVariable ["MRH_ZeusModules_displayparams",[_logic,_unit]];
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_CMPTEXT = CTRLF(1002);
_CMPCMB = CTRLF(2100);

//do not show composition if global comp is enabled
_useGlobalComp =["MRH_MT_RHSCBPS_useGlobal"] call cba_settings_fnc_get;
if (_useGlobalComp) exitWith
{
	{
		_x ctrlShow false;
	} forEach [_CMPTEXT,_CMPCMB];
};



[_CMPCMB]FUNC(fillAttributesCombo);
_previousComp =_unit getVariable ["MRH_CBPSSpecificCompSelected","None"];
_index = [_CMPCMB,_previousComp]CFUNC(findCtrlBoxIndexFor);
_CMPCMB lbSetCurSel _index;