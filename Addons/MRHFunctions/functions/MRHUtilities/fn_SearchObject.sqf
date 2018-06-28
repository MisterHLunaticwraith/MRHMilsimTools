/*
Function name:MRH_fnc_SearchObject;
Author: Mr H.
Description: This function adds an ace "search" action to given object. Upon completion it creates a variable with the value "true" with given name and can execute some code, the action will be removed from object. Run with only one parameter will create an unsuccessful search.
Return value: None
Public: Yes
Parameters:
0- <OBJECT> - Object to add the action two. If only this parameter is set the search will be unsuccessful.
1 - <STRING> - Optional - Variable name, a public variable with this name will be created, can be used to activate a trigger.
2 -<STRING> - Optional or Mandatory if parameter 1 is defined, name of the thing that was found, will be displayed in a hint to inform the player they have found something.
3 - <CODE> - Optional, code to execute when search is complete, source object is passed as a parameter.
Example(s):
[this, "objectFound","A screwdriver"] call MRH_fnc_SearchObject; // will create a GLOBAL variable objectFound upon search completion. And hint "You have found: A screwdriver"
or
[this, "intelFound","A top secret file",{deleteVehicle (_this select 0);}] call MRH_fnc_SearchObject; // will remove the object after use

to make a "dummy search" just put the object parameter to call the function
eg
[this] call MRH_fnc_SearchObject; // will hint "Search over, you haven't found anything" upon completion.
*/

params ["_object","_varName","_foundThingName","_code"];
if (isNil "_foundThingName") then {_varName = "DummySearch"} else {_object setVariable ["MRH_SearchObject_stringFoundThing", _foundThingName,true];};
if (isNil "_code") then {_code = {};};
_object setVariable ["MRH_SearchObjectReturnedVar",_varName, true];
_object setVariable ["MRH_SearchObjectCodeToRun",_code,true];



_action =["MRH_SearchObj_Fouiller", 
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
				 
				_code = _object getVariable "MRH_SearchObjectCodeToRun";
				[_object,0,["ACE_MainActions","MRH_SearchObj_Fouiller"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
				[_object] spawn _code;
				
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