/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_medEvacRefreshPenaltyText;
*/
#include "MRH_C_Path.hpp"
#include "dialogRefs.hpp"
_penalty = FUNC(medEvacCalculateTimePenalty);
_timeMalusStrTxt ctrlSetStructuredText parseText ((localize "STR_MRH_HeliTaxi_medEvacPenaltyExpect")+ ([_penalty,"MM:SS"] call BIS_fnc_secondsToString)+ " " +(localize "STR_MRH_HeliTaxi_genMinutes"));