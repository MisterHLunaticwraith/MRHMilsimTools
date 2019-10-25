/*
Function name:MRH_fnc_MilsimTools_RadioChatter_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RadioChatter_;
*/
#include "MRH_C_Path.hpp"

params ["_sourceObject"];
_paa = "\MRHRadioChatter\radio.paa";
_locOn = localize "STR_MRH_RC_TURNRADIOON";
_locOff = localize "STR_MRH_RC_TURNRADIOOFF";

		_action =["RadioSwitch_on", 
		_locOn,
		 _paa,
		 { 
			 _sourceObject = _this select 0;
			 _sourceObject say3D "MRH_radiochatter_radioclick";
			 _faction = _sourceObject getVariable "MRH_RadioChatter_Faction";
			 [[_sourceObject,_faction],MRH_fnc_MilsimTools_RadioChatter_RadioChatter] RemoteExec ["Call",2];//[0,2] select isDedicated];

		 }, 
		 {(!(missionNamespace getVariable ["MRH_MilsimTools_RadioChatter_radiosAreKilled",false])&& !((_this select 0)getVariable ["MRH_RadioChatter_RadioOn",true]))},
		 {},
		 [],
		 [0,0,0], 
		 5] call ace_interact_menu_fnc_createAction;
		 ////
		 [_sourceObject, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 


		_action =["RadioSwitch", 
		_locOff,
		 _paa, 
		 { 
			 _sourceObject = _this select 0;
			 /*
			 [[_sourceObject],
				 {
				 params ["_sourceObject"];
				 _sound = (position _sourceObject) nearestObject "#soundonvehicle";
				 deleteVehicle _sound;
				 }
			 ] RemoteExec ["Spawn",[0,-2] select isDedicated,false];
			*/
			//with playsound3D you can't delete the sound but still it will be less messy in MP where this didn't work half the time anyway
			 _sourceObject say3D "MRH_radiochatter_radioclick";
			 _faction = _sourceObject getVariable "MRH_RadioChatter_Faction";
			 [_sourceObject,_faction] FUNC(RadioChatter);

			 _sourceObject setVariable ["MRH_RadioChatter_RadioOn",false,true];
		 }, 
		 {(!(missionNamespace getVariable ["MRH_MilsimTools_RadioChatter_radiosAreKilled",false])&& ((_this select 0)getVariable ["MRH_RadioChatter_RadioOn",true]))},
		 {},
		 [],
		 [0,0,0], 
		 5] call ace_interact_menu_fnc_createAction;
		 ////
		 [_sourceObject, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
