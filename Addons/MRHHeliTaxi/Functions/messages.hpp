//--evac request message
_evacMessage = {
params ["_player","_myvec","_LZ"];
if ((group player) != (group _player)) ExitWith {};
playSound "MRH_HeliTaxi_Request";
_player sideChat format [localize "STR_MRH_HeliTaxi_RequestingEvac",([_LZ] CFUNC(realisticGrid)),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
sleep 4;
playSound "MRH_HeliTaxi_HeliEnRoute";
_myvec sideChat format [localize "STR_MRH_HeliTaxi_CopyEnRoute",([_LZ] CFUNC(realisticGrid)),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};
//-- heli destroyed
_destroyedMessage = {
params ["_player","_myvec"];
if ((group player) != (group _player)) ExitWith {};
playSound "MRH_HeliTaxi_ReaperDown";
[side _player, "HQ"] sideChat format [localize "STR_MRH_HeliTaxi_HeliDown",(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,([position _myvec] CFUNC(realisticGrid))];
};

//-- heli cancelled
_cancelledMessage = {
params ["_player","_myvec"];
if ((group player) != (group _player)) ExitWith {};
playSound "MRH_HeliTaxi_CancelT";
_player sideChat format [localize "STR_MRH_HeliTaxi_RequestCancel",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
sleep 4;
playSound "MRH_HeliTaxi_Cancelled";
_myvec sideChat format [localize "STR_MRH_HeliTaxi_ReceivedCancelRequest",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};

//-- arrived at set destination
_arrivedMessage = {
params ["_player","_myvec","_LZ"];
if !(player in _myvec) ExitWith {};
playSound "MRH_HeliTaxi_ThereGodSpeed";
_myvec sideChat format [localize "STR_MRH_HeliTaxi_WeReThereGodSpeed",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
sleep 3;
playSound "MRH_HeliTaxi_Thanks";

_player sideChat format [localize "STR_MRH_HeliTaxi_ThanksFlySafe",groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};
//-- give pilot order to go
_goMessage ={
params ["_player","_myvec","_LZ"];
if !(player in _myvec) ExitWith {};
playSound "MRH_HeliTaxi_OkPilot";
_player sideChat format [localize "STR_MRH_HeliTaxi_GivePiloTCoord",([_LZ] CFUNC(realisticGrid)),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
sleep 2;
playSound "MRH_HeliTaxi_ReadyTakeOff";
_myvec sideChat format [localize "STR_MRH_HeliTaxi_CoordinatesReceived",([_LZ] CFUNC(realisticGrid)),groupID group _myvec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};
//-- reaching one mike mark
_oneMikeMessage ={
params ["_player","_myvec","_LZ"];
if !(player in _vec) ExitWith {};

waitUntil {([_myvec,_LZ] call MRH_fnc_travelTimeEta) <= 60};
_dist = _LZ distance _myvec;
_dist = _dist /1000;
_dist = [_dist, 1] call BIS_fnc_cutDecimals;

playSound "MRH_HeliTaxi_ETA";
_vec sideChat format [localize "STR_MRH_HeliTaxi_ETAoneMike",str _dist,groupID group _vec,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};