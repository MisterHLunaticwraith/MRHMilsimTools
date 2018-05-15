/*
this function adds a simple "Speak" ace interaction to a unit, message will be displayed in a message box with OK button in it.
action will be removed after dialog is completed
Parameters are
0 unit <OBJECT> object to addaction to
1 message <STRING> message to display
3 code to execute <CODE> optional, code to execute when dialog is opened code mus be between {}
4 space to execute code can be "LOCAL" or "GLOBAL" <STRING> optional, default "LOCAL" 
eg 
[this, "hello world"] call MRH_fnc_simpleAceMessage; 
or
[this, "Go fuck yourself I'm a killing machine",{player setDamage 0.5;},"LOCAL"] call MRH_fnc_simpleAceMessage;
PLEASE NOTE: 
-action will be removed GLOBALLY after dialogue is started
-this function is local, call it from init or initbox or remote exec call in MP midgame
-called code will be executed LOCALY by default or GLOBALLY if stated otherwise

*/
params ["_unit","_message","_code","_executionSpace"];

if (isNil "_code") then {_code = {};};
if (isNil "_executionSpace") then {_executionSpace = "LOCAL";};
_unit setVariable ["MRH_SimpleAceMessage", [_message,_code,_executionSpace]];

_statement = {
		_unit = _this select 0;
		_passedData = _unit getVariable "MRH_SimpleAceMessage";
		_message = _passedData select 0;
		_code = _passedData select 1;
		_executionSpace = _passedData select 2;
		//debug//systemChat format ["%1 %2 %3 %4 %5", str _unit, str _passedData, str _message, str _code, str _executionSpace];
		_message spawn {hintC  _this select 0;
				hintC_EH = findDisplay 57 displayAddEventHandler ["unload", {
			0 = _this spawn {
				_this select 0 displayRemoveEventHandler ["unload", hintC_EH];
				hintSilent "";
				
			};
		}];
		
		};


		[[_unit,0,["ACE_MainActions","Conversation"]],ace_interact_menu_fnc_removeActionFromObject] RemoteExec ["Call",0,true];
		if (_executionSpace == "GLOBAL")then {[[],_code] RemoteExec ["Spawn",0,true];} else {call _code};
};
_action =["Conversation", 
" Parler",
 "\MRHFunctions\img\speak.paa", 
 _statement, 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
