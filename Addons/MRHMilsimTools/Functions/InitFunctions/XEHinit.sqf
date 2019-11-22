#include "MRH_C_Path.hpp"

_fullVersioning = (call MRH_fnc_MilsimTools_DebugTools_ListModsAndAddons) select 0;
_toTraceFullV = format ["MRH MilsimTools: Activated mods and addons:%1 %2",endl,_fullVersioning];
TRACE(_toTraceFullV);
_toTraceJustAddonsAndMods = format["MRH Milsim Tools activated mods: %1 %2 %3 activated addons: %4 %5",endl,(true call MRH_fnc_MilsimTools_DebugTools_readAbleList),endl,endl,(call MRH_fnc_MilsimTools_DebugTools_readAbleList)];
TRACE(_toTraceJustAddonsAndMods);

MRH_MISSION_ROOT_FOUND = true;
if ((str missionConfigFile)isEqualTo "") then {
	MRH_MISSION_ROOT_FOUND = false;
	private _toTraceHasDesc = format ["Mission: %1 has no description.ext",missionName];
	TRACE(_toTraceHasDesc);
	};
	
if(MRH_MISSION_ROOT_FOUND) then {
	MRH_MISSION_ROOT = call {
		private "_arr";
		_arr = toArray str missionConfigFile;
		_arr resize (count _arr - 15);
		toString _arr
	};
	_missionRootTrace = format ["MRH Milsim Tools Core- Local mission root is: %1",MRH_MISSION_ROOT];
	TRACE(_missionRootTrace);
};
//---Define allPlayers at start
	0 FUNC(allPlayers);
//------EHs
["MRH_curatorViewOpened", 
{
	params ["_display","_player"];
	private _toTrace = format ["Player %1 has accessed curator",_player];
	TRACE(_toTrace);
	
}] call CBA_fnc_addEventHandler;

["MRH_curatorViewClosed", 
{
	params ["_display","_player"];
	private _toTrace = format ["Player %1 has left curator",_player];
	TRACE(_toTrace)
}] call CBA_fnc_addEventHandler;

["MRH_SideHQ_ReceivedData", 
{
	params ["_HQ","_data","_sender"];
	private _hqCallSign = _HQ getVariable ["MRH_ST_HQ_Callsign",""];
		["MRH_SideHQ_ReceivedData_global", [_HQ,_hqCallSign,_data,_sender]] call CBA_fnc_globalEvent;

	private _synched = synchronizedObjects _HQ;
	{
		[_x,_data,_HQ] call MRH_fnc_MilsimTools_SoldierTab_attributeData;
		
		
	}forEach _synched;
	private _toTrace = format ["MRH_sideHQ_targetEventData: HQ %1 (%2)has received data %3 sent by %4",_hq,_hqCallSign,_data,_sender];
	TRACE(_toTrace)
}] call CBA_fnc_addEventHandler;

["MRH_SideHQ_ReceivedData_global", 
{
	params ["_HQ","_hqCallSign","_data","_sender"];

	private _toTrace = format ["MRH_sideHQ_globalEventData %1 (%2)has received data %3 sent by %4",_hq,_hqCallSign,_data,_sender];
	TRACE(_toTrace);
	if !(hasInterface)exitWith {};
	
	private _canReceive = IS_DEBUG;
	private _havePowers = FUNC(getPlayersWithZeusPowers);
	if (player in _havePowers) then {_canReceive = true};
	if (_canReceive) then 
	{
		private _dataTitles = [];
		{
			_dataTitles pushBackUnique (([_x]call MRH_fnc_MilsimTools_SoldierTab_findAndReadDataEntry) select 1);
		}forEach _data;
		_dataTitles = _dataTitles joinString ",";
		private _message = format ["HQ: %1 has received the following data %2 sent by %3",_hqCallSign,_dataTitles,_sender];
		["MRH_Zeus_Notif",[_message]] call BIS_fnc_showNotification;
	};
	
}] call CBA_fnc_addEventHandler;

