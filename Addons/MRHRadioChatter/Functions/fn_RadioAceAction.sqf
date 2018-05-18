params ["_sourceObject", "_OnOff"];
_paa = "\MRHRadioChatter\radio.paa";
_locOn = localize "STR_MRH_RC_TURNRADIOON";
_locOff = localize "STR_MRH_RC_TURNRADIOOFF";
switch (true) do 
{
	case (_onOff == "ON"):{
		_action =["RadioSwitch", 
		_locOn,
		 _paa,
		 { 
			 _sourceObject = _this select 0;
			 _sourceObject say3D "MRH_radiochatter_radioclick";
			 _faction = _sourceObject getVariable "MRH_RadioChatter_Faction";
			 [[_sourceObject,_faction],MRH_fnc_RadioChatter] RemoteExec ["Call",[0,2] select isDedicated];
			 [[_sourceObject,0,["ACE_MainActions","RadioSwitch"]],ace_interact_menu_fnc_removeActionFromObject] RemoteExec ["Call",[0,-2] select isDedicated,true];
			 [[_sourceObject,"OFF"],MRH_fnc_RadioAceAction] RemoteExec ["Call",[0,-2] select isDedicated,true];
		 }, 
		 {true},
		 {},
		 [],
		 [0,0,0], 
		 5] call ace_interact_menu_fnc_createAction;
		 ////
		 [_sourceObject, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
	 };
	 
	 case (_onOff == "OFF"):{
		_action =["RadioSwitch", 
		_locOff,
		 _paa, 
		 { 
			 _sourceObject = _this select 0;
			 [[_sourceObject],
				 {
				 params ["_sourceObject"];
				 _sound = (position _sourceObject) nearestObject "#soundonvehicle";
				 deleteVehicle _sound;
				 }
			 ] RemoteExec ["Spawn",[0,-2] select isDedicated,false];
			
			 _sourceObject say3D "MRH_radiochatter_radioclick";
			 _faction = _sourceObject getVariable "MRH_RadioChatter_Faction";
			 [_sourceObject,_faction] call MRH_fnc_RadioChatter;
			 [[_sourceObject,0,["ACE_MainActions","RadioSwitch"]],ace_interact_menu_fnc_removeActionFromObject] RemoteExec ["Call",[0,-2] select isDedicated,true];
			 [[_sourceObject,"ON"],MRH_fnc_RadioAceAction] RemoteExec ["Call",[0,-2] select isDedicated,true];
			 _sourceObject setVariable ["MRH_RadioChatter_RadioOn",false,true];
		 }, 
		 {true},
		 {},
		 [],
		 [0,0,0], 
		 5] call ace_interact_menu_fnc_createAction;
		 ////
		 [_sourceObject, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
	 };
 
	 
};