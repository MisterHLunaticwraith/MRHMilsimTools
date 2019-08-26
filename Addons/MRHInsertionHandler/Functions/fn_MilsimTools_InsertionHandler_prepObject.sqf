/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_prepObject
Author: Mr H.
Description: Show progress bar and adds variables to the prepped object
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_prepObject;
*/
#include "MRH_C_Path.hpp"
closeDialog 0;

_object =MRH_player GVAR(currentAdressedLoadingObj);
_mass = getMass _object;
_time = _mass/50;
playSound "MRH_InsertionHandler_Strapping";
_move ="AinvPknlMstpSnonWnonDnon_medicUp1";
//"InBaseMoves_repairVehicleKnl"


[MRH_player,_move] call ace_common_fnc_doAnimation;
_progress = [_time,[],
			{
				_object =MRH_player GVAR(currentAdressedLoadingObj);
				_prettyName = MRH_player GVAR(setPrettyName);
				[_object, side MRH_player,true,_prettyName] FUNC(isAirDropSupply);
				MRH_player SVAR(currentAdressedLoadingObj,nil,false);
				MRH_player SVAR(setPrettyName,nil,false);
				hintC (localize "STR_MRH_MRHInsertionHandler_CargoReadyHC");
				[MRH_player, ""] call ace_common_fnc_doAnimation;
			},
			{
					
				
				MRH_player SVAR(currentAdressedLoadingObj,nil,false);
				MRH_player SVAR(setPrettyName,nil,false);
				hintC (localize "STR_MRH_MRHInsertionHandler_preppingCancelledHC");	
				[MRH_player, ""] call ace_common_fnc_doAnimation;
					
			},
				(localize "STR_MRH_MRHInsertionHandler_preppingCargoProgressBar")


				] call ace_common_fnc_progressBar;

