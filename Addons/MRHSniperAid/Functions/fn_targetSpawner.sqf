_source = _this;
disableSerialization;
createDialog "MRHTargetSpawner";
#define DISPLAYCTRL(ARG) ((findDisplay 05042018) displayCtrl ARG##)
_displayRef = (findDisplay 05042018);
_markersList = DISPLAYCTRL(1500);
_allMarkers = [];
{
_check = str _x splitString "_";
if ((_check select 1) == "TSM") then {
private ["_index"];
_allMarkers pushBack _x;
_distance = _source distance (getMarkerPos _x);

_index = lbAdd [1500,"Distance:" +" "+ (str round _distance)+" "+ "mètres"];
lbSetColor [1500, _index, [0, 1, 0, 0.5]];
lbSetData [1500, _index, str (getMarkerPos _x)];
};

} forEach allMapMarkers;

/*
onEachFrame {systemChat  lbData [1500,lbCurSel 1500];
_pos = (lbData [1500,lbCurSel 1500]);
player setPos (call compile _pos);
};
*/

_allTargets = getarray (missionconfigfile>>"cfgMRHTargets">> "allTargets");
{
private ["_index"];
_index = lbadd [2100,gettext (missionConfigFile >> "cfgMRHTargets">> _x >> "prettyname")];
lbSetData [2100, _index, _x];
} forEach _allTargets;

/*
     "BLUE" = Never fire
    "GREEN" = Hold fire - defend only
    "WHITE" = Hold fire, engage at will
    "YELLOW" = Fire at will
    "RED" = Fire at will, engage at will
	*/
_allBehaviours = [["BLUE", "Ne jamais faire feu"],["GREEN","Tir de riposte seulement"],["WHITE","Ne faire feu que si danger"],["YELLOW","Feu à volonté"],["RED","Feu à volonté, aller au contact"]];
{
private ["_index"];
_index = lbadd [2101, _x select 1];
lbSetData [2101,_index, _x select 0];
} forEach _allBehaviours;

_allSpeedModes = [["LIMITED","Limité"],["NORMAL","Normale"],["FULL","Rapide"]];

{
private ["_index"];
_index = lbadd [2102, _x select 1];
lbSetData [2102,_index, _x select 0];
} forEach _allSpeedModes;
//onEachFrame {systemChat  lbData [2102,lbCurSel 2102];};

buttonSetAction [1601,"call MRH_fnc_SpawnTarget;"];