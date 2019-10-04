/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"
_this spawn {
	params ["_penaltyTime"];
		if(!hasInterface) exitWith {};
		_penalty = _penaltyTime;
		//if (_penaltyTime <= 0) exitWith {};
		080919 cutRsc ["MRH_HUDIntel", "PLAIN"];
		disableSerialization;
		private _display = uiNamespace getVariable "MRH_HUDIntel";
		_progressBar = _display displayCtrl 1201;
		_status = _display displayCtrl 1100;
		_etaCtrl = _display displayCtrl 1101;

		while {_penalty>0 && (isNull (missionNamespace getVariable [("MRH_HeliTaxi_CurrentMedEvacHeli_"+ (str (side MRH_player))),objNull]))} do {
			_penalty = _penalty -1;
			_timeLeft = [_penalty,"MM:SS"] call BIS_fnc_secondsToString;
			_etaCtrl ctrlSetStructuredText parseText _timeleft;
			_progress = _penalty/_penaltyTime;
			_progressBar progressSetPosition _progress;
			uisleep 1;
		};
TRACE("MRH_MedEvac_WaitScreen: penalty time passed, waiting for heli spawn");
		waitUntil {!isNull (missionNamespace getVariable [("MRH_HeliTaxi_CurrentMedEvacHeli_"+ (str (side MRH_player))),objNull])};
TRACE("MRH_MedEvac_WaitScreen: heli spawned starting ETA countDown");
		_medEvac = missionNamespace getVariable [("MRH_HeliTaxi_CurrentMedEvacHeli_"+ (str (side MRH_player))),objNull];
		if (isTouchingGround _medEvac) then {waitUntil {!isTouchingGround _medEvac}}; //sometimes returns true when heli spawns in mp
		_LZ = getMarkerPos "MRH_LZ_Evac_Marker";
		
		_totalDist = _medEvac distance _LZ;
		_status ctrlSetStructuredText parseText "E.T.A.";
		private _toTrace = format ["heli %1 is touching ground %2 isCancelled %3,isAlive %4",_medEvac,isTouchingGround _medEvac,(_medEvac getVariable ["MRH_HeliTaxi_isCancelled",false]),alive _medEvac];
		TRACE(_toTrace);
		while {(alive _medEvac) && !(isTouchingGround _medEvac) && !(_medEvac getVariable ["MRH_HeliTaxi_isCancelled",false]) && (!isNull _medEvac)} do


		{
			private _toTrace = format ["heli %1 is touching ground %2 isCancelled %3,isAlive %4",_medEvac,isTouchingGround _medEvac,(_medEvac getVariable ["MRH_HeliTaxi_isCancelled",false]),alive _medEvac];
		TRACE(_toTrace);
			_etaTime = [_medEvac,_LZ] call MRH_fnc_travelTimeEta;
			_etaText =[_etaTime,"MM:SS"] call BIS_fnc_secondsToString;
			_etaCtrl ctrlSetStructuredText parseText _etaText;
			_progress = (_medEvac distance _LZ)/_totalDist;
			_progressBar progressSetPosition _progress;
			uisleep 1;
		};
		_display closedisplay 2;
TRACE("MRH_MedEvac_WaitScreen: heli touchdown coutdown closed");
};