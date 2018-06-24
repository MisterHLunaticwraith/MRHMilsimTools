/*
Function name:MRH_fnc_MilsimTools_Core_GenerateRosterText
Author: Mr H.
Description: generates team roster text in format structured text
Return value: string of structured text
Public:No
Parameters: 
0- <ARRAY> of <GROUPS> ==> groups to include in the roster
1- <BOOLEAN> show AIs within those groups
Example(s):
_strucuredRosterText= [allgroups,true] call MRH_fnc_MilsimTools_Core_GenerateRosterText;
*/

params ["_allGroups","_includeAI"];

//gets color parameters from cba settings and converts them to hex
_colorInde =["MRH_MilsimTools_Roster_ColorInd"] call cba_settings_fnc_get;
_colorInde = _colorInde call BIS_fnc_colorRGBAtoHTML;
_colorBlufor = ["MRH_MilsimTools_Roster_ColorBF"] call cba_settings_fnc_get;
_colorBlufor = _colorBlufor call BIS_fnc_colorRGBAtoHTML;
_colorOpfor =["MRH_MilsimTools_Roster_ColorOp"] call cba_settings_fnc_get;
_colorOpfor = _colorOpfor call BIS_fnc_colorRGBAtoHTML;
_colorCiv = ["MRH_MilsimTools_Roster_ColorCiv"] call cba_settings_fnc_get;
_colorCiv = _colorCiv call BIS_fnc_colorRGBAtoHTML;
_color = ["MRH_MilsimTools_Roster_ColorUnknown"] call cba_settings_fnc_get;
_color = _color call BIS_fnc_colorRGBAtoHTML;




_rosterText = "";

_rosterTextARRAY = [];

{


	
	_grpName = toUpper groupID _x;
	_grpARRAY = [_grpName];

	_playersStringsARRAY = [];
		{
		_condition = true;
		if !(_includeAI) then {_condition = isPlayer _x};
		_playerARRAY = [];
		if (_condition) then 
			{
			_RankIntel = [_x] call MRH_fnc_MilsimTools_Core_LocRankIntel;
			_locRank = _RankIntel select 0;
			_RankPic = _RankIntel select 1;
			_RankPic = "<img image='"+ _RankPic +"' />";
			_rankNato = _RankIntel select 2;
			_playerIntel = _x getVariable "MRH_MilsimTools_Core_PlayerIntel";
			_role = _playerIntel select 1;
			_radioFrequency = _playerIntel select 2;
			_radioFrequency = (localize "STR_MRH_CORE_ROSTERRADIOF")+" " + _radioFrequency;
			_name = name _x;
				if (isFormationLeader _x) then 
				{
				_grpARRAY pushBackUnique _radioFrequency;
				_playerARRAY = [_RankPic,_locRank,_role,_name,_rankNato, "<br/>"];
				} 
				else
				{
					if (rank _x != "PRIVATE") then 
					{
						_playerARRAY = ["   ",_RankPic,_locRank,_role,_name,_rankNato, "<br/>"];
					} 
					else {
						_playerARRAY = ["            -",_locRank,_role,_name, "<br/>"];
					};
				};
			
			
		    
			};
		_playerString = _playerARRAY joinString " ";
		_playersStringsARRAY pushBackUnique _playerString;

		} forEach units  _x;
		
		_playerStrings = _playersStringsARRAY joinstring " ";
		
	_grpARRAY pushBackUnique "<br/>";
	_grpStr = _grpARRAY joinstring " ";

	_fullGrpText =[_grpStr,_playerStrings, "<br/><br/>"] joinstring " ";
	switch (true)do 
	{
	case (side _x == west):{_color = _colorBlufor};
	case (side _x == east):{_color = _colorOpfor};
	case (side _x == resistance):{_color = _colorInde};
	case (side _x == civilian):{_color = _colorCiv};
	default {};
	};
	_fullGrpText = "<t color= '"+ _color + "'>" + _fullGrpText + "</t>";
	_rosterTextARRAY pushBackUnique _fullGrpText;

	}forEach _allGroups;	
		
_rosterText = _rosterTextARRAY joinstring " ";		

_rosterText = "<t font= 'puristaLight'>" + _rosterText + "</t>";
_rosterText