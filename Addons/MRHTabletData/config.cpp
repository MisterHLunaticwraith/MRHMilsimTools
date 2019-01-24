
class CfgPatches {
	class MRHTabletData{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};
#include "\MRHTabletData\MRH_components.hpp"
class MRH_SoldierTabData
{
	#include "\MRHTabletData\tabletData.hpp"
};
class MRH_SoldierTabIntelPictures
{
	#include "\MRHTabletData\tabletPictures.hpp"
};