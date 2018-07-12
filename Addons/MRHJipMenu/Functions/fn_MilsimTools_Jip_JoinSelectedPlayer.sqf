/*
Function name: MRH_fnc_MilsimTools_Jip_JoinSelectedPlayer;
Author: Mr H.
Description: converts given string to <OBJECT>, moves player to the selected position, reset's player's hasdiedVariable. Checks if the selected player is in a vehicle, if said vehicule is full action is cancelled, if not the player is moved to the deisred vehicle.
Return value: None
Public:No
Parameters: 0- <STRING> str _playable unit sent by the button
Example(s):
[] call MRH_fnc_MilsimTools_Jip_JoinSelectedPlayer;
*/
#include "MRH_C_Path.hpp"
params ["_selectedPlayer"];

// if no player/unit is selected the interface will return "", so exit code.
if (_selectedplayer == "") ExitWith {hint localize "STR_MRH_JIP_HINTNOPLAYERSELECTED";};

//convert string to player object
_selectedPlayerConverted = objNull;
{
	if (str _x == _selectedPlayer) then {_selectedPlayerConverted = _x};

}forEach playableUnits;

//starts the process
[_selectedPlayerConverted] spawn 
	{
		//Define necessary variables
		_selectedplayer = _this select 0;
		
		_isFull = false;
		_selectedPlayerIsInVeh = false;
		_vehicle = vehicle _selectedPlayer;
		
		//checks if target player/unit is in a vehicle
		if (_vehicle != _selectedPlayer) then {_selectedPlayerIsInVeh = true;};
		
		//if target player/unit is in a vehicle get vehicle intel
		if (_selectedPlayerIsInVeh) then
			{
			
			_isFull = ([_vehicle] call MRH_fnc_MilsimTools_Core_ReturnEmptyCargoSlots) select 0;
			_emptySeats = ([_vehicle] call MRH_fnc_MilsimTools_Core_ReturnEmptyCargoSlots) select 1;
			
			};
		//Exit script if vehicle is full 
		if (_isFull) ExitWith {hint localize "STR_MRH_JIP_SELECTEDVEHICLEFULL"};
		
		//close dialogs, only from here when all checks are OK, we do not want the menu to be closed before that.
		closedialog 0;
		
		//display a standby black screen with text and move player meanwhile
		["<t font='PuristaBold' size='1.25'>" + (localize "STR_MRH_JIP_MOVINGTOPOS") + "</t>", 0, 0.4, 6, -1, 0, 3011] spawn bis_fnc_dynamicText;
		titleText ["", "BLACK OUT", 5];
		sleep 5;
		//disable player sim during transport
		player allowDamage false;
		player enableSimulation false;
		//move player, if target is a vehicle move them as vehicle cargo
				// if player is in a vehicle get him out
		if ((vehicle player) != player) then {moveOut player};
		_pos = _selectedplayer modelToWorld [0,+5, 0];
		
		if (_selectedPlayerIsInVeh) then 
		{
			_emptySeats = ([_vehicle] call MRH_fnc_MilsimTools_Core_ReturnEmptyCargoSlots) select 1;
			player assignAsCargoIndex [_vehicle, selectRandom _emptySeats];
			player moveInCargo _vehicle;
		} else 
		{
			player setPosATL _pos;
		};
		
		//end blackscreen
		titleText ["", "BLACK IN", 5];

		//reinstate player sim
		
		///create cameras for cutscene
		_pos1= player modelToWorld [0,-50, 50];
		_pos2= player modelToWorld [0.3,0.3, 1.6];
		_introcam = "camera" camCreate  _pos1;
		_playercam = "camera" camCreate _pos2;
		_playercam attachTo [vehicle player,[0.3,0.3, 1.6]];
		//start cutscene
		_introcam cameraEffect ["internal", "BACK"]; 
		_introcam camCommand "inertia on"; 
		_introcam camPrepareTarget _playercam; 
		_introcam camPrepareFOV 0.5; 
		_introcam camCommitPrepared 0;

		sleep 3;
		_introcam camPreparePos _pos2;
		_introcam camPrepareTarget _playercam;
		_introcam camPrepareFOV 1;
		_introcam camCommitPrepared 3;
		sleep 3;
		
		// destroy cameras after cutscene
		camDestroy _introcam;
		camDestroy _playercam;
		player cameraEffect ["terminate","back"];
		player allowDamage true;
		player enableSimulation true;
		player setVelocity [0,0,0];
		//fully heal player just in case (low flying helis to ground spawn causes damage IDK why)
		[player, player] call ACE_medical_fnc_treatmentAdvanced_fullHeal; 
		//reset player "hasdied" variable, in case JIP menu is called to allow dead players back in
		[player] call MRH_fnc_MilsimTools_Core_SetRevived;

	};