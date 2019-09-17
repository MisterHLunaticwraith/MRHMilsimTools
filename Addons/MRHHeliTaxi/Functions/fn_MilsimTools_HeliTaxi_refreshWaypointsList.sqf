/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_refreshWaypointsList
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_refreshWaypointsList;
*/
#include "MRH_C_Path.hpp"
_list= FDIS(1500);
lbClear _list;
_setWaypoints = MRH_player GVARDef(setWaypoints,[]);
{
	_name = MarkerText _x;
	_pos = getMarkerPos _x;
	_posGridStr = [_pos] CFUNC(realisticGrid);
	_name = _name + " " +(localize "STR_MRH_HeliTaxi_medEvacGenGridColumn")+ " " +_posGridStr;
	_index = _list lbAdd _name;
	_list lbSetPicture [_index,PAAPATH(waypoint.paa)];
	_list lbSetPictureColor [_index,[0.85,0.85,0,1]];
	_list lbSetColor [_index,[0.85,0.85,0,1]];
}forEach _setWaypoints;
_color = getMarkerColor "MRH_LZ_Marker";
if (_color == "") ExitWith {};
	_pic = getText (configFile>>"cfgMarkers">> (getMarkerType "MRH_LZ_Marker")>>"icon");
	_name = MarkerText "MRH_LZ_Marker";
	_pos = getMarkerPos "MRH_LZ_Marker";
	_posGridStr = [_pos] CFUNC(realisticGrid);
	_name = _name + " " +(localize "STR_MRH_HeliTaxi_medEvacGenGridColumn")+ " " +_posGridStr;
	_index = _list lbAdd _name;
	_list lbSetPicture [_index,_pic];//PAAPATH(heli.paa)
	_list lbSetPictureColor [_index,[0,0.8,0,1]];
	_list lbSetColor [_index,[0,0.8,0,1]];