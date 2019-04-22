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

_statement = {
params ["_veh"];
_composition = "";
_useGlobalComp =["MRH_MT_RHSCBPS_useGlobal"] call cba_settings_fnc_get;
if (_useGlobalComp) then {_composition = ["MRH_MT_RHSCBPS_globalComp"] call cba_settings_fnc_get;};


_useSpecific = _veh getVariable ["MRH_useCBPSSpecificComp",false];
if (!(_useGlobalComp) && !(_useSpecific)) exitWith {};


_attributesDefComp = _veh getVariable ["MRH_CBPSSpecificCompSelected",""];
if (!(_useGlobalComp) && (_useSpecific)) then {_composition = _attributesDefComp};
//-----spawn composition
_comp = [_veh,_composition] call MRH_fnc_spawnComposition;
_veh setVariable ["MRH_CBPS_spawnedComp",_comp,true];
};

[
    {((_this select 0) animationSourcePhase 'deploy_tent' >= 1)}, 
    _statement, 
    _this,
	8
] call CBA_fnc_waitUntilAndExecute;