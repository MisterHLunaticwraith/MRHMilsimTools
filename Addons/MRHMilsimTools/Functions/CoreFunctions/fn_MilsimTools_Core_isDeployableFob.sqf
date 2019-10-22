/*
Function name:MRH_fnc_MilsimTools_Core_isDeployableFob
Author: Mr H.
Description: Turns an object into a mobile fob deployement objetc by adding ace 3 interactions
Return value: 
Public: No
Parameters:
0-<OBJECT> object that will serve as a source and pivot for the spawned composition.
1 -<ARRAY> or <STRING> if array, array in composition format, if string, classname of cfgMRHcompositions see MRH_fnc_generateComposition & MRH_fnc_spawnComposition for more info 
2- <NUMBER> - optional radius around the object where original objects from the composition will be deleted. Useful if you have vehicles in the composition and players take them away, then they won't be deleted if they are beyond that distance. -1 (default value) makes distance infinite.
3- <NUMBER> -optional, default 20, time necessary to deploy the FOB 
4- <NUMBER> -optional, default 20, time necessary to repack the fob

Example(s):
[this,"MRH_FieldHQSmall_default"]call MRH_fnc_MilsimTools_Core_isDeployableFob;
or
[this,"MRH_FieldHQSmall_default",50]call MRH_fnc_MilsimTools_Core_isDeployableFob;
or
[this,"MRH_FieldHQSmall_default",50,60,60]call MRH_fnc_MilsimTools_Core_isDeployableFob;
*/
#include "MRH_C_Path.hpp"
params ["_MOBsource","_composition",["_deleteRadius",-1],["_deployTime",20],["_repackTime",20]];


//-------------------------add deploy action
_statementDeploy = {
	(_this select 2) params ["_MOBsource","_composition","_deployTime"];

	_MOBsource setVariable ["MRH_MOBsource_isNotDeploying",true,true];

		_progress = [
				_deployTime,
				[_MOBsource,_composition],
				{ 

						(_this select 0) params ["_MOBsource","_composition"];
					
						_MOBsource setVariable ["MRH_MOBsource_isNotDeploying",false,true];
						_MOBsource setVariable ["MRH_MOBsource_MOBsourceisDeployed",true,true];
						_comp = [_MOBsource,_composition] call MRH_fnc_spawnComposition;
					

						_MOBsource setVariable ["MRH_MOBsource_SpawnedComp",_comp,true];
						
						hintC (localize "STR_MRH_MISC_FobDeployedHintC");
						["mrh_fobdeployed", [_MOBsource,_composition,_comp,MRH_player]] call CBA_fnc_globalEvent;

				},

				{ 
					//cancel
						_MOBsource = (_this select 0) select 0;
						_MOBsource setVariable ["MRH_MOBsource_isNotDeploying",false,true];
						hintC (localize "STR_MRH_MISC_FobDeployementCancelledHintC");


				}, 
				(localize "STR_MRH_MISC_DeployingFobProgress") 


			] call ace_common_fnc_progressBar; 
	};
_loc = localize "STR_MRH_MISC_FobDeployAceAction"; 
_action =
["MRH_DeployHQ_action", 
_loc,
"",
_statementDeploy, 
{_return = false; _MOBsource = _this select 0;_isDep=  _MOBsource getVariable ["MRH_MOBsource_MOBsourceisDeployed",false];_isDeploying =_MOBsource getVariable ["MRH_MOBsource_isNotDeploying",false]; _return = (!(_isDep) && !(_isDeploying) && !([_MOBsource] call ace_interaction_fnc_canFlip));_return},
{},
[_MOBsource,_composition,_deployTime],
[0,0,0], 
5] call ace_interact_menu_fnc_createAction;

[_MOBsource, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	
//------------------------- add repack action 

_statementRepack = {
		(_this select 2) params ["_MOBsource","_deleteRadius","_repackTime"];

		_MOBsource setVariable ["MRH_MOBsource_isNotDeploying",true,true];

		_progress = [
			_repackTime,
			[_MOBsource,_deleteRadius],
			{ 
				(_this select 0) params ["_MOBsource","_deleteRadius"];
				
				_MOBsource setVariable ["MRH_MOBsource_isNotDeploying",false,true];
				_comp= _MOBsource getVariable ["MRH_MOBsource_SpawnedComp",[]];

				[_MOBsource,_comp,_deleteRadius] call MRH_fnc_deleteComposition;

				_MOBsource setVariable ["MRH_MOBsource_MOBsourceisDeployed",false,true];
				hintC (localize "STR_MRH_MISC_FobRepackedHintC");
			},

			{ 
			//cancel
				_MOBsource = (_this select 0) select 0;
				_MOBsource setVariable ["MRH_MOBsource_isNotDeploying",false,true];
				hintC (localize "STR_MRH_MISC_FobRepackCancelledHintC");


			}, 
		(localize "STR_MRH_MISC_FobRepackProgress")


			] call ace_common_fnc_progressBar; 
	};
_loc = localize "STR_MRH_MISC_FobRepackAceAction"; 
_actionRP =
["MRH_RepackHQ_action", 
_loc,
"",
_statementRepack, 
{_return = false; _MOBsource = _this select 0;_isDep=  _MOBsource getVariable ["MRH_MOBsource_MOBsourceisDeployed",false];_isDeploying =_MOBsource getVariable ["MRH_MOBsource_isNotDeploying",false]; _return = ((_isDep) && !(_isDeploying) && !([_MOBsource] call ace_interaction_fnc_canFlip));_return},
{},
[_MOBsource,_deleteRadius,_repackTime],
[0,0,0], 
5] call ace_interact_menu_fnc_createAction;
////
[_MOBsource, 0, ["ACE_MainActions"], _actionRP] call ace_interact_menu_fnc_addActionToObject;