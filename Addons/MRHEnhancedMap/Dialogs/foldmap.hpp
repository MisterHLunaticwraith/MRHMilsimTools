#include "defines.hpp"
#include "MRH_C_Path.hpp"
class RscTitles
{
	class MRHFoldMap
	{
		idd=050818;
		movingenable=false;
		onLoad = "uiNamespace setVariable ['MRHFoldMap', _this select 0];_display = _this select 0;_ctrl = (_display displayCtrl 1100);_zoomRatio = ['MRH_MilsimTools_Map_ZoomRatio'] call cba_settings_fnc_get;_ctrl ctrlmapAnimAdd [0, _zoomRatio, MRH_player getVariable ['MRH_EHMAP_Mapsection',[worldSize / 2, worldsize / 2, 0]]]; ctrlmapAnimCommit _ctrl; MRH_player setVariable ['MRH_EnhancedMap_FoldedMapDisplayOpen',true];call MRH_fnc_MilsimTools_EnhancedMap_mapIllumination";
		
		
		duration = "99999999";
		class controlsBackground
		{
			class MRHFoldMap: RscMapControlMRHEnhancedMap
			{
				idc = 1100;
				
				x = 0.742344 * safezoneW + safezoneX;
				y = 0.5 * safezoneH + safezoneY;
				w = 0.252656 * safezoneW;
				h = 0.495 * safezoneH;
			};
		};
		class controls 
		{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Rukege)
////////////////////////////////////////////////////////



class MRHFoldMapOverlay: RscPictureMRHEnhancedMap
{
	idc = 1200;
	text = PAAPATH(mapinterface.paa);
	x = 0.742344 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.252656 * safezoneW;
	h = 0.495 * safezoneH;

};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
		};
	};
};
/*
050818 cutRsc ["MRHFoldMap", "PLAIN"]; 
_display = uiNamespace getVariable "MRHFoldMap";
///
_display = uiNamespace getVariable "MRHFoldMap";
_display closedisplay 2;
*/