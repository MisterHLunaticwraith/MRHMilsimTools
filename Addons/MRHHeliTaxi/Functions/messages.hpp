//--evac request message
_evacMessage = {
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
playSound "MRH_HeliTaxi_Request";
_player sideChat format [localize "STR_MRH_HeliTaxi_RequestingEvac",([_LZ] CFUNC(realisticGrid)),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
sleep 4;
playSound "MRH_HeliTaxi_HeliEnRoute";
_myvec sideChat format [localize "STR_MRH_HeliTaxi_CopyEnRoute",([_LZ] CFUNC(realisticGrid)),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};
//-- heli destroyed
_destroyedMessage = {
params ["_player","_myvec"];
if ((group MRH_player) != (group _player)) ExitWith {};
playSound "MRH_HeliTaxi_ReaperDown";
[side _player, "HQ"] sideChat format [localize "STR_MRH_HeliTaxi_HeliDown",(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,([position _myvec] CFUNC(realisticGrid))];
};

//-- heli cancelled
_cancelledMessage = {
params ["_player","_myvec"];
if ((group MRH_player) != (group _player)) ExitWith {};
playSound "MRH_HeliTaxi_CancelT";
_player sideChat format [localize "STR_MRH_HeliTaxi_RequestCancel",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
sleep 4;
playSound "MRH_HeliTaxi_Cancelled";
_myvec sideChat format [localize "STR_MRH_HeliTaxi_ReceivedCancelRequest",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};

//-- arrived at set destination
_arrivedMessage = {
params ["_player","_myvec","_LZ"];
if !(MRH_player in _myvec) ExitWith {};
playSound "MRH_HeliTaxi_ThereGodSpeed";
_myvec sideChat format [localize "STR_MRH_HeliTaxi_WeReThereGodSpeed",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
sleep 3;
playSound "MRH_HeliTaxi_Thanks";

_player sideChat format [localize "STR_MRH_HeliTaxi_ThanksFlySafe",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};
//-- give pilot order to go
_goMessage ={
params ["_player","_myvec","_LZ"];
if !(MRH_player in _myvec) ExitWith {};
playSound "MRH_HeliTaxi_OkPilot";
_player sideChat format [localize "STR_MRH_HeliTaxi_GivePiloTCoord",([_LZ] CFUNC(realisticGrid)),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
sleep 2;
playSound "MRH_HeliTaxi_ReadyTakeOff";
_myvec sideChat format [localize "STR_MRH_HeliTaxi_CoordinatesReceived",([_LZ] CFUNC(realisticGrid)),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};
//-- reaching one mike mark
_oneMikeMessage ={
params ["_player","_myvec","_LZ"];
if !(MRH_player in _myvec) ExitWith {};

waitUntil {([_myvec,_LZ] call MRH_fnc_travelTimeEta) <= 60};
_dist = _LZ distance _myvec;
_dist = _dist /1000;
_dist = [_dist, 1] call BIS_fnc_cutDecimals;

playSound "MRH_HeliTaxi_ETA";
_vec sideChat format [localize "STR_MRH_HeliTaxi_ETAoneMike",str _dist,groupID group _vec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};
/*
//--------
_requestMedEvac =
{
	params ["_player","_myvec","_LZ"];
	_player sideChat format ["This is %2 Requesting MEDEVAC at %1.",([_LZ] CFUNC(realisticGrid)),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};
*/
//--------
_medEvacOnTheWay = {
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
_myvec sideChat format [localize "STR_MRH_HeliTaxi_medEvacEtaMessage",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
playSound "MRH_HeliTaxi_eta1M";
};
//--------
/*
_beadOnPos ={
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
sleep 6;
_myvec sideChat format ["This is %1 we've got eyes on your marker %2 ETA One Mike",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
playSound "MRH_HeliTaxi_markerSeen";
};
*/
//--------
_medEvacDestroyed = {
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
[side _player, "HQ"] sideChat format [localize "STR_MRH_HeliTaxi_medEvacMessageMedevacDestroyed",(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,([position _myvec] CFUNC(realisticGrid))];
playSound "MRH_HeliTaxi_medEvacDown";
};

//--------
_cancelMedEvac = {
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
_player sideChat format [localize "STR_MRH_HeliTaxi_medEvacMessageCancel",(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
playSound "MRH_HeliTaxi_cancelMedEvac";
};

//--------
_medEvacGoAndHeal = {
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
_player sideChat format [localize "STR_MRH_HeliTaxi_medEvacMessageBringSafe",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
playSound "MRH_HeliTaxi_goAndHeal";
};

//--------
_medevacOnWayBack = {
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
sleep 10;
_myvec sideChat format [localize "STR_MRH_HeliTaxi_medEvacMessageBringingGuysBack",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,([_LZ] CFUNC(realisticGrid))];
playSound "MRH_HeliTaxi_medEvacDropTroops";
};

_startFastRope = {
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
_myvec sideChat format [localize "STR_MRH_HeliTaxi_heliReadyFastRope",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,([_LZ] CFUNC(realisticGrid))];
playSound "MRH_HeliTaxi_fastRope";
};

_startHover = {
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
_myvec sideChat format [localize "STR_MRH_HeliTaxi_heliHoverMessage",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,([_LZ] CFUNC(realisticGrid))];
playSound "MRH_HeliTaxi_hovering";
};

_startLoiter = {
params ["_player","_myvec","_LZ"];
if ((group MRH_player) != (group _player)) ExitWith {};
_myvec sideChat format [localize "STR_MRH_HeliTaxi_heliLoiterPattern",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,([_LZ] CFUNC(realisticGrid))];
playSound "MRH_HeliTaxi_loiter";
};