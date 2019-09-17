/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_MedEvacCalculateTimePenalty;
*/
#include "MRH_C_Path.hpp"
private _penalty =0;
#include "dialogRefs.hpp"
private _numberOfPatients = ctrlText _numberOfPatientsEdit;
if ((parseNumber _numberOfPatients)>= 10) then {_penalty = _penalty + 60};

private _specials = _specCombo lbData (lbCurSel _specCombo );
if !(_specials == "none") then {_penalty = _penalty + 30};

private _surgeon = cbChecked _surgeonCheck;
if (_surgeon) then {_penalty = _penalty + 60};

private _security = _securityCombo lbData (lbCurSel _securityCombo);
if (_security == "unsafe") then {_penalty = _penalty + 60};

private _nbc = cbChecked _nbcCheck;
if (_nbc) then {_penalty = _penalty + 15};
_penalty