/*
Function name: MRH_fnc_FiberScopeCreate
Author: Mr H.
Description: opens the fiberscope display, checks if the position is facing a door or a window then closes it. Disables player simulation
Return value:None
Public:No
Parameters:None
Example(s):
call MRH_fnc_FiberScopeCreate;
*/


disableSerialization;
_localizeErrorMess = localize "STR_MRH_FS_NOCANDOMESSAGE";
11042018 cutRsc ["MRHFiberScope", "PLAIN"]; 
_display = uiNamespace getVariable "MRHFiberscope";

_selectionPos = player selectionPosition "rightfoot";
_selectionPosAdv = [(_selectionPos select 0),(_selectionPos select 1)+1.5, (_selectionPos select 2)+0.5];///afinir
_spos = player modelToWorld _selectionPos;
_fpos = player modelToWorld _selectionPosAdv;
_cam = "camera" camCreate _fpos;
_cam cameraEffect ["INTERNAL", "BACK"];
showCinemaBorder false;
_cam setDir (getDir player);
_cam camSetFov 5;
player setVariable ["MRH_FiberScopeCam", _cam];
//myrope = ropeCreate [_cam, [0,0,0] ,player, "proxy:\a3\characters_f\proxies\weapon.001",5]; 
//_cable = ropeCreate [player, "rightfoot", objNull, [0,0,0], 1];
player switchMove "AinvPknlMstpSrasWrflDnon_G01";
player enableSimulation false;
/////////////////
    	_begPos = positionCameraToWorld [0,0,0];
    	_begPosASL = AGLToASL _begPos;
    	_endPos = positionCameraToWorld [0,0,1];
    	_endPosASL = AGLToASL _endPos;
    	_ins = lineIntersectsSurfaces [_begPosASL, _endPosASL, player, objNull, true, 1, "FIRE", "NONE"];
    	if (_ins isEqualTo []) exitWith {systemchat _localizeErrorMess; call MRH_fnc_FiberScopeClose; playsound "MRH_ErrorBip";};
    	_ins select 0 params ["_pos", "_norm", "_obj", "_parent"];
    	if !(getModelInfo _parent select 2) exitWith {systemchat _localizeErrorMess; call MRH_fnc_FiberScopeClose; playsound "MRH_ErrorBip";};
    	_ins2 = [_parent, "FIRE"] intersect [_begPos, _endPos];
    	if (_ins2 isEqualTo []) exitWith {systemchat _localizeErrorMess; call MRH_fnc_FiberScopeClose; playsound "MRH_ErrorBip";};
    	_ins2 select 0 params ["_name", "_dist"];
    	_posASL = _begPosASL vectorAdd ((_begPosASL vectorFromTo _endPosASL) vectorMultiply _dist);
		if (isNil "_name") ExitWith {systemchat _localizeErrorMess; call MRH_fnc_FiberScopeClose; playsound "MRH_ErrorBip";};