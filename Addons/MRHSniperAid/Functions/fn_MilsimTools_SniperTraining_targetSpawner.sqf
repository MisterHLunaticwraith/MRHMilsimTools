/*
Function name:MRH_fnc_MilsimTools_SniperTraining_targetSpawner
Author: Mr H.
Description: Opens and fills the spawner interface
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_SniperTraining_targetSpawner;
*/
#include "MRH_C_Path.hpp"
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

_index = lbAdd [1500,(localize "STR_MRH_SniperTraining_Distance") +" "+ (str round _distance)+" "+ (localize "STR_MRH_SniperTraining_Meters")];
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

//_allTargets = getarray (missionconfigfile>>"cfgMRHTargets">> "allTargets");
_allTargets = [(missionconfigFile >> "cfgMRHTargets")]call BIS_fnc_getCfgSubClasses;
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
_allBehaviours = [["BLUE", (localize "STR_MRH_SniperTraining_NeverFire")],["GREEN",(localize "STR_MRH_SniperTraining_FireWhenFiredUpon")],["WHITE",(localize "STR_MRH_SniperTraining_OnlyInDanger")],["YELLOW",(localize "STR_MRH_SniperTraining_FireAtWill")],["RED",(localize "STR_MRH_SniperTraining_FireAtWillEngageAtWill")]];
{
private ["_index"];
_index = lbadd [2101, _x select 1];
lbSetData [2101,_index, _x select 0];
} forEach _allBehaviours;

_allSpeedModes = [["LIMITED",(localize "STR_MRH_SniperTraining_Limited")],["NORMAL",(localize "STR_MRH_SniperTraining_Normal")],["FULL",(localize "STR_MRH_SniperTraining_Fast")]];

{
private ["_index"];
_index = lbadd [2102, _x select 1];
lbSetData [2102,_index, _x select 0];
} forEach _allSpeedModes;
//onEachFrame {systemChat  lbData [2102,lbCurSel 2102];};

buttonSetAction [1601,"call MRH_fnc_MilsimTools_SniperTraining_SpawnTarget;"];