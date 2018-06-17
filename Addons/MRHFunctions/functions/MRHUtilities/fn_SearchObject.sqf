/*
This function adds an ace "search" action. Upon completion it creates a variable with the value "true" with given name
Params are: 
0 object, 
1 variable name STRING, 
2 text for what has been found

eg
[this, "objectFound","Un tournevis"] call MRH_fnc_SearchObject; // will create a GLOBAL variable objectFound upon search completion. And hint "vous avez trouvé: Un tournevis"
to make a "dummy search" just put the object parameter to call the function
eg
[this] call MRH_fnc_SearchObject; // will hint "Recherche terminée, vous n'avez rien trouvé." upon completion.

PLEASE NOTE: 
the action will be GLOBALLY removed from object upon completion.
this function is not global, if you don't call it from init box or init.sqf you will have to do a remote exec call.
*/
params ["_object","_varName","_foundThingName"];
if (isNil "_foundThingName") then {_varName = "DummySearch"} else {_object setVariable ["MRH_SearchObject_stringFoundThing", _foundThingName,true];};
_object setVariable ["MRH_SearchObjectReturnedVar",_varName, true];



_action =["Fouiller", 
(localize "STR_MRH_FC_AceActionPretty"),
 "\MRHFunctions\img\search.paa", 
 { 
 _object = _this select 0;
 _object say3D "MRH_sound_searching";
				_progress =
				[5, 
				[_object],
				{
				_object = (_this select 0) select 0;
				
				_FinalVar = _object getVariable "MRH_SearchObjectReturnedVar";
				if (_FinalVar == "DummySearch") then {hint (localize "STR_MRH_FC_HintNothingFound");} else {
				_string = _object getVariable "MRH_SearchObject_stringFoundThing";
				hint format [(localize "STR_MRH_FC_HintSmthingFound"), _string];
				missionNameSpace setVariable [_FinalVar,true,true];
				publicVariable _FinalVar;
				publicVariableServer _FinalVar;
				};
				 
				
				[_object,0,["ACE_MainActions","Fouiller"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
				
				},
				{hint (localize "STR_MRH_FC_SearchCanceled")},
				(localize "STR_MRH_FC_SearchInProgress")


				] call ace_common_fnc_progressBar;
				 
}, 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 



















/*



_object say3D "searching";
_progress =
[5, 
[],
{hint "Vous avez trouvé le code de l'ordinateur!"; [passedobject,0,["ACE_MainActions","Fouiller"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
execVM "missionscripts\laptopcodefoundinit.sqf";
},
{hint "Recherche annulée."},
"Vous êtes en train de fouiller l'objet."


] call ace_common_fnc_progressBar;
//[passedobject,0,["ACE_MainActions","Fouiller"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
*/