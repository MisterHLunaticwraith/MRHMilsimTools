//if (!isNull curatorCamera) ExitWith {};

#include "MRH_C_Path.hpp"

uiNamespace setVariable ["MRH_MilsimTools_ZeusInv_on",true];
//notify user that curator is detected
systemChat (localize "STR_MRH_ZEUS_Toggle_ToggledOn");
if ((vehicle player) != player) ExitWith {systemChat (localize "STR_MRH_ZEUS_Toggle_WarningVeh")};
_OrgPos = getPosATL player;
uiNamespace setVariable ["MRH_ACREcompatibleCuratorCam",_OrgPos];
// globaly hide && protect player
[[vehicle player],{params ["_curatorVeh"];_curatorVeh hideObjectGlobal true}] RemoteExec ["Call",2];
player enableSimulation false;
player allowDamage false;
//follow curator cam

_handle = [
	{

		_handle = (_this select 1);

		if ((!isNull curatorCamera) && (uiNamespace getVariable "MRH_MilsimTools_ZeusInv_on")) then {player setPosASL (getPosASL curatorCamera);} else { [_handle] FUNC(stopCuratorFollow);};

	
	}, 0, []
	
	] call CBA_fnc_addPerFrameHandler;

	_message = format ["Milsim Tools - Invisible curator PFEH added with handle %1",_handle];
	TRACE(_message);


