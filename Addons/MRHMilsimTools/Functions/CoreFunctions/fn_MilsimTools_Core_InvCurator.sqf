//if (!isNull curatorCamera) ExitWith {};


[] Spawn {
player setVariable ["MRH_MilsimTools_ZeusInv_on",true];
//notify user that curator is detected
systemChat (localize "STR_MRH_ZEUS_Toggle_ToggledOn");
if ((vehicle player) != player) ExitWith {systemChat (localize "STR_MRH_ZEUS_Toggle_WarningVeh")};
_OrgPos = getPosATL player;
player setVariable ["MRH_ACREcompatibleCuratorCam",_OrgPos];
// globaly hide && protect player
[[vehicle player],{params ["_curatorVeh"];_curatorVeh hideObjectGlobal true}] RemoteExec ["Call",2];
player enableSimulation false;
player allowDamage false;
//follow curator cam
while {(!isNull curatorCamera) && (player getVariable "MRH_MilsimTools_ZeusInv_on")} do {
player setPosASL (getPosASL curatorCamera);
sleep 2;
};
//restore everything back
player setVelocity [0,0,0];
_pos = player getVariable "MRH_ACREcompatibleCuratorCam";
player setPosATL _pos;
[[vehicle player],{params ["_curatorVeh"];_curatorVeh hideObjectGlobal false}] RemoteExec ["Call",2];
player enableSimulation true;
player allowDamage true;
systemChat (localize "STR_MRH_ZEUS_Toggle_ToggledOff");
};
