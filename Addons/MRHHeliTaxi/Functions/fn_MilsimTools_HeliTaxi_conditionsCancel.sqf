/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_conditionsCancel;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_conditionsCancel;
*/
#include "MRH_C_Path.hpp"
_groupOwnsHeli = (group MRH_player)GVARDef(ownsPhysicalHeli,false);
if (_groupOwnsHeli) exitWith {FUNC(conditionsCancelPhysicalHeli)};

_isHeliAssigned = (group MRH_player) GVARDef(isUsingHeli,false);
if !(_isHeliAssigned) exitWith {false};
_assignedHeli = (group MRH_player) GVAR(slavedHeli);
_isEmpty = [_assignedHeli]FUNC(isEmptyOfPlayers);
if !(_isEmpty) exitWith {false};
if ((vehicle MRH_player)== _assignedHeli) exitWith {false};
_isInLandingPhase = _assignedHeli GVARDef(isInFinalApproachPhase,false);
if (_isInLandingPhase) exitWith {false};
_isMilsimToolsDead = MRH_player getVariable ["MRH_MilsimTools_Core_HasDied",false];
if (_isMilsimToolsDead) exitWith {false};
true