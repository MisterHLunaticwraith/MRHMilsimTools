/*
Function name:MRH_fnc_ambientConversation
Author: Mr H.
Description: Will display a conversation message for the provided time at center of the screen, with provided message
Return value:
Public: yes
Parameters:
0- <OBJECT> unit that simpleTasks
1 - <STRING> message, the message that will be displayAddEventHandler
2- <NUMBER> duration the message will stay on screen - Optional default 5
3- <NUMBER> distance in meters the player has to be from the unit to receive the message - optional default 10
4- <CODE> code to spawn when the conversation is over - optional
5 - <ARRAY> parameters to pass to the code /!\ parameter 0, will always be pushed in front of your custom set parameters so if you input ["parameter1"], in the code it will be _this select 1 and not _this select 0, _this select 0 will always be the unitAddons -optional
6-<STRING> sound to say3d (classname defined in cfgSounds) the unit will say this sound when conv starts. -optional, default No sound

Example(s):
[dummy,"hey buddy",5,5,{systemchat str _this},["param1","param2"],"heybuddysound"]call MRH_fnc_ambientConversation;
*/
#include "MRH_C_Path.hpp"
if !(hasInterface) exitWith {};
_this spawn {
params ["_unit","_message",["_duration",5],["_hearingDistance",10],["_codeToSpawn",{}],["_codeToSpawnParams",[]],["_soundToSay",""]];
disableSerialization;
if !(alive _unit) exitWith {};
if ((player distance _unit) > _hearingDistance) exitWith {};
240119 cutRsc ["MRHEventConvSystem", "PLAIN"];
_display = uiNamespace getVariable "MRHEventConvSystem";
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_textZone = CTRLF(1100);
_picZone = CTRLF(1201);
if !(_soundToSay isEqualTo "") then {_unit say3D _soundToSay};
_name= "<t font = 'PuristaLight'><t size = '0.7'><t color = '#ba2f01'>" + name _unit +" " +  (localize "STR_MRH_FC_DIALOGSAYS")+"</t><br/>";
_textZone ctrlSetStructuredText parseText (_name + "<t color = '#4286f4'>" + _message + "</t>");

	_camMRHRoster = "camera" camCreate (_unit modelToWorld [0,0.7,1.7]);
		_camMRHRoster attachTo [_unit, [0,0.4,1.7]];
		_camMRHRoster camSetTarget _unit;
		_camMRHRoster cameraEffect ["internal", "BACK"];
		_camMRHRoster camCommit 0;
		_camMRHRoster cameraEffect ["internal","back","rtt"]; 
		"rtt" setPiPEffect [([0,1] select (call MRH_fnc_MilsimTools_Core_isNight))]; 
		_picZone ctrlSetText "#(argb,512,512,1)r2t(rtt,1.0)";
		 _unit setRandomLip true;

_codeToSpawnParamsFinal = [_unit];
_codeToSpawnParamsFinal append _codeToSpawnParams;
sleep _duration;
_unit setRandomLip false;
_codeToSpawnParamsFinal spawn _codeToSpawn;
_display closedisplay 2
};