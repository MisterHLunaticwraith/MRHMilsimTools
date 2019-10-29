/*
Function name:MRH_fnc_MilsimTools_Core_serverCreateCurator
Author: Mr H.
Description: Creates a new curator module for a player unit, if it already exists it reassigns the module to the unit, curator object gets a variablename based on player's variable name in format MRH_Player_Zeus_Module_ + player variable eg. zeus module for player somePlayer will be called MRH_Player_Zeus_Module_somePlayer
Return value: None
Public: No
Parameters:
0- <OBJECT> player object

Example(s):
[somePlayer]call MRH_fnc_MilsimTools_Core_serverCreateCurator;
*/
#include "MRH_C_Path.hpp"
if !(isServer) ExitWith {};
	params ["_zeusPlayer"];
	_name =("MRH_Player_Zeus_Module" +"_" + (str _zeusPlayer));
	_PLAYERSLOT_Zeus_Module = missionNameSpace getVariable [_name,objNull];
	if !(isNull _PLAYERSLOT_Zeus_Module) exitWith {_zeusPlayer assignCurator _PLAYERSLOT_Zeus_Module;};

	_MRH_Zeus_logicSide = missionNamespace getVariable ["MRH_Zeus_SideLogic",objNull];
	_MRH_Zeus_logicGrp = missionNamespace getVariable ["MRH_Zeus_logicGrp",objNull];

	if (isNull _MRH_Zeus_LogicGrp) then {
		_MRH_Zeus_logicSide = createCenter sideLogic;
		missionNamespace setVariable ["MRH_Zeus_SideLogic",_MRH_Zeus_logicSide,true];
		_MRH_Zeus_logicGrp = createGroup _MRH_Zeus_logicSide;
		missionNamespace setVariable ["MRH_Zeus_logicGrp",_MRH_Zeus_logicGrp,true];
	};



	 _PLAYERSLOT_Zeus_Module = _MRH_Zeus_logicGrp createUnit ["ModuleCurator_F",[2,0,0] , [], 0, ""];
	_PLAYERSLOT_Zeus_Module setVariable ["showNotification", false, true];
	_PLAYERSLOT_Zeus_Module setVariable ["birdType", "", true];
	_PLAYERSLOT_Zeus_Module setVariable ["Owner", (str _zeusPlayer), true];
	_PLAYERSLOT_Zeus_Module setVariable ["Addons", 3, true];
	_PLAYERSLOT_Zeus_Module setVariable ["Forced", 0, true];
	_PLAYERSLOT_Zeus_Module setVariable ["name", "Zeus joueur", true];
	missionNamespace setVariable ["MRH_Player_Zeus_Module" +"_" + (str _zeusPlayer),_PLAYERSLOT_Zeus_Module,true];
	_PLAYERSLOT_Zeus_Module setVehicleVarName ("MRH_Player_Zeus_Module" +"_" + (str _zeusPlayer));
	_PLAYERSLOT_Zeus_Module setVariable [ "bis_fnc_initModules_disableAutoActivation", false, true ];
	_PLAYERSLOT_Zeus_Module call BIS_fnc_objectVar;





	_PLAYERSLOT_Zeus_Module addCuratorEditableObjects [(allMissionObjects "All"),true];
	_PLAYERSLOT_Zeus_Module addEventHandler ["CuratorObjectPlaced", 
		{
			params ["_curator", "_entity"];
			{
				_x addCuratorEditableObjects [[_entity],true];
			} forEach allCurators;

		}];
	_zeusPlayer assignCurator _PLAYERSLOT_Zeus_Module;
	[[_zeusPlayer],
	{
		params ["_zeusPlayer"];
		_zeusPlayer addEventHandler ["Respawn",{params ["_unit", "_corpse"]; [_unit] call MRH_fnc_isCurator}];
	}
	]RemoteExec ["Call",_zeusPlayer];
	_PLAYERSLOT_Zeus_Module setVariable [ "bis_fnc_initModules_disableAutoActivation", false, !isServer ];

	_toTrace = format ["Zeus module %1 Created and assigner to %1",_zeusPlayer,_PLAYERSLOT_Zeus_Module];
	TRACE(_toTrace);
	["MRH_Events_curatorObjectCreated", [_zeusPlayer,_PLAYERSLOT_Zeus_Module]] call CBA_fnc_globalEvent;
