/*
this function makes a unit surrender when a player comes near enough
parameters:
0 unit <OBJECT> unit that will surrender
1 diameter <NUMBER> diameter around the unit where the player need to get to make it surrender
2 surrender message <STRING> message the unit will say in globalchat when when they surrender
3 code to execute  <CODE> code to execute, _unit is passed as a parameter, code mus be stated between {}
eg
[this,5,"Je me rends"] call MRH_fnc_VipSurrender;
or
[this,5,"Je me rends", {_this setDamage 1; hint str _this;}] call MRH_fnc_VipSurrender;
or
[this,5,"Je me rends", {[_this] execVM "yourscript.sqf";}] call MRH_fnc_VipSurrender;

PLEASE NOTE: trigger is attached to the unit so this will work even on moving units, trigger is 2 meters high, so if the unit is on the upper floor of a building players will need to reach the same height
PLEASE NOTE: triggers are created globaly, therefore the code will be called globally. Code is called so it can't contain suspension (eg sleep), to use supension execute another script from code
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
_unit call _code;
"
, ""];