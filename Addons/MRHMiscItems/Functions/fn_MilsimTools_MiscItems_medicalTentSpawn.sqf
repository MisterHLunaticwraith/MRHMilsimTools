/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
params ["_tent"];
if (local _tent) then {
_comp = [_tent,"MRH_MedicalTentUnfold"] call MRH_fnc_spawnComposition;
_tent setVariable ["MRH_medicaltentSpecialAssociatedCmp",_comp,true];
};


 _statementCollect = 
 {
	params ["_tent"];
	_move ="AinvPknlMstpSnonWnonDnon_medicUp1";
	[MRH_player,_move] call ace_common_fnc_doAnimation;
	playSound3D ["MRHMiscItems\Sounds\MRH_PitchingTent.ogg", MRH_player];
	
	_time = ["MRH_MilsimTools_MiscItems_FieldMedicalTentRepackTime"] call cba_settings_fnc_get;
		_progress =
		[_time, 
		[_tent],
		{
			[MRH_player, ""] call ace_common_fnc_doAnimation;
			(_this select 0) params ["_tent"];
			_comp = _tent getVariable ["MRH_medicaltentSpecialAssociatedCmp",[objNull]];
			[MRH_Player,_comp] call MRH_fnc_deleteComposition;
			[_tent,MRH_player,"MRH_FoldedMedicalTent"] CFUNC(addItem);
			hint (localize "STR_MRH_MRHMiscItems_HintTentCollected");


		},
		{
			hint (localize "STR_MRH_MRHMiscItems_HintRepackingTentCancelled");
			[MRH_player, ""] call ace_common_fnc_doAnimation;
		},
		(localize "STR_MRH_MRHMiscItems_MessRepackingAncCOllectTent")


		] call ace_common_fnc_progressBar;

};

_loc =  (localize "STR_MRH_MRHMiscItems_AceActionRepackAndCollectTent");
_actionCollect =
["MRH_medicalTentFoldAndCollect", 
_loc,
 "\MRHMiscItems\Models\MedicalTent\medicalTentInv_ca.paa",
_statementCollect , 
 {true},
 {},
 [_tent],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_tent, 0, ["ACE_MainActions"], _actionCollect] call ace_interact_menu_fnc_addActionToObject