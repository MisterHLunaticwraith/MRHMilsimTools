/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
_this spawn 
{
	params ["_scanner","_player","_code","_part"];

	_autoLock = _scanner getVariable ["MRH_ScannerSettings_autoLockNearestDoor",false];
	if !(_autoLock) exitWith {[_scanner,_player] spawn compile _code;};
	_condition = _scanner  getVariable ["MRH_ScannerSettings_conditionUnlock","true"];
	_condition = "params ['_scanner','_caller'];" + _condition;
	
	_Message = (localize "STR_MRH_MRHMiscItems_doorIsLockedMessage");
	_useEyeScan = _scanner getVariable ["MRH_BS_MustScanEyes", false];
	if (_useEyeScan) then 
	{
		_message = localize "STR_MRH_MRHMiscItems_requiresEyesMess";

		_condition = _condition + "&& (_scanner getVariable ['MRH_playerHasScannedEye',false])";
	};

	_useHandScan = _scanner getVariable ["MRH_BS_MustScanHand", false];
	if (_useHandScan) then 
	{
		_message = _message + (localize "STR_MRH_MRHMiscItems_requiresHandMess");

		_condition = _condition + "&& (_scanner getVariable ['MRH_playerHasScannedHand',false])";
	};


	_hasBeenHacked = (getPlayerUID _player) in (_scanner getVariable ["MRH_scanner_hasBeenHackedBy",[]]);
	if (_hasBeenHacked) then {_condition = "true"};
	
	_condition = [_scanner,_player] call compile _condition;
	if (typeName _condition != "BOOL") exitWith {
	systemChat "MRH_MilsimTool_scanner Error: condition code doesn't return a boolean value";
												};
	private "_building";
	_bldStr = _scanner getVariable ["MRH_ScannerSettings_controlledBuilding","<NULL-object>"];
	if (_bldStr != "<NULL-object>") then {_building = call compile _bldStr} else {_building = nearestBuilding _scanner;};

	_doorNumber = [_scanner,_building] CFUNC(nearestDoorNumber);
	switch (true) do {
		case (_part == "main") : 
		{
			if (_condition) then 
			{
				
				if !([_building,_doorNumber]CFUNC(isLockedDoor))then 
				{
					[_scanner] spawn {params ["_scanner"]; playSound3D ["MRHMiscItems\Sounds\MRH_DOOR_DoorLocked.ogg",_scanner];};
				}
				else
				{
					[_scanner] spawn 
					{
					params ["_scanner"];
					_orgText = (getObjectTextures _scanner) select 0;
					_scanner setObjectTextureGlobal [0,"\MRHMiscItems\paa\accessGranted.paa"];
					playSound3D ["MRHMiscItems\Sounds\MRH_DOOR_AccessGranted.ogg",_scanner];
					sleep 5;
					_scanner setObjectTextureGlobal [0,_orgText];
					};
				};
				[_building,_doorNumber] CFUNC(toggleDoorState);
				[_scanner,_player] spawn compile _code;

			} else
			{
				hintC _Message;
				[_scanner] spawn 
					{
					params ["_scanner"];
					_orgText = (getObjectTextures _scanner) select 0;
					_scanner setObjectTextureGlobal [0,"\MRHMiscItems\paa\accessDenied.paa"];
					playSound3D ["MRHMiscItems\Sounds\MRH_DOOR_accessDenied.ogg",_scanner];
					sleep 5;
					_scanner setObjectTextureGlobal [0,_orgText];
					};
			};
		};
		case (_part == "hand") : {[_scanner,_player] spawn compile _code;};
		case (_part =="eye") : {[_scanner,_player] spawn compile _code;};
	};
if (!_condition && !([_building,_doorNumber]CFUNC(isLockedDoor)))then 
				{
					[_scanner] spawn {params ["_scanner"]; playSound3D ["MRHMiscItems\Sounds\MRH_DOOR_DoorLocked.ogg",_scanner];};
					[_building,_doorNumber] CFUNC(toggleDoorState);
				};
};