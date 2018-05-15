params ["_sourceObject", "_OnOff"];
_paa = "\MRHRadioChatter\radio.paa";

switch (true) do 
{
	case (_onOff == "ON"):{
		_action =["RadioSwitch", 
		"Allumer la radio",
		 _paa,
		 { 
		 _sourceObject = _this select 0;
		 _sourceObject say3D "MRH_radiochatter_radioclick";
		 _faction = _sourceObject getVariable "MRH_RadioChatter_Faction";
		 [_sourceObject,_faction] call MRH_fnc_RadioChatter;
		 [[_sourceObject,0,["ACE_MainActions","RadioSwitch"]],ace_interact_menu_fnc_removeActionFromObject] RemoteExec ["Call",0,true];
		 [[_sourceObject,"OFF"],MRH_fnc_RadioAceAction] RemoteExec ["Call",0,true];
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
		"Eteindre la radio",
		 _paa, 
		 { 
		 _sourceObject = _this select 0;
		 _sound = (position _sourceObject) nearestObject "#soundonvehicle";
		 
         deleteVehicle _sound; 
		 _sourceObject say3D "MRH_radiochatter_radioclick";
		 _faction = _sourceObject getVariable "MRH_RadioChatter_Faction";
		 [_sourceObject,_faction] call MRH_fnc_RadioChatter;
		 [[_sourceObject,0,["ACE_MainActions","RadioSwitch"]],ace_interact_menu_fnc_removeActionFromObject] RemoteExec ["Call",0,true];
		 [[_sourceObject,"ON"],MRH_fnc_RadioAceAction] RemoteExec ["Call",0,true];
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