["MRH_SideHQ_ReceivedPictures", 
{
	params ["_HQ","_pics","_sender"];
	private _hqCallSign = _HQ getVariable ["MRH_ST_HQ_Callsign",""];
		["MRH_SideHQ_ReceivedPictures_global", [_HQ,_hqCallSign,_pics,_sender]] call CBA_fnc_globalEvent;
	
	private _synched = synchronizedObjects _HQ;
	{
		[_x,_pics,_HQ] call MRH_fnc_MilsimTools_SoldierTab_attributePictures;
		
		
	}forEach _synched;
	private _toTrace = format ["MRH_sideHQ_targetEventPics HQ %1 (%2)has received pictures %3 sent by %4",_hq,_hqCallSign,_pics,_sender];
	TRACE(_toTrace)
}] call CBA_fnc_addEventHandler;

["MRH_SideHQ_ReceivedPictures_global", 
{
	params ["_HQ","_hqCallSign","_pics","_sender"];
	//toDo notifyzeus

	private _toTrace = format ["MRH_sideHQ_globalEventPics <HQ %1 (%2)has received pictures %3 sent by %4",_hq,_hqCallSign,_pics,_sender];
	TRACE(_toTrace);
	if !(hasInterface)exitWith {};
	
	private _canReceive = IS_DEBUG;
	private _havePowers = FUNC(getPlayersWithZeusPowers);
	if (player in _havePowers) then {_canReceive = true};
	if (_canReceive) then 
	{
		private _picsTitles = [];
		{
			_picsTitles pushBackUnique (([_x]call MRH_fnc_MilsimTools_SoldierTab_findAndReadPictureInfo) select 1);
		}forEach _pics;
		_picsTitles = _picsTitles joinString ",";
		private _message = format ["HQ: %1 has received the following picture(s) %2 sent by %3",_hqCallSign,_picsTitles,_sender];
		["MRH_Zeus_Notif",[_message]] call BIS_fnc_showNotification;
	};
}] call CBA_fnc_addEventHandler;

["MRH_Core_ActivateTrigger_event",
	{
				params ["_trigger",["_reset",false]];
		//----set Trigger to be repeatable
		private _trgACT =triggerActivation _trigger;
		if (_trgACT select 2) then {_reset = true};
		_trgACTTEMP =  +_trgACT;
		_trgACTTEMP = [(_trgACT select 0),(_trgACT select 1),true];
		_trigger setTriggerActivation _trgACTTEMP;


		//-----Activate Trigger
		private _trgSTAT = triggerStatements _trigger;

		private _trgSTATSTEMP = +_trgSTAT;
		_trgSTATSTEMP set [0,"true"];
		_trigger setTriggerStatements _trgSTATSTEMP;
		if !(_reset) exitWith {_trigger setTriggerActivation _trgACT;};
		//---- wait 3 seconds and reset trigger to its orginal state
		[
			{
				params ["_trigger", "_trgSTATSTemp","_trgACT","_trgSTAT"];
				//---- deactivate trigger
				_trgSTATSTEMP set [0,"false"];
				_trigger setTriggerStatements _trgSTATSTEMP;
				//--requires some delay
				[
					{
						params ["_trigger", "_trgACT","_trgSTAT"];
						//--- reset trigger to its orginal state
						_trigger setTriggerActivation _trgACT;
						_trigger setTriggerStatements _trgSTAT;

					}, 
					[_trigger, _trgACT,_trgSTAT], 
					1
				] call CBA_fnc_waitAndExecute;

				
			}, 
			[_trigger, _trgSTATSTemp,_trgACT,_trgSTAT], 
			3
		] call CBA_fnc_waitAndExecute;

	}
] call CBA_fnc_addEventHandler;

["MRH_playerKilled",
	{
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		0 FUNC(allPlayers);
	}

] call CBA_fnc_addEventHandler;


["MRH_playerRespawned_global",
	{
		params ["_unit", "_corpse"];
		0 FUNC(allPlayers);
	}
] call CBA_fnc_addEventHandler;

["MRH_playerWasSetAsRevived",
	{
		params ["_revivedPlayer"];
		0 FUNC(allPlayers);
	}
] call CBA_fnc_addEventHandler;