/*
Function name: cbakeys
Author: Mr H.
Description: Defines cba keys and actions
Return value: None
Public: No
Parameters:None
Example(s):
this function is called at preinit by cba pre init event handlers
*/

#include "\a3\editor_f\Data\Scripts\dikCodes.h"
_statementTurnLeft =
	{_cam = player getVariable "MRH_FiberScopeCam"; 
	if (isNil "_cam") ExitWith {};
	if (isNull _cam) exitWith {};
	_cam setDir ((getDir _cam) -4);
	_soundlist = ["MRH_Chafing1","MRH_Chafing2","MRH_Chafing3","MRH_Chafing4","MRH_Chafing5"];
	playsound (selectRandom _soundlist);
	};

_statementTurnRight =
	{_cam = player getVariable "MRH_FiberScopeCam"; 
	if (isNil "_cam") ExitWith {};
	if (isNull _cam) exitWith {};
	_cam setDir ((getDir _cam) +4);
	_soundlist = ["MRH_Chafing1","MRH_Chafing2","MRH_Chafing3","MRH_Chafing4","MRH_Chafing5"];
	playsound (selectRandom _soundlist);
	};
	
_statementToggleNvgs =
	{_cam = player getVariable "MRH_FiberScopeCam"; 
	if (isNil "_cam") ExitWith {};
	if (isNull _cam) exitWith {};
	_toggleStatus = player getVariable "MRH_FiberScopeCamNVGs";
	if(isNil "_toggleStatus") then {_toggleStatus = true;};
	if (_toggleStatus) then {_toggleStatus = false; camUseNVG true;} else { _toggleStatus = true; camUseNVG false;};
	playsound "MRH_NV";								
	player setVariable ["MRH_FiberScopeCamNVGs", _toggleStatus];
	};
	
_statementExitFS =
{
	_cam = player getVariable "MRH_FiberScopeCam"; 
	if (isNil "_cam") ExitWith {};
	if (isNull _cam) exitWith {};
	call MRH_fnc_FiberScopeClose;
};

_leftKey = localize "STR_MRH_FS_TURNLEFT";
_leftKeyToolTip = localize "STR_MRH_FS_TURNLEFT_TOOLTIP";
_rightKey = localize "STR_MRH_FS_TURNRIGHT";
_rightKeyTooltip = localize "STR_MRH_FS_TURNRIGHT_TOOLTIP";
_toggleKey = localize "STR_MRH_FS_TOGGLENVG";
_toggleKeyTooltip = localize "STR_MRH_FS_TOGGLENVG_TOOLTIP";
_exitKey = localize "STR_MRH_FS_EXITCAM";
_exitKeyTooltip = localize "STR_MRH_FS_EXITCAM_TOOLTIP";


["MRHFiberScope", "MRHFSKeyLeft",[_leftKey, _leftKeyToolTip],_statementTurnLeft,{},[DIK_A, [false, false, false]]] call CBA_fnc_addKeybind;
["MRHFiberScope", "MRHFSKeyRight",[_rightKey, _rightKeyTooltip],_statementTurnRight,{},[DIK_E, [false, false, false]]] call CBA_fnc_addKeybind;
["MRHFiberScope", "MRHFSToggleNV",[_toggleKey, _toggleKeyTooltip],_statementToggleNvgs,{},[DIK_N, [false, false, false]]] call CBA_fnc_addKeybind;
["MRHFiberScope", "MRHFSClose",[_exitKey, _exitKeyTooltip],_statementExitFS,{},[DIK_S, [false, false, false]]] call CBA_fnc_addKeybind;