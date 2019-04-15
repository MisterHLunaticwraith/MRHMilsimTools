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
	//toDo make option to set time it takes?
		_progress =
		[10, 
		[_tent],
		{
			[MRH_player, ""] call ace_common_fnc_doAnimation;
			(_this select 0) params ["_tent"];
			_comp = _tent getVariable ["MRH_medicaltentSpecialAssociatedCmp",[objNull]];
			[MRH_Player,_comp] call MRH_fnc_deleteComposition;
			[_tent,MRH_player,"MRH_FoldedMedicalTent"] CFUNC(addItem);
			hint "Tent collected";


		},
		{
			hint "Repacking tent cancelled";
			[MRH_player, ""] call ace_common_fnc_doAnimation;
		},
		"Repacking and collecting medical tent"


		] call ace_common_fnc_progressBar;

};

_loc =  "Repack and collect tent";
_actionCollect =
["MRH_medicalTentFoldAndCollect", 
_loc,
 "",
_statementCollect , 
 {true},
 {},
 [_tent],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_tent, 0, ["ACE_MainActions"], _actionCollect] call ace_interact_menu_fnc_addActionToObject