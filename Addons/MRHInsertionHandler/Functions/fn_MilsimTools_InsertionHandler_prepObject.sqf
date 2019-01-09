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

_object =player GVAR(currentAdressedLoadingObj);
_mass = getMass _object;
_time = _mass/50;
playSound "MRH_InsertionHandler_Strapping";
_progress = [_time,[],
			{
				_object =player GVAR(currentAdressedLoadingObj);
				_prettyName = player GVAR(setPrettyName);
				[_object, side player,true,_prettyName] FUNC(isAirDropSupply);
				player SVAR(currentAdressedLoadingObj,nil,false);
				player SVAR(setPrettyName,nil,false);
				hintC (localize "STR_MRH_MRHInsertionHandler_CargoReadyHC");
			},
			{
					
				
				player SVAR(currentAdressedLoadingObj,nil,false);
				player SVAR(setPrettyName,nil,false);
				hintC (localize "STR_MRH_MRHInsertionHandler_preppingCancelledHC");	
					
			},
				(localize "STR_MRH_MRHInsertionHandler_preppingCargoProgressBar")


				] call ace_common_fnc_progressBar;

