/*
Function name:MRH_fnc_MilsimTools_RHS_CBPS_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RHS_CBPS_deployCBPSModuleAction;
*/
#include "MRH_C_Path.hpp"





disableSerialization;


_display = findDisplay 220419;
_saved = _display getVariable ["MRH_ZeusModules_displayparams",[]];
_saved params ["_logic","_unit"];

#define CTRLF(ARG) ((_display) displayCtrl ARG)
_DEPLOYTICK = CTRLF(2800);
_CMPCMB = CTRLF(2100);
_deploy = cbChecked _DEPLOYTICK;
deployAction_fnc = {
	params ["_unit"];
	if  (_unit animationSourcePhase 'deploy_tent' > 0) exitWith {[localize "STR_MRH_MRHMRHZeusModules_GENERROR", localize "STR_MRH_MRH_RHS_CBPS_ZeusMessageAlReadyDeployed", 5] call BIS_fnc_curatorHint;}; //exit if tent is already deployed
	[_unit,'deploy_platform',1] spawn rhs_fnc_fmtv_Deploy;
	_unit animateSource ['deploy_tent',1];
	[_unit]FUNC(populate);
	closeDialog 0;
	
	};
repackAction_fnc = {
	params ["_unit"];
	[_unit,'deploy_platform',0] spawn rhs_fnc_fmtv_Deploy;
	_unit animateSource ['deploy_tent',0];
	[_unit]FUNC(repack);
	closeDialog 0;
	
};
_useGlobalComp =["MRH_MT_RHSCBPS_useGlobal"] call cba_settings_fnc_get;
if (_useGlobalComp && _deploy) exitWith
{
	[_unit] call deployAction_fnc;
};

if (_useGlobalComp && !_deploy) exitWith
{
	[_unit] call repackAction_fnc;
};


_selectedCmp =_CMPCMB lbData (lbCurSel _CMPCMB);
//systemChat str _selectedCmp;
[localize "STR_MRH_MRH_RHS_CBPS_CmpassignedZeusModMess",_selectedCmp, 5] call BIS_fnc_curatorHint;

_unit setVariable ["MRH_CBPSSpecificCompSelected",_selectedCmp,true];
if (_deploy) then {
	
	_unit setVariable ["MRH_useCBPSSpecificComp",true];
	[_unit] call deployAction_fnc;
	
	} else {
		[_unit] call repackAction_fnc;
	};
