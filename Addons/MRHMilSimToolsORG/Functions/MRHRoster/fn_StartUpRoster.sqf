/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Author 		: Skippy
//
//Version 		: 3
//
//Released		: 12/08/2014
//
//Description 	: Displays team members (with the possibility to include/exclude IA and the possibility to rename groups) in the diary
//
//Params 		: 	includeAI (integer) 	0/1/2  		--> only players/both AI and players/playable units only
//
//					rank (bool) 			true/false 	--> display/hide unit's rank
//
//					role (bool) 			true/false 	--> display/hide unit's role
//
//		(optional)	ColorSIDE (string) followed by hexadecimal color (string) --> Dislpay all SIDE groups in this color
//
//
//
//		(optional) Mission Maker can change groups name using : 
//
//					(group this) setGroupID ["Group Name"];
//
//					in the group leader init field
//
//
//		(optional) Mission Maker can change groups color using :
//
//					(group this) setVariable ["color",'#000000']; where 000000 can be changed to whatever hexa code
//
//					in the group leader init field (this will overwrite ColorSIDE param)
//
//
//		(optional) Mission Maker can change unit's display name :
//
//					this setVariable ["displayName","Unit Custom Name"];
//
//					in the unit's init field (this will overwrite Role param)
//
//					
//Example1		: [1,true,true] execVM "roster.sqf"; //default setup
//
//					1 means that every units is displayed
//					first true means that ranks are displayed
//					second true means that roles are displayed
//
//
//Example2		  [0,false,true,"ColorWEST","'#0066CC'"] execVM "roster.sqf";
//
//					0 means only players are displayed 
//					false means that ranks are hidden
//					true means that roles are displayed
//					"ColorWEST","'#0066CC'" means that every western group will be displayed in blue
//
//
//
//
/*
*****************************************************************************************************************************************
*/

if (isClass(configFile >> "CfgPatches" >> "skippy_roster")) exitWith {};

private["_includeAI","_rank","_role","_strRank","_strRole","_strGrp","_strColorGrp","_strFinal","_oldGrp","_newGrp","_unitsArr"];

if(isNil "_this") exitWith {hint "Skippy-Roster Script needs array as parameter"};
if(typeName _this != "ARRAY") exitWith {hint "Skippy-Roster Script needs array as parameter"};


_includeAI 	= 1;//0->only players, 1->both AI and players, 2->playable units only (includes player and some AI)
_rank 		= true;//true->display unit's rank		false->hide unit's rank
_role 		= true;//true->display unit's role		false->hide unit's role


if(count _this > 0) then {
	if((typeName (_this select 0)) != "SCALAR") then {
		hint "Skippy-Roster - Param1 isn't scalar";
	} else {
		_includeAI = _this select 0;
	};

	if(count _this > 1) then {
	
		if((typeName (_this select 1)) != "BOOL") then {
			hint "Skippy-Roster - Param2 isn't boolean";
		} else {
			_rank = _this select 1;
		};

		if(count _this > 3) then {
			if((typeName (_this select 2)) != "BOOL") then {
				hint "Skippy-Roster - Param3 isn't boolean";
			} else {
				_role = _this select 2;
			};
		};
	};
};


_strRank 		= "";//will contain unit's rank
_strRole 		= "";//will contain unit's role
_strGrp 		= "";//will contain unit's group name
_strColorGrp 	= "";//will contain unit's group color
_strFinal 		= "";//will contain final string to be displayed
_oldGrp 		= grpNull;//group of last checked unit
_newGrp 		= grpNull;//group of current unit
_unitsArr 		= [];//will contain all units that have to be processed


switch(_includeAI) do {
	case 0:{//only players
		{
			if(isPlayer _x) then {
				_unitsArr = _unitsArr + [_x];
			};
		}forEach allUnits;
	};
	case 1:{//both AI and players
		_unitsArr = allUnits;
	};
	case 2:{//only playable units
		if(isMultiplayer) then {
			_unitsArr = playableUnits;
		} else {
			_unitsArr = switchableUnits;
		};
	};
	default{
		_unitsArr = allUnits;
	};
};

{//forEach
	if(side _x == side player) then {
		_newGrp = group _x;
		_strGrp = "";
		
		if(_rank) then {
			switch(rankID _x) do {
				case 0:{
					_strRank = "Pvt. ";
				};
				case 1:{
					_strRank = "Cpl. ";
				};
				case 2:{
					_strRank = "Sgt. ";
				};
				case 3:{
					_strRank = "Lt. ";
				};
				case 4:{
					_strRank = "Cpt. ";
				};
				case 5:{
					_strRank = "Maj. ";
				};
				case 6:{
					_strRank = "Col. ";
				};
				default{
					_strRank = "Pvt. ";
				};
			};
		};

		if(_role) then {
			_strRole = " - " + getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName");
		};
		
		if((_x getVariable "displayName") != "") then {
			_strRole = " - " +(_x getVariable "displayName");
		};

		if(_newGrp != _oldGrp) then {
			_strGrp = "<br/>" + (groupID(group _x)) + "<br/>";
			
			if((_this find ("Color"+str(side _x)))>-1) then {
				if(count _this > ((_this find ("Color"+str(side _x))) + 1)) then {
					_strColorGrp = _this select ((_this find ("Color"+str(side _x))) + 1);
				} else {
					hint "Skippy-Roster - Missing Param";
					_strColorGrp = "";
				};
			} else {
				switch (side _x) do {
					case EAST:{
						_strColorGrp = "'#990000'";
					};
					case WEST:{
						_strColorGrp = "'#0066CC'";
					};
					case RESISTANCE:{
						_strColorGrp = "'#339900'";
					};
					case CIVILIAN:{
						_strColorGrp = "'#990099'";
					};
				};
			};
			
			if(((group _x) getVariable "color") != "") then {
				_strColorGrp = (group _x) getVariable "color";
			};
		};

		_strFinal =  _strFinal + "<font color="+_strColorGrp+">"+_strGrp+"</font>" + _strRank + name _x + _strRole + "<br/>";

		_oldGrp = group _x;
	};
}forEach _unitsArr;

player createDiarySubject ["roster","Team Roster"];
player createDiaryRecord ["roster",["Roster",_strFinal]];


