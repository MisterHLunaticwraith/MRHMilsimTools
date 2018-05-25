/*
Function name: MRH_fnc_MilsimTools_Jip_Open_Menu
Author: Mr H.
Description: opens the jip menu and fills it
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_Jip_Open_Menu;
*/

#include "MRH_C_Path.hpp"
//create interface dialog
_handle=createdialog "MRHJipMenu";
disableSerialization;

//list the groups to only groups with players //TODO REPLACEWITHCOREFUNC
_GroupsWithPlayers = [];
	{
		_units = units _x;
		if ({isPlayer _x} count _units >= 1) then 
		{
			_GroupsWithPlayers set [count _GroupsWithPlayers,_x];
		};
	} 
forEach allGroups;

// if admin settings allow for AIs then include all groups
_adminsettingIncAI = ["MRH_MilsimTools_Jip_MenuIncludeAI"] call cba_settings_fnc_get;
if (_adminsettingIncAI) then {_GroupsWithPlayers = allGroups};


//filters groups that are only from the player's side depending on the setting
_groupsSidePlayer = [];
_AdminGrpSideSetting = ["MRH_MilsimTools_Jip_Menu_sideOnly"] call cba_settings_fnc_get;

//TODO REPLACE WITH COREFUNC
if (_AdminGrpSideSetting) then 
	{
	  {
		if (side _x == side player) then {_groupsSidePlayer pushBackUnique _x};
	  }forEach _GroupsWithPlayers;
	  _GroupsWithPlayers = _groupsSidePlayer;
	};

//Sets the reminder of the player's group
//step 1 create text 
_orggroup = format ["%1",groupID group player];
_orggroup = parsetext _orggroup;


// step 2 set the text
((findDisplay 210382) displayCtrl 1101) ctrlSetStructuredText _orggroup;

//step 3 define colors according to side
_colorBF = [0.5,0,0,1];
_colorOP = [0,0.3,0.6,1];
_colorIND = [0,0.5,0,1];
_colorCiv = [0.4,0,0.5,1];
_color = [1,1,1,1];

//step 4 change colors
	switch (true)do 
	{
	case (side player == east):{_color = _colorBF};
	case (side player == west):{_color = _colorOP};
	case (side player == resistance):{_color = _colorIND};
	case (side player == civilian):{_color = _colorCiv};
	default {};
	};
((findDisplay 210382) displayCtrl 1101) ctrlSetTextColor _color;


//combo box where grps are listed
_ctrlBOX = ((findDisplay 210382) displayCtrl 2100);

// fills the box, colors group names according to side

{
	private ["_text"];
	_text = format ["%1",groupID _x];
	_index = _ctrlBOX  lbAdd  _text;
	lbSetData [2100, _index,str _x ];
	switch (true)do 
	{
	case (side _x == east):{_color = _colorBF};
	case (side _x == west):{_color = _colorOP};
	case (side _x == resistance):{_color = _colorIND};
	case (side _x == civilian):{_color = _colorCiv};
	default {};
	};
	lbSetColor [2100, _index, _color];

} forEach _GroupsWithPlayers;