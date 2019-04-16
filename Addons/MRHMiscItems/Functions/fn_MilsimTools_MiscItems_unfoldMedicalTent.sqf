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
_move ="AinvPknlMstpSnonWnonDnon_medicUp1";
//"InBaseMoves_repairVehicleKnl"


[MRH_player,_move] call ace_common_fnc_doAnimation;
//MRH_player say3D "MRH_sound_searching"; //toDo Change sound
playSound3D ["MRHMiscItems\Sounds\MRH_PitchingTent.ogg", MRH_player];

_time = ["MRH_MilsimTools_MiscItems_FieldMedicalTentDeployTime"] call cba_settings_fnc_get;
_progress =
[_time, 
[],
{
	[MRH_player, ""] call ace_common_fnc_doAnimation;
	_tent = "MRH_MedicalTent_Special" createVehicle (MRH_player modelToWorld [0,1,0]);
	if (((getPosATLVisual _tent) select 2) <0) then {_tent setPosATL [(getPosATL _tent) select 0,(getPosATL _tent) select 1,0]};
	if (((getPosATLVisual _tent) select 2) >0) then {_tent setPosATL [(getPosATL _tent) select 0,(getPosATL _tent) select 1,0]};
	_tent setVectorUp surfaceNormal (getPosATL _tent);
	MRH_player removeItem "MRH_FoldedMedicalTent";

},
{
	hint (localize "STR_MRH_MRHMiscItems_HintPitchingTentCancelled");
	[MRH_player, ""] call ace_common_fnc_doAnimation;
},
(localize "STR_MRH_MRHMiscItems_ProgressPitchingMedTent")


] call ace_common_fnc_progressBar;