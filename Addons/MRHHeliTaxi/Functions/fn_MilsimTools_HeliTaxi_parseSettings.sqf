/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_parseSettings;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_parseSettings;
*/
#include "MRH_C_Path.hpp"
if (!isServer) ExitWith {};
_numberAvailable = ["MRH_MilsimTools_Heli_NumberSimulTPerSide"] call cba_settings_fnc_get;
_numberAvailable = parseNumber _numberAvailable;
_numberAvailable = floor _numberAvailable;
if (_numberAvailable <1) then {_numberAvailable =1};

missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_" + "EAST",_numberAvailable,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_" + "WEST",_numberAvailable,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_" + "GUER",_numberAvailable,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_" + "CIV",_numberAvailable,true];

//MEDAVEC settings
/*
_numberAvailableMEDEVAC = ["MRH_MilsimTools_MEDEVAC_NumberSimulTPerSide"] call cba_settings_fnc_get;
_numberAvailableMEDEVAC = parseNumber _numberAvailableMEDEVAC;
_numberAvailableMEDEVAC  = floor _numberAvailableMEDEVAC ;
if (_numberAvailableMEDEVAC  <1) then {_numberAvailableMEDEVAC  =1};

missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_MEDEVAC_" + "EAST",_numberAvailableMEDEVAC,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_MEDEVAC_" + "WEST",_numberAvailableMEDEVAC,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_MEDEVAC_" + "GUER",_numberAvailableMEDEVAC,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_MEDEVAC_" + "CIV",_numberAvailableMEDEVAC,true];
*/
//Helis per side
_bluForHelis = [(["MRH_MilsimTools_MEDEVAC_BluFor"] call cba_settings_fnc_get)] CFUNC(stringListToArray);
_opForHelis = [(["MRH_MilsimTools_MEDEVAC_OpFor"] call cba_settings_fnc_get)] CFUNC(stringListToArray);
_indeHelis = [(["MRH_MilsimTools_MEDEVAC_Inde"] call cba_settings_fnc_get)] CFUNC(stringListToArray);
_civHelis =[(["MRH_MilsimTools_MEDEVAC_Civs"] call cba_settings_fnc_get)] CFUNC(stringListToArray);

missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_Helis_MEDEVAC_" + "WEST",_bluForHelis,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_Helis_MEDEVAC_" + "EAST",_opForHelis,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_Helis_MEDEVAC_" + "GUER",_indeHelis,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_Helis_MEDEVAC_" + "CIV",_civHelis,true];


//escorts per side
_bluForEscort = ["MRH_MilsimTools_MEDEVAC_ESCORT_BluFor"] call cba_settings_fnc_get;
_opforEscort= ["MRH_MilsimTools_MEDEVAC_ESCORT_OpFor"] call cba_settings_fnc_get;
_indeEscort =["MRH_MilsimTools_MEDEVAC_ESCORT_Inde"] call cba_settings_fnc_get;
_civEscort =["MRH_MilsimTools_MEDEVAC_ESCORT_BluForCivs"] call cba_settings_fnc_get;

missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_EscortHeli_MEDEVAC_" + "WEST",_bluForEscort,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_EscortHeli_MEDEVAC_" + "EAST",_opforEscort,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_EscortHeli_MEDEVAC_" + "GUER",_indeEscort,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_EscortHeli_MEDEVAC_" + "CIV",_civEscort,true];

//medic class
_medicBlufor = ["MRH_MilsimTools_MEDEVAC_MEDICCLASS_BluFor"] call cba_settings_fnc_get;
_medicOpFor = ["MRH_MilsimTools_MEDEVAC_MEDICCLASS_OpFor"] call cba_settings_fnc_get;
_medicInde = ["MRH_MilsimTools_MEDEVAC_MEDICCLASS_Inde"] call cba_settings_fnc_get;
_medicCiv = ["MRH_MilsimTools_MEDEVAC_MEDICCLASS_Civs"] call cba_settings_fnc_get;

missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_Medic_MEDEVAC_" + "WEST",_medicBlufor,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_Medic_MEDEVAC_" + "EAST",_medicOpFor,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_Medic_MEDEVAC_" + "GUER",_medicInde,true];
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_Medic_MEDEVAC_" + "CIV",_medicCiv,true];


//items call
_itemsCall = [(["MRH_MilsimTools_MEDEVAC_MEDICCLASS_ItemsCall"] call cba_settings_fnc_get)] CFUNC(stringListToArray);
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_MEDEVAC_itemsCall",_itemsCall,true];