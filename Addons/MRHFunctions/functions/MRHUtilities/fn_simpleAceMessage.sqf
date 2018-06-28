/*
Function name:MRH_fnc_MRH_fnc_simpleAceMessage;
Author: Mr H.
Description: this function adds a simple "Speak" ace interaction to a unit, message will be displayed in a message box with OK button in it.
action will be removed after dialog is completed
Return value: None
Public: Yes
0 - <OBJECT> - unit to add the speak action to.
1 - <STRING> - Message to display
2 - <CODE> -Optional - Code to execute, code is run directly when message is displayed, parameter 0 (unit) is passed to the code and can be retrieved. Must be stated between {}
3 - <STRING> -Optional - space to execute code can be "LOCAL" or "GLOBAL" <STRING>, default "LOCAL", if global code will be remote executed.
4- <BOOLEAN> - Optional - Remove action after use, will remove the ACE3 action after use. Default: true.
Parameters:
Example(s):
[this, "hello world"] call MRH_fnc_simpleAceMessage; 
or
[this, "Go fuck yourself I'm a killing machine",{player setDamage 0.5;},"LOCAL"] call MRH_fnc_simpleAceMessage;
or
[this, "Move on soldier!",{},"LOCAL",false] call MRH_fnc_simpleAceMessage;
or
_statement = {_unit = _this select 0; sleep 3; _unit playMove "AmovPercMstpSnonWnonDnon_exerciseKata"; if ((player distance _unit) < 2) then {player setDamage 0.5};};

[this, "So you want to fight with me eh?", _statement,"GLOBAL",false] call MRH_fnc_simpleAceMessage;
*/

params ["_unit","_message","_code","_executionSpace","_removeAfterUse"];

if (isNil "_code") then {_code = {};};
if (isNil "_executionSpace") then {_executionSpace = "LOCAL";};
if (isNil "_removeAfterUse") then {_removeAfterUse = true};
_unit setVariable ["MRH_SimpleAceMessage", [_message,_code,_executionSpace,_removeAfterUse]];

_statement = {
		_unit = _this select 0;
		_passedData = _unit getVariable "MRH_SimpleAceMessage";
		_message = _passedData select 0;
		_code = _passedData select 1;
		_executionSpace = _passedData select 2;
		_removeAfterUse = _passedData select 3;
		//debug//systemChat format ["%1 %2 %3 %4 %5", str _unit, str _passedData, str _message, str _code, str _executionSpace];
		_message spawn {hintC  _this select 0;
				hintC_EH = findDisplay 57 displayAddEventHandler ["unload", {
			0 = _this spawn {
				_this select 0 displayRemoveEventHandler ["unload", hintC_EH];
				hintSilent "";
				
			};
		}];
		
		};

		if (_removeAfterUse) then
		{
			[[_unit,0,["ACE_MainActions","Conversation"]],ace_interact_menu_fnc_removeActionFromObject] RemoteExec ["Call",0,true];
		};
		if (_executionSpace == "GLOBAL")then {[[_unit],_code] RemoteExec ["Spawn",0,true];} else {[_unit] spawn _code};
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
