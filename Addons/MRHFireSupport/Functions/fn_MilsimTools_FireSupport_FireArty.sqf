/*
Function name:MRH_fnc_MilsimTools_FireSupport_FireArty
Author: Mr H.
Description: Fires artillery with parameters provided in the interface
Return value: None
Public:No
Parameters:None
Example(s):
[] spawn MRH_fnc_MilsimTools_FireSupport_FireArty

*/
#include "MRH_C_Path.hpp"
_availableShots = missionNamespace getVariable ["MRH_FireSupport_NumberOfAvailableArtilleryShots" + (str side player),10]; //temporary do 0 after settings
_requestTedNumberOfShots = parseNumber (lbData [2100,lbcursel 2100]);
if (_requestTedNumberOfShots > _availableShots) ExitWith {systemchat localize "STR_MRH_FireSupport_NoArtyLeft"};
_leftShotsNew = _availableShots - _requestTedNumberOfShots;
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableArtilleryShots" + (str side player),_leftShotsNew,true];

_typeOfAmmo = lbData [2101,lbcursel 2101];

//_typeOfAmmo = "6Rnd_155mm_Mo_smoke";
//systemChat _typeOfAmmo;

_requestedPos = ctrlText 1400;
_ctrl = FDIS(1400);

_isValid = [_requestedPos] FUNC(checkGridValidity);
if !(_isValid) ExitWith {systemChat format [localize "STR_MRH_FireSupport_SC_Bad_coord",_requestedPos];};
player setVariable ["MRH_FireSupport_PreviouslyEnteredGridRef",_requestedPos];
_requestedPosFormated = [_requestedPos] FUNC(ParseCoordinates);
_radius = 10; //to improve
_delay = random [1,5,8];  
/*
delay: Array or Number - Delay between rounds.

    Array
        1: min delay
        2: max delay
    Number - Precise delay
*/

_conditionEnd = {};
_safeZone = random [0,0.5,1];  
/*
safezone: Number - (Optional, default ?) Safezone radius - minimal distance from the target position where shells may be directed at
*/

_alt = 250;
/*
alt: Number - (Optional, default 250) Altitude where the shell will be created
*/
_speed = 15;

/*
speed: Number - (Optional, default 150) Descending velocity, in m/s. Default is 150, if you use flare as ammo, set it to lower value (1-5) to let it fall down slowly

*/

_sounds = ["MRH_FireSupport_Incoming_1","MRH_FireSupport_Incoming_2","MRH_FireSupport_Incoming_3","MRH_FireSupport_Incoming_4","MRH_FireSupport_Incoming_5","MRH_FireSupport_Incoming_6","MRH_FireSupport_Incoming_7","MRH_FireSupport_Incoming_8"];

/*
sounds: Array of strings - (Optional, default []) Ssounds to be played on the incoming shell

*/
closeDialog 0;
_ETA = random [30,40,60]; 

_slowAmmo = ["rhs_ammo_m314_ilum","Flare_82mm_AMOS_White","rhsusf_40mm_white"];
if (_typeOfAmmo in _slowAmmo) then {_speed = 0.001; _alt = 150; _typeOfAmmo = "F_40mm_White";};

[[player,_ETA,_requestedPosFormated,_requestTedNumberOfShots],{
		params ["_player","_ETA","_LZ","_requestTedNumberOfShots"];
		_ETA = [_ETA, 0] call BIS_fnc_cutDecimals;
		
		if ((group player) != (group _player)) ExitWith {};
		//playSound "";
	_player sideChat format [localize "STR_MRH_FireSupport_RequestArtyDialog1",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),str _requestTedNumberOfShots,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	sleep 4;
		//playSound "MRH_HeliTaxi_HeliEnRoute";
		leader group player directSay "mp_groundsupport_45_artillery_BHQ_2";
	[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_RequestArtyDialog2",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),_ETA,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,str _requestTedNumberOfShots];
	}] RemoteExec ["Spawn", [-2,0] select isServer];

sleep _ETA;
[[player,_ETA,_requestedPosFormated,_requestTedNumberOfShots],{
		params ["_player","_ETA","_LZ","_requestTedNumberOfShots"];
		if ((group player) != (group _player)) ExitWith {};
		//playSound "MRH_HeliTaxi_HeliEnRoute";
		leader group player directSay "mp_groundsupport_45_artillery_BHQ_1";
	[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_RequestArtyDialog3",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),_ETA,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0,str _requestTedNumberOfShots];
	}] RemoteExec ["Spawn", [-2,0] select isServer];
_fireOrder = [_requestedPosFormated,_typeOfAmmo,_radius,_requestTedNumberOfShots,_delay,_conditionEnd,_safezone,_alt,_speed,_sounds] spawn BIS_fnc_fireSupportVirtual;
