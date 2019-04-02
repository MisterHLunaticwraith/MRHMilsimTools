/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_EnhancedMap_mapIllumination;
*/
#include "MRH_C_Path.hpp"

 _useAceLighting = ["MRH_MilsimTools_Map_FoldUseAceLight"] call cba_settings_fnc_get;
 if !(_useAceLighting) ExitWith {};

 _condition = {MRH_player getVariable ["MRH_EnhancedMap_FoldedMapDisplayOpen",false]}; 
_codeToRun =	{
		_determineMapLight = [MRH_player] call ACE_map_fnc_determineMapLight;
		_needsApply = _determineMapLight select 0;
		if !(_needsApply) ExitWith {};
		_lightLevel = _determineMapLight select 1;
		_display = uiNamespace getVariable "MRHFoldMap";
		_ctrl = (_display displayCtrl 1100);
		_mapZoomlevel = ["MRH_MilsimTools_Map_ZoomRatio"] call cba_settings_fnc_get;
		_currentMapCenter = MRH_player getVariable ['MRH_EHMAP_Mapsection',[worldSize / 2, worldsize / 2, 0]];
		_lightLevel = [(_lightLevel select 0),(_lightLevel select 1),(_lightLevel select 2),(_lightLevel select 3)];
		[_ctrl,_mapZoomlevel,_currentMapCenter,_lightLevel] call ace_map_fnc_simulateMapLight;
		[_ctrl,_mapZoomlevel,_currentMapCenter,_lightLevel] call ace_map_fnc_simulateMapLight; //for some reason I need to call this twice to get the desired effect
	};

[_codeToRun,[],{},_condition] CFUNC(conditionalPFEH);

