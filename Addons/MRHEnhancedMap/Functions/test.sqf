[] spawn {  
 while {player getVariable ["MRH_EnhancedMap_FoldedMapDisplayOpen",false]} do   
 {  
 private _light = [[player],{call ACE_map_fnc_determineMapLight}, missionNamespace,"ace_map_maplight", 0.1] call ace_common_fnc_cachedCall;
 _light params ["_applyLighting", "_lightLevel"];


  _display = uiNamespace getVariable "MRHFoldMap";  
  _ctrl = (_display displayCtrl 1100);  
  _mapZoomlevel = ["MRH_MilsimTools_Map_ZoomRatio"] call cba_settings_fnc_get;  
  _currentMapCenter = player getVariable ['MRH_EHMAP_Mapsection',[worldSize/2, worldsize/2,0]];  
    if (_applyLighting) then 
	{
        [_ctrl,_mapZoomlevel,_currentMapCentre,_lightLevel] call ace_map_fnc_simulateMapLight;
	};
 
 };  
  
};