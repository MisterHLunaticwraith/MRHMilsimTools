/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"
_isHeliAssigned = (group MRH_player) GVARDef(isUsingHeli,false);
if !(_isHeliAssigned) exitWith {false};
_assignedHeli = (group MRH_player) GVARDef(slavedHeli,objNull);
if (isNull _assignedHeli) exitWith {false};
if(!alive _assignedHeli) exitWith {false};
_wayback= _assignedHeli GVARDef(isFlyingBackToBase,false);
if(_wayback) exitWith {false};
_homeBase = _assignedHeli GVAR(startingPhysicalPos);
if ((_assignedHeli distance _homeBase)<200) exitWith {false};
_isEmpty = [_assignedHeli]FUNC(isEmptyOfPlayers);
if !(_isEmpty) exitWith {false};
if ((vehicle MRH_player)== _assignedHeli) exitWith {false};
_isInLandingPhase = _assignedHeli GVARDef(isInFinalApproachPhase,false);
if (_isInLandingPhase) exitWith {false};
_isMilsimToolsDead = MRH_player getVariable ["MRH_MilsimTools_Core_HasDied",false];
if (_isMilsimToolsDead) exitWith {false};
true