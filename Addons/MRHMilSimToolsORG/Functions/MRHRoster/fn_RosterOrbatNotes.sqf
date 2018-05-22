// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface) exitWith {}; //Exit if not a player.

// Group IDs need to be set before the ORBAT listing can be created
// waitUntil {scriptDone f_script_setGroupIDs};

// Define needed variables
private ["_orbatText", "_groups", "_precompileGroups","_maxSlots","_freeSlots"];
_orbatText = "
CHEFS D'EQUIPES<br /><br />";
_groups = [];
_hiddenGroups = [];

{
	// Add to ORBAT if side matches, group isn't already listed, and group has players
	if ((side _x == side group player) && !(_x in _groups) && ({_x in playableUnits} count units _x) > 0) then {
	//if ((side _x == side group player) && !(_x in _groups)) then {
		_groups pushBack _x;
	};
} forEach allGroups;

// Remove groups we don't want to show
_groups = _groups - _hiddenGroups;

// Loop through the group, print out group ID, leader name and medics if present
{
	// Highlight the player's group with a different color (based on the player's side)
	_color = "#FFFFFF";
	if (_x == group player) then {
		_color = switch (side player) do {
			 case west: {"#0080FF"};
			 case east: {"#B40404"};
			 case independent: {"#298A08"};
			 default {"#8904B1"};
 		};
	};

	_orbatText = _orbatText + format ["<t color='%3'>%1 %2</t>", _x, name leader _x,_color] + "<br />";

	{
		if (_x getVariable ["f_var_assignGear",""] == "m" && {_x != leader group _x}) then {
			_orbatText = _orbatText + format["|- %1 [M]",name _x] + "<br />";
		};
	} forEach units _x;
} forEach _groups;

_veharray = [];
{

	if ({vehicle _x != _x} count units _x > 0 ) then {
		{
			if (vehicle _x != _x && {!(vehicle _x in _veharray)}) then {
			_veharray set [count _veharray,vehicle _x];
			};
		} forEach units _x;
	};

} forEach _groups;

if (count _veharray > 0) then {

_orbatText = _orbatText + "<br />VEHICULE + PASSAGERS<br />";

	{
		 // Filter all characters which might break the diary entry (such as the & in Orca Black & White)
		_vehName = [getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayname"),"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_- "] call BIS_fnc_filterString;

		_orbatText = _orbatText + "<br />" + format["%1 ",_vehName];

		// Workaround for http://feedback.arma3.com/view.php?id=21602
		_maxSlots = getNumber(configfile >> "CfgVehicles" >> typeof _x >> "transportSoldier") + (count allTurrets [_x, true] - count allTurrets _x);
		_freeSlots = _x emptyPositions "cargo";

		if (_maxSlots > 0) then {
			_orbatText = _orbatText + format ["[%1/%2]",(_maxSlots-_freeSlots),_maxSlots];
		};

		_orbatText = _orbatText  + "<br />";

		{
			if ((assignedVehicleRole _x select 0) != "CARGO") then {

				_veh = vehicle _x;
				_crewrole = switch (true) do {
					case (driver _veh == _x && !((vehicle _x isKindOf "helicopter") || (vehicle _x isKindOf "plane"))):{" [Chauffeur]"};
					case (driver _veh == _x && ((vehicle _x isKindOf "helicopter") || (vehicle _x isKindOf "plane"))):{" [Pilote]"};
					case (commander _veh == _x):{" [Commandeur]"};
					case (gunner _veh == _x):{" [Artilleur]"};
					case (assignedVehicleRole _x select 0 == "Turret" && commander _veh != _x && gunner _veh != _x && driver _veh != _x):{" [Equipage]"};
					default {" [Passager]"};
				};

				_orbatText = _orbatText + format["|- %1",name _x] + _crewrole + "<br/>";
			};
		} forEach crew _x;

		_groupList = [];

		{
			if (!(group _x in _groupList) && {(assignedVehicleRole _x select 0) == "CARGO"} count (units group _x) > 0) then {
				_groupList set [count _groupList,group _x];
			};
		} forEach crew _x;

		if (count _groupList > 0) then {
			{
				_orbatText =_orbatText + format["|- %1", _x] + " [Passager] <br />";
			} forEach _groupList;
		};

	} forEach _veharray;

};

// Insert final result into subsection ORBAT of section Notes
_orbatText = "<t size = '0.7'><t color = '#24425e'>" + _orbatText + "</t>";
copytoclipboard _orbatText;
_text = parseText _orbatText;
disableSerialization;
_control =((findDisplay 777) displayCtrl 2900);
_control ctrlSetStructuredText _text;
_myControlPos = ctrlPosition _control;
_ctrlh = ctrlTextHeight _control;
_x = _myControlPos select 0;
_y = _myControlPos select 1;
_z = _myControlPos select 2;
_control ctrlSetPosition [_x,_y,_z,_ctrlh];
_control ctrlCommit 0;