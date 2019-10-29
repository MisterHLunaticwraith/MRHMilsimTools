/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_;
*/
#include "MRH_C_Path.hpp"

params [
			"_remote",
			["_screens",[]]
		];
//---ACE MAKES A MESS BY ADDING LAYERS UPON LAYERS OF PARAMS USE THIS DEF IN CHILDREN SCOPES TO RETRIEVE
///////////////////////////////////////////////////////////////////////////////////////////////////////
#define CHILDREN_PARAMS params ["_target","_player","_subA"]; _subA params ["_screens"]
///////////////////////////List of screens that have hiddenselection 1 overlay///////////////////////
#define CAN_OVERLAY ["MRH_projectionScreenSmall","MRH_projectionScreenLarge"]
/////////////////////////////////////////////////////////////////////////////////////////////////////
//_screens pushBackUnique _remote;

if (_screens isEqualTo []) exitWith {};


private _parameters = [_screens];
_remote setVariable ["MRH_BriefingApp_ControlledScreens",_screens,true];


private _statement = {true};
private _insertChildren ={
	params ["_target", "_player", "_params"];
/////----------

//------action sub : connect to antenna
	private _actionConnect = [
		"MRH_connect_to",
		(localize "STR_MRH_ST_connectToConsAction"),
		 "\MRHMarkers\paa\iconconnect",
		{
			CHILDREN_PARAMS;
			[_target,_player] FUNC(connectToRemote);
		}, 
		{
			CHILDREN_PARAMS;
			(
				//!((_target getVariable ["MRH_BriefingApp_isCtrldBy",objNull]) isEqualTo _player) && 
				("MRH_SoldierTab" in (items _player))
				&& 
				(isNull (_player getVariable ["MRH_isConnectedToRemoteCtrl",objNull]))
			)
		},
		{},
		 _params] call ace_interact_menu_fnc_createAction;

//------action sub : show sat feed
	private _actionSatFeed = [
		"MRH_Brief_ShowSatFeed",
		(localize "STR_MRH_ST_showSatFeedAction"),
		 "\MRHMarkers\paa\satellite.paa",
		{
			CHILDREN_PARAMS;
			FUNC(killVideoFeeds);
			{
				_x setObjectTextureGlobal [(_x FUNC(getTexturePath)),"#(argb,512,512,1)r2t(rttMRHSatelliteFeed,1.0)"];
			} forEach _screens;
						
		}, 
		{
			CHILDREN_PARAMS;
			call {
				if !(isClass (configFile>>'cfgPatches'>>'MRHSatellite'))exitWith {false};
				(missionNamespace getVariable ["MRHSatFirstInitCheck",false])
			}
		},
		{},
		 _params] call ace_interact_menu_fnc_createAction;

//------action sub : show extra slides

	private _actionShowScreenOverlay = [
		"MRH_Brief_screen_overlay",
		(localize "STR_MRH_ST_hideShowOlayToggle"),
		 "\MRHMarkers\paa\loiter.paa",
		{
			CHILDREN_PARAMS;
			{
				if ([[_x],CAN_OVERLAY]FUNC(includesScreenWithOverlayCapability)) then 
				{
					if !(_x getVariable ["MRH_isBannerShowed",false]) then {
					_x setObjectTextureGlobal [1,(["MRH_MilsimTools_ST_BriefingRemote_overlay"]call cba_settings_fnc_get)];
					_x setVariable ["MRH_isBannerSHowed",true,true];
					}
					else
					{
						_x setObjectTextureGlobal [1,""];
						_x setVariable ["MRH_isBannerSHowed",false,true];
					};
				};
			
			} forEach _screens;
		}, 
		{
			CHILDREN_PARAMS;
			([_screens,CAN_OVERLAY]FUNC(includesScreenWithOverlayCapability))
		},
		{
			},
		 _params] call ace_interact_menu_fnc_createAction;

//------action sub : play video

	private _actionPlayVideo = [
		"MRH_Brief_screen_playVideo",
		(localize "STR_MRH_ST_playVidAction"),
		 "\MRHMarkers\paa\start.paa",
		{
			CHILDREN_PARAMS;
			createDialog "MRHVideoChoice";
			(findDisplay 241019) setVariable ["MRH_Brief_screens",_screens];
		}, 
		{
			CHILDREN_PARAMS;
			!(([(["MRH_MilsimTools_ST_BriefingRemote_videosToPlay"] call cba_settings_fnc_get)] call MRH_fnc_MilsimTools_Core_stringListToArray) isEqualTo [])
			
		},
		{
			},
		 _params] call ace_interact_menu_fnc_createAction;
//------action sub : transmitHQ data

	private _actionTransmitData = [
		"MRH_Brief_screen_transmitHQData",
		(format [(localize "STR_MRH_ST_transmitHQDataAction"),(([_player]FUNC(getSideHQ)) select 0)]),
		 "\MRHMarkers\paa\icoantenna.paa",
		{
			CHILDREN_PARAMS;
			[_target,_player]FUNC(briefTransmitHQData);
		}, 
		{
			CHILDREN_PARAMS;
			!(isNull (([_player]FUNC(getSideHQ)) select 2))
			
			
		},
		{
			},
		 _params] call ace_interact_menu_fnc_createAction;
//return all subs
	[
		[	
			_actionConnect, //action
			[], //chilren
			_target //object to add to
		],

		[	
			_actionSatFeed, //action
			[], //chilren
			_target //object to add to
		],
		[	
			_actionShowScreenOverlay, //action
			[], //chilren
			_target //object to add to
		],
		[	
			_actionPlayVideo, //action
			[], //chilren
			_target //object to add to
		],
		[	
			_actionTransmitData, //action
			[], //chilren
			_target //object to add to
		]
			
	]
};
private _action =
[
	"MRH_BriefingRemotes_Actions", 
	(localize "STR_MRH_ST_briefingMainCtrlACtion"),
 	"\MRHMarkers\paa\briefing.paa",
	_statement, 
 	{true},
 	_insertChildren, //insertChildrenCode
 	_parameters,
 	[0,0,0], 
 	5
 ] call ace_interact_menu_fnc_createAction;
 ////
 [_remote, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
