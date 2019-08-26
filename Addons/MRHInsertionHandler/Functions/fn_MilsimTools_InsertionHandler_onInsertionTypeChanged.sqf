/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_;
*/
#include "MRH_C_Path.hpp"
#include "displays.sqf"
deleteMarkerLocal "MRH_LZ_Marker";
_selectedType = FUNC(getInsertionType);
_toToggle = [1111,1502,1503,1603,1604];
switch (true) do {
	case (_selectedType == "Standard") : 
	{
		{ctrlShow [_x,true]} forEach _toToggle;
		{ctrlShow [_x,true]} forEach [1000,1103,2100];
		_AltitudeText ctrlSetStructuredText parseText (localize "STR_MRH_MRHInsertionHandler_DesiredAltIntel");
		_selectVehText ctrlSetStructuredText parseText (localize "STR_MRH_MRHInsertionHandler_selectInsertVeh");
		_altitudeEnterEdit ctrlSetText "500";
	};
	case (_selectedType == "Halo") : 
	{
		{ctrlShow [_x,true]} forEach _toToggle;
		{ctrlShow [_x,true]} forEach [1000,1103];
		ctrlShow [2100,false];
		_selectVehText ctrlSetStructuredText parseText (localize "STR_MRH_MRHInsertionHandler_ComboVirtualPlane");
		_AltitudeText ctrlSetStructuredText parseText (localize "STR_MRH_MRHInsertionHandler_ComboAutoOpenAlt");
		_altitudeEnterEdit ctrlSetText "150";
	};
	case (_selectedType == "Submarine") : 
	{
		{ctrlShow [_x,false]} forEach _toToggle;
		{ctrlShow [_x,false]} forEach [1000,1103];
		ctrlShow [2100,false];
		_selectVehText ctrlSetStructuredText parseText (localize "STR_MRH_MRHInsertionHandler_ComboTwoSDVs");
	};
};
FUNC(refreshLists);