
class CfgPatches {
	class MRHCustomAdminMenu{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};

#include "\MRHAdminMenu\dialogs\defines.hpp"
#include "\MRHAdminMenu\dialogs\AdminMenu.hpp"

class cfgFunctions
{
	#include "\MRHAdminMenu\functions\cfgFunctions.hpp"
};
#include "\MRHAdminMenu\cfgMRHPunishments.hpp"
class CfgDebriefing
{
	class MRH_DefaultAdminEndMission
	{
		title = $STR_MRH_ADM_DEB_ADMINTEMINATED;
		subtitle = "";
		description = $STR_MRH_ADM_DEB_ADMINTEMINATED;
		picture = "MRHAdminMenu\paa\mrh.paa";

	};
};
	class CfgMarkerClasses
	{
		class MRHMilsimToolsMarkers //temp move to main
		{
		displayName = "MRH Markers";
		};
	};
class cfgMarkers
{
		class MRH_Admin_PositionMarker
	{
		name = "PlayerPos";
		markerClass = "MRHMilsimToolsMarkers";
		icon = "\MRHAdminMenu\paa\location.paa";
		color[] = {1, 1, 1, 1};
		size = 32;
		shadow = 1;
		scope = 0;
	};
};
class CfgUnitInsignia
{
	class MRH_reset
	{
		author = "";
		displayName = "";
		texture = "";
	};
};
