/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_

*/
#include "MRH_C_Path.hpp"
_availability = missionNamespace getVariable ["MRH_FireSupport_isAvailableCASfor_"+ (str side player),true];
if !(_availability) ExitWith {systemChat "A CAS mission is already running please try later"};
_availableCAS = missionNamespace getVariable ["MRH_FireSupport_NumberOfAvailableCAS" + (str side player),10]; //temporary do 0 after settings

if (_availableCAS < 1) ExitWith {systemchat "Not enough artillery CAS support left"};


_vehicle = lbData [2100,lbcursel 2100];
_typeOfAttack = lbData [2101,lbcursel 2101];
_typeOfAttack = parseNumber _typeOfAttack;
_requestedPos = ctrlText 1400;
//-----------the following snippet was borrowed from the module and modified, original author not mentionned in the originale file but all credit for this snipet is theirs
	_weaponTypes = switch _typeOfAttack do {
		case 0: {["machinegun"]};
		case 1: {["missilelauncher"]};
		case 2: {["machinegun","missilelauncher"]};
		case 3: {["bomblauncher"]};
		default {[]};
	};
	_weapons = [];
	{
		if (tolower ((_x call bis_fnc_itemType) select 1) in _weaponTypes) then {
			_modes = getarray (configfile >> "cfgweapons" >> _x >> "modes");
			if (count _modes > 0) then {
				_mode = _modes select 0;
				if (_mode == "this") then {_mode = _x;};
				_weapons set [count _weapons,[_x,_mode]];
			};
		};
	} foreach (_vehicle call bis_fnc_weaponsEntityType);//getarray (_planeCfg >> "weapons");
	if (count _weapons == 0) exitwith {systemchat format ["The selected aircraft cannot perform the selected type of attack, please select another type.",_vehicle,_weaponTypes];};
//----------
missionNamespace setVariable ["MRH_FireSupport_isAvailableCASfor_"+ (str side player),false,true];
_leftCASNew = _availableCAS - 1;
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableCAS" + (str side player),_leftCASNew,true];


player setVariable ["MRH_FireSupport_PreviouslyEnteredGridRefCAS",_requestedPos];
_requestedPosFormated = [_requestedPos] FUNC(ParseCoordinates);

closeDialog 0;
_ETA = random [0,10,20]; 


playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio2.wss",player];
[[player,_ETA,_requestedPosFormated],{
		params ["_player","_ETA","_LZ"];
		_ETA = [_ETA, 0] call BIS_fnc_cutDecimals;
		
		if ((group player) != (group _player)) ExitWith {};
		//playSound "";
	
	_player sideChat format ["This is %2. Requesting Close Air Support strike at coordinates %1",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	sleep 4;
		//playSound "MRH_HeliTaxi_HeliEnRoute";
		
	[side _player, "HQ"] sideChat format ["Good copy %3. CAS inbound to grid %1, ETA: %2 seconds",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),_ETA,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	}] RemoteExec ["Spawn", [-2,0] select isServer];

sleep _ETA;
playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio6.wss", player];
[[player],{
		params ["_player"];
		if ((group player) != (group _player)) ExitWith {};
		//playSound "MRH_HeliTaxi_HeliEnRoute";
		//leader group player directSay "mp_groundsupport_45_artillery_BHQ_1";
	[side _player, "HQ"] sideChat format ["CAS in position %1, enjoy the fireworks ",(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	}] RemoteExec ["Spawn", [-2,0] select isServer];
	






//systemChat format ["Veh %1 type %2 pos %3", str _vehicle, _typeOfAttack, str _requestedPosFormated];


_center = createCenter sideLogic;    
_group = createGroup _center;    
_pos = _requestedPosFormated;     
_cas = _group createUnit ["ModuleCAS_F",_pos , [], 0, ""];
_cas setDir random [0,180,360];   
_cas setVariable ["vehicle",_vehicle]; 
_cas setVariable ["type", _typeOfAttack];
sleep 20;
missionNamespace setVariable ["MRH_FireSupport_isAvailableCASfor_"+ (str side player),true,true];
