/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_handleMessages;
Author: Mr H.
Return value: 
Public:
Parameters:
0 - <OBJECT> - Helicopter
1 - <STRING> -message type, can Be "Request", "Destroyed","Cancelled","Arrived","Go" or "OneMike"
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_handleMessages;
*/
#include "MRH_C_Path.hpp"
#include "messages.hpp"

params ["_myvec","_messageType",["_LZ",[]],["_player",objNull]];

if (_LZ isEqualTo []) then {_LZ = _myvec GVAR(userSetDestination);};
if (isNull _player) then {_player = _myvec GVAR(caller);};
Diag_log format ["MRH_MilsimTools_HeliTaxi_%1 will say the message",_player];
_message = "";
switch (true) do {
	case (_messageType == "Request"): {_message = _evacMessage};
	case (_messageType == "Destroyed"): {_message = _destroyedMessage};
	case (_messageType == "Cancelled"): {_message = _cancelledMessage};
	case (_messageType == "Arrived"): {_message = _arrivedMessage};
	case (_messageType == "Go"): {_message =_goMessage};
	case (_messageType == "OneMike"): {_message =_oneMikeMessage};
	//case (_messageType == "RequestMEDEVAC"): {_message =_requestMedEvac};
	case (_messageType == "MedEvacOnTheWay"): {_message =_medEvacOnTheWay};
	case (_messageType == "MedEvacDestroyed"): {_message =_medEvacDestroyed};
	case (_messageType == "CancelMedEvac"): {_message =_cancelMedEvac};
	case (_messageType == "MedEvacGoAndHeal"): {_message =_medEvacGoAndHeal};
	case (_messageType == "MedEvacBack"): {_message = _medevacOnWayBack};
	case (_messageType == "Fastrope"): {_message =_startFastRope};
	case (_messageType == "Hovering"): {_message =_startHover};
	case (_messageType == "Loiter"): {_message = _startLoiter};
	
	//case (_messageType == ""): {_message =};

};
[[_player,_myvec,_LZ],_message] RemoteExec ["Spawn", [0,-2] select isDedicated];