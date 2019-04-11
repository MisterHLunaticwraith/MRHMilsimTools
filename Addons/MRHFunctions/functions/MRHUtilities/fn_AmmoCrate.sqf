/*
Function name:MRH_fnc_MRH_fnc_AmmoCrate;
Author: Mr H.
Description: this function gets all weapons currently present in all playable units' inventories and fills the box with fiting ammunition for these weapons, it includes handguns and launchers. The box receives an ace 3 interaction that allows players to refresh its contents.
Return value: None
Public: Yes
Parameters:
0- <OBJECT> Box must be a container object
1- <NUMBER> ammount of items, per item.-Optional default 10
2- <BOOLEAN> Content is unlimited, if true the box will be refilled everytime its inventory is opened. -Optional default false
3- <BOOLEAN> Can be refreshed, if true the box's content can be refreshed useful if players change their weapons mid game. The box will receive an ACE 3 interaction action to refresh its contents. It makes the box's content unlimited. -optional, default false
Example(s):
[this,10,true,true] call MRH_fnc_AmmoCrate;
*/


params ["_box",["_Ammount",10],["_isUnlimited",false],["_canBeRefreshed",false]];

if (_canBeReFreshed) then {_isUnlimited =true};
_PlayableUnits = [player];
if (isMultiplayer) then {_PlayableUnits = playableUnits};
///get all weapons in all weapons slots for all playable units
_allPlayerWeapons = [];
{
_mainWeapon = (getUnitloadout _x select 0) select 0;
_launcher = (getUnitloadout _x select 1) select 0;
_handGun = (getUnitloadout _x select 2) select 0;
if(!isNil "_mainWeapon") then {_allPlayerWeapons pushBackUnique _mainWeapon};
if(!isNil "_launcher") then {_allPlayerWeapons pushBackUnique _launcher};
if(!isNil "_handGun") then {_allPlayerWeapons pushBackUnique _handGun};
} forEach _PlayableUnits;



//get all fitting munitions for said weapons
_allMagazinesType = [];
{
private ["_uniquemags","_magazineTypeS"];

//_uniquemags = [];
_magazineTypeS = getarray (configfile >> "CfgWeapons" >> _x >>"magazines");

	{
	_uniquemags = _x;
	
	_allMagazinesType pushBackUnique _uniquemags; 
	} forEach _magazineTypeS;



} forEach _allPlayerWeapons;

//Fills box with given content

//systemChat format ["Weps %1 Mags %2 Box %3", str _allPlayerWeapons, str _allMagazinesType, str _box];
{
_do= _box addMagazineCargoGlobal [_x, _Ammount];

} forEach _allMagazinesType;

////if unlimited is set to true, the box will be refilled automatically

if (_isUnlimited)then {
_box setVariable ["MRH_AmmoMagazines", _allMagazinesType];

_handlerIndex = _box addEventHandler 
	["ContainerOpened", 
		{ 
		_box = _this select 0;
		_allMagazinesType = _box getVariable "MRH_AmmoMagazines";



		clearMagazineCargoGlobal _box;
		{_box addMagazineCargoGlobal [_x,10];} forEach _allMagazinesType;

		}
	];
_box setVariable ["MRH_AmmoCrateEHIndex", _handlerIndex, true];

};

////Adds ace action to allow refresh of the box's contents midgame (useful if new weapons are given to players)

_params = [_box,_Ammount,_isUnlimited,_canBeRefreshed];
_box setVariable ["MRH_AmmoCrateParameters", _params, true];

if (_canBeRefreshed) then {
_statement = 
	{
	
	_box = _this select 0;
	_params = _box getVariable "MRH_AmmoCrateParameters";
	[[_params],
		{
		params ["_params"];
		_box = _params select 0;
		_handlerIndex = _box getVariable "MRH_AmmoCrateEHIndex";
		_box removeEventHandler ["ContainerOpened", _handlerIndex];
		[_box ,0,["ACE_MainActions","RefreshBoxContents"]] call ace_interact_menu_fnc_removeActionFromObject;
		_params call MRH_fnc_AmmoCrate;
		}
	] RemoteExec ["Spawn",0,true];
	//_params call MRH_fnc_AmmoCrate;
	};
_action = ["RefreshBoxContents",(localize "STR_MRH_FC_RefreshCrateContent"),"", _statement , {true},{},[],[0,0,0], 5] call ace_interact_menu_fnc_createAction;
[_box, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 


};

