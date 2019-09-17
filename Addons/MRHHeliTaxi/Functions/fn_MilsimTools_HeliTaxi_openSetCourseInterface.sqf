/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_openSetCourseInterface;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_openSetCourseInterface;
*/
#include "MRH_C_Path.hpp"

_isAlreadyOpened = (group MRH_player) GVARDef(someoneIsSettingCourse,false);
if (_isAlreadyOpened) exitWith {hintC (localize "STR_MRH_HeliTaxi_SomeoneIsSettingAlready")};
(group MRH_player)SVAR(someoneIsSettingCourse,true,true);
_handle = createdialog "MRHHeliTaxiWayPoints";
hint (localize "STR_MRH_HeliTaxi_HintCreateIntermediate");
#include "dialogRefsSetCourse.hpp"
_waypointTypes = [
	[(localize "STR_MRH_HeliTaxi_medEvacWPNameLandAndDrop"),"MRH_heli","\MRHMarkers\paa\heli.paa"],
	[(localize "STR_MRH_HeliTaxi_medEvacWPNameLandAndWait"),"MRH_wait","\MRHMarkers\paa\wait.paa"],
	[(localize "STR_MRH_HeliTaxi_medEvacWPNameLoiter"),"MRH_loiter","\MRHMarkers\paa\loiter.paa"],
	[(localize "STR_MRH_HeliTaxi_medEvacWPNameHoverAndWait"),"MRH_pause","\MRHMarkers\paa\pause.paa"]
	
	
];
if ([(typeOf (vehicle MRH_Player))]FUNC(canReceiveFries)) then {_waypointTypes pushBackUnique [(localize "STR_MRH_HeliTaxi_medEvacWPNameFastRope"),"MRH_rope","\MRHMarkers\paa\fastrope.paa"]};
{
	_x params ["_prettyName","_data","_picture"];
	_index = _comboWP lbAdd _prettyName;
	_comboWP lbSetData [_index,_data];
	_comboWP lbSetPicture [_index,_picture];
}forEach _waypointTypes;
_comboWP lbSetCurSel 0;
[_comboWP,0] FUNC(onFinalWayPointTypeChanged);