/*
Function name:MRH_fnc_VipSurrender
Author: Mr H.
Description: This function makes a unit surrender when a player comes near enough. Trigger is attached to the unit so this will work even on moving units, trigger is 2 meters high, so if the unit is on the upper floor of a building players will need to reach the same height. Triggers are created globaly, therefore the code will be called globally. Unit (parameter 0) is passed to the code.
Return value: None
Public: Yes
Parameters:
0 - <OBJECT> - Unit that will surrender
1 - <NUMBER> - Distance from the unit under which they will surrender
3 - <STRING> - Message to display when unit is captured, will be displayed in global chat, said by the unit.
4 - <CODE> -Optional code to execute, _unit is passed as a parameter, code must be stated between {}
Example(s):
[this,5,"I surrender!"] call MRH_fnc_VipSurrender;
or
[this,10,"I will never surrender!", {(_this select 0) setDamage 1; hint str _this;}] call MRH_fnc_VipSurrender;
*/


params ["_unit","_diameter","_message","_code"];
_diameter = _diameter /2;

_trg = createTrigger ["EmptyDetector", getPosASL _unit];
if (isNil "_code") then {_code ={};};
missionNamespace setVariable ["MRH_Strigger_" + (str _trg),[_unit,_message, _code], true];


_trg setTriggerArea [_diameter, _diameter, 0, false,2];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trg attachTo [_unit,[0,0,0]];
_trg setTriggerStatements ["this", 
"
_data = missionNameSpace getVariable ('MRH_Strigger_' + str thisTrigger);
_unit = _data select 0;
_message = _data select 1;
_code = _data select 2;
_unit setCaptive true;
_unit playMove 'ApanPknlMstpSnonWnonDnon_G03';
_unit globalChat _message;
[_unit] spawn _code;
"
, ""];