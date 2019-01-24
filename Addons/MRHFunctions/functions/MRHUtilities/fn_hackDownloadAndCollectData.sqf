/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[this] call MRH_fnc_hackDownloadAndCollectData;
or
[this,10,10,["dataEntry1"],["pic1"]] call MRH_fnc_hackDownloadAndCollectData;
*/
#include "MRH_C_Path.hpp"
params ["_object",["_hackDuration",10],["_fileSize",10],["_dataToAttribute",[]],["_picturesToAttribute",[]]];

_parameters = [_fileSize,_dataToAttribute,_picturesToAttribute,_isDataTerminal];
_object setVariable ["MRH_hackDownloadAndAttribute_parameters",_parameters,true];

_statement = 
{
	_object = _this select 0;
	[[_object],{
		params ["_object"];
	(_object getVariable "MRH_hackDownloadAndAttribute_parameters") params ["_fileSize","_dataToAttribute","_picturesToAttribute"];
	_isDataTerminal = false;
	if (typeOf _object == "Land_DataTerminal_01_F") then {_isDataTerminal = true};
	if (_isDataTerminal) then {[_object] call MRH_fnc_dataTerminalAnimate};
	
		
		[_fileSize,_object,"MRH_GenericDownload",
			
			{
				_object = _this select 0;
				(_object getVariable "MRH_hackDownloadAndAttribute_parameters") params ["_fileSize","_dataToAttribute","_picturesToAttribute"];
				if !(_dataToAttribute isEqualTo []) then {[player,_dataToAttribute]call MRH_fnc_MilsimTools_SoldierTab_attributeData;};
				if !(_picturesToAttribute isEqualTo []) then {[player,_picturesToAttribute]call MRH_fnc_MilsimTools_SoldierTab_attributePictures;};
				
			
			}
		] call MRH_fnc_DownloadFile;



	}] remoteExec ["Call",0,true];
};

[_hackDuration,_object,"MRH_GenericHack",_statement] call MRH_fnc_Hack; // will delete the source object and damage the player