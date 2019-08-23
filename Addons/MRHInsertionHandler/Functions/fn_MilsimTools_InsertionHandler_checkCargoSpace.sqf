/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_checkCargoSpace
Author: Mr H.
Description: Checks if there is cargo space left in the currently selected vehicle depending on currently loaded passengers and cargo
Return value: true if space left, false is vehicle capacity exceeded
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_checkCargoSpace;
*/
#include "MRH_C_Path.hpp"
_selectedType = FUNC(getInsertionType);
switch (true) do {
	case (_selectedType == "Standard") : 
	{
		_planeType = lbData [2100,(lbCurSel 2100)];
		_cargoSPace = ([_planeType]FUNC(readVehicleCfg)) select 1;
		_currentAssigned = MRH_player GVARDef(playersToGo,[]);
		_cargoItemsLoaded = (FUNC(sortGear)) select 0;
		_cargoCount = (count _cargoItemsLoaded)*3;
		if (((count _currentAssigned)+_cargoCount)>= _cargoSPace +1) ExitWith {false};
		true
	};
	case (_selectedType == "Halo") : 
	{
		_cargoSPace = 20;
		_currentAssigned = MRH_player GVARDef(playersToGo,[]);
		_cargoItemsLoaded = (FUNC(sortGear)) select 0;
		_cargoCount = (count _cargoItemsLoaded)*3;
		if (((count _currentAssigned)+_cargoCount)>= _cargoSPace +1) ExitWith {false};
		true
	};
	case (_selectedType == "Submarine") : 
	{
		_currentAssigned = MRH_player GVARDef(playersToGo,[]);
		if ((count _currentAssigned )>8) exitWith {false};
		true
	};
};
