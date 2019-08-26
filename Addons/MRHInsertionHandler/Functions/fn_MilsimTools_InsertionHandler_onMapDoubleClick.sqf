/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_onMapDoubleClick
Author: Mr H.
Description: if map ctrl is double clicked, returns the clicked zone, converts it from screen tom map coords and creates a marker on clicked pos
Return value: None
Public:No
Parameters:
passed from onMouseDoubleClick eventHandler, only 0,2 and 3 are actually used in this function
Example(s):
_this call MRH_fnc_MilsimTools_InsertionHandler_onMapDoubleClick;
*/
#include "MRH_C_Path.hpp"

params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

_pos= _control ctrlMapScreenToWorld [_xPos,_yPos];

deleteMarkerLocal "MRH_LZ_Marker";


_selectedType = FUNC(getInsertionType);

switch (true) do {
	case (_selectedType == "Standard") : 
	{
		_marker = createMarkerLocal ["MRH_LZ_Marker", _pos];
		_marker setMarkerTypeLocal "MRH_paradrop";
		_marker setMarkerTextLocal (localize "STR_MRH_HeliTaxi_MarkerSelectedLz");
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerAlphaLocal 1;
		hint localize "STR_MRH_HeliTaxi_HintLZSet";
	};
	case (_selectedType == "Halo") : 
	{
		_marker = createMarkerLocal ["MRH_LZ_Marker", _pos];
		_marker setMarkerTypeLocal "MRH_paradrop";
		
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerAlphaLocal 1;
		_ASL = AGLToASL (getMarkerPos ["MRH_LZ_Marker", true]);
		_altitude = round (_ASL select 2);
		_marker setMarkerTextLocal ((localize "STR_MRH_HeliTaxi_MarkerSelectedLz")+ " " + (format [(localize "STR_MRH_MRHInsertionHandler_LZASLmarkerInfo"),_altitude]));
		hint localize "STR_MRH_HeliTaxi_HintLZSet";

	};
	case (_selectedType == "Submarine") : 
	{
		_canDeploy = [_pos] FUNC(canDeploySub);
		_canDeploy params ["_canDo","_reason"];
		if !(_canDo) then
		{
				_marker = createMarkerLocal ["MRH_LZFAIL_Marker", _pos];
			_marker setMarkerTypeLocal "MRH_IH_NO_GO";
			
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerAlphaLocal 1;
			_marker setMarkerTextLocal _reason;
			[] spawn {sleep 3; deleteMarkerLocal "MRH_LZFAIL_Marker"};
		} 
		else
		{
			_marker = createMarkerLocal ["MRH_LZ_Marker", _pos];
			_marker setMarkerTypeLocal "MRH_Submarine";
			
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerAlphaLocal 1;
			_marker setMarkerTextLocal _reason;
			hint localize "STR_MRH_HeliTaxi_HintLZSet";

		};


	};
};




[]spawn {
_mapCtrl = FDIS(1200);
waitUntil {!(ctrlShown _mapCtrl)};
deleteMarkerLocal "MRH_LZ_Marker";
};
FUNC(checkListUpdate);