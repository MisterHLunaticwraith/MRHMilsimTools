/*
Function name:MRH_fnc_isDoctor
Author: Mr H.
Description: Makes given unit a doctor by adding a conversation, upon talking to the unit the player will be healed fully
Return value: none
Public: Yes
Parameters:
0-<OBJECT> the unit to make doctor
Example(s):
[this] call MRH_fnc_isDoctor;
*/
#include "MRH_C_Path.hpp"
if !(hasInterface) exitWith {};
params["_unit"];
_statement = { 
	[{
		_progress = [10,[],{[MRH_player, MRH_player] call ACE_medical_fnc_treatmentAdvanced_fullHeal; hintC (localize "STR_MRH_FUNCS_goodHealedMess");},{ 
			hint (localize "STR_MRH_FUNCS_healingCancelled"); 
			
			
			}, 
			(localize "STR_MRH_FUNCS_healingInProgress") 
		
		
			] call ace_common_fnc_progressBar;

	},[],2] call CBA_fnc_waitAndExecute; 
};     
[_unit, (localize "STR_MRH_FUNCS_doctorMessageHeal"), _statement,"LOCAL",false] call MRH_fnc_simpleAceMessage; 

_code= {


        params ["_unit"];

		if !(local _unit) exitWith {};

		[_unit, "MRH_reset"] call BIS_fnc_setUnitInsignia;

		_codeDel = {
			params ["_unit"];
			[_unit, "MRH_MedicShoulderPatch"] call BIS_fnc_setUnitInsignia;
		};
		[_codeDel,[_unit],2] call CBA_fnc_waitAndExecute;
    }; 
 
[{time>1},_code,[_unit]] call CBA_fnc_waitUntilAndExecute;