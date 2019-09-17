/*
Function name:MRH_fnc_MilsimTools_FireSupport_FireCAS
Author: Mr H.
Description: Fires CAS with provided coordinates in the interface
Return value:None
Public:No
Parameters:None
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_FireCAS

*/
#include "MRH_C_Path.hpp"
_availability = missionNamespace getVariable ["MRH_FireSupport_isAvailableCASfor_"+ (str side MRH_player),true];
if !(_availability) ExitWith {systemChat localize "STR_MRH_FireSupport_CASUnavailableMessage"};

_availableCAS = missionNamespace getVariable ["MRH_FireSupport_NumberOfAvailableCAS" + (str side MRH_player),10]; //temporary do 0 after settings

_numberAvailableCAS = ["MRH_MilsimTools_FireSupport_CASShots"] call cba_settings_fnc_get;
if ((parseNumber _numberAvailableCAS) < 0) then {_availableCAS = 9999}; //if setting is at a negative value then give infinite cas




if (_availableCAS < 1) ExitWith {systemchat localize "STR_MRH_FireSupport_CASnoCASleft"};


_vehicle = lbData [2100,lbcursel 2100];
_typeOfAttack = lbData [2101,lbcursel 2101];
_typeOfAttack = parseNumber _typeOfAttack;
_requestedPos = ctrlText 1400;
//
_ctrl = FDIS(1400);

_isValid = [_requestedPos] FUNC(checkGridValidity);
if !(_isValid) ExitWith {systemChat format [localize "STR_MRH_FireSupport_SC_Bad_coord",_requestedPos];};
//
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
	if (count _weapons == 0) exitwith {systemchat format [localize "STR_MRH_FireSupport_CASnotThisTypeOfAttack",_vehicle,_weaponTypes];};
//----------
missionNamespace setVariable ["MRH_FireSupport_isAvailableCASfor_"+ (str side MRH_player),false,true];
missionNamespace setVariable ["MRH_FireSupport_CASisInActionFor_"+ (str side MRH_player),true,true];
_leftCASNew = _availableCAS - 1;
missionNamespace setVariable ["MRH_FireSupport_NumberOfAvailableCAS" + (str side MRH_player),_leftCASNew,true];


MRH_player setVariable ["MRH_FireSupport_PreviouslyEnteredGridRefCAS",_requestedPos];
_requestedPosFormated = [_requestedPos] FUNC(ParseCoordinates);

closeDialog 0;
_ETA = random [0,10,20]; 


playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio2.wss",MRH_player];
[[MRH_player,_ETA,_requestedPosFormated],{
		params ["_player","_ETA","_LZ"];
		_ETA = [_ETA, 0] call BIS_fnc_cutDecimals;
		
		if ((group MRH_player) != (group _player)) ExitWith {};
		//playSound "";
	
	_player sideChat format [localize "STR_MRH_FireSupport_CASrequestDialog1",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	sleep 4;
		//playSound "MRH_HeliTaxi_HeliEnRoute";
		
	[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_CASrequestDialog2",([_LZ] call MRH_fnc_MilsimTools_Core_realisticGrid),_ETA,(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	}] RemoteExec ["Spawn", [-2,0] select isServer];

sleep _ETA;
playSound3D ["A3\Sounds_F\sfx\radio\ambient_radio6.wss", MRH_player];
[[MRH_player],{
		params ["_player"];
		if ((group MRH_player) != (group _player)) ExitWith {};
		//playSound "MRH_HeliTaxi_HeliEnRoute";
		//leader group player directSay "mp_groundsupport_45_artillery_BHQ_1";
	[side _player, "HQ"] sideChat format [localize "STR_MRH_FireSupport_CASrequestDialog3",(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
	}] RemoteExec ["Spawn", [-2,0] select isServer];
	






//systemChat format ["Veh %1 type %2 pos %3", str _vehicle, _typeOfAttack, str _requestedPosFormated];

[[_requestedPosFormated,_vehicle,_typeOfAttack],{
	params ["_requestedPosFormated","_vehicle","_typeOfAttack"];
	_center = createCenter sideLogic;    
	_group = createGroup _center;    
	_pos = _requestedPosFormated;     
	_cas = _group createUnit ["ModuleCAS_F",_pos , [], 0, ""];
	_cas setDir random [0,180,360];   
	_cas setVariable ["vehicle",_vehicle,true]; 
	_cas setVariable ["type", _typeOfAttack,true];
	_cas setVariable [ "bis_fnc_initModules_disableAutoActivation", false, !isServer ];
}] remoteExec ["Call",2]; //needs to happen on server
sleep 20;
missionNamespace setVariable ["MRH_FireSupport_isAvailableCASfor_"+ (str side MRH_player),true,true];
missionNamespace setVariable [("MRH_MilsimTools_CAS_DelayBetween_"+ (str (side MRH_Player))),CBA_missionTime,true];
missionNamespace setVariable ["MRH_FireSupport_CASisInActionFor_"+ (str side MRH_player),false,true];