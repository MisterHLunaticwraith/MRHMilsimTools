/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_EnhancedMap_;
*/
#include "MRH_C_Path.hpp"
_display = uiNamespace getVariable "MRHFoldMap";
_ctrl = (_display displayCtrl 1100);
_zoomRatio = ["MRH_MilsimTools_Map_ZoomRatio"] call cba_settings_fnc_get;
_ctrl ctrlmapAnimAdd [0, _zoomRatio, MRH_player getVariable ['MRH_EHMAP_Mapsection',[worldSize / 2, worldsize / 2, 0]]]; 
ctrlmapAnimCommit _ctrl;
FUNC(playRandomSound);