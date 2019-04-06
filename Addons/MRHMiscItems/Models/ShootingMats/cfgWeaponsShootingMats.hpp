class MRH_ShootingMat_Base: CBA_MiscItem
{
	author = "Mr H.";
	displayName = "Shooting Mat";
	scope = 0;      
	scopeArsenal = 0;
	scopeCurator = 0;
	model = "\A3\Structures_F_Mark\Training\ShootingMat_01_folded_F.p3d";
	hiddenSelectionsTextures[] = {"\A3\Structures_F_Mark\Training\Data\ShootingMat_01_Khaki_CO.paa"};

	picture = "\MRHMiscItems\Models\ShootingMats\Data\ShootingMat_Khaki_ca.paa";
	descriptionShort = $STR_MRH_MRHMiscItems_SMDesShort;
	//type = 0;
	ace_arsenal_hide = 1;
	class ItemInfo: CBA_MiscItem_ItemInfo
			{
				mass= 62;//en lb*10
			};

};

class MRH_ShootingMat_Khaki : MRH_ShootingMat_Base
{
	displayName = $STR_MRH_MRHMiscItems_SMkhakiDisplay;
	scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
	ace_arsenal_hide = 0;

};

class MRH_ShootingMat_Olive : MRH_ShootingMat_Khaki
{
	displayName = $STR_MRH_MRHMiscItems_SMoliveDisplay;
	picture = "\MRHMiscItems\Models\ShootingMats\Data\ShootingMat_Olive_ca.paa";
	hiddenSelectionsTextures[] = {"\A3\Structures_F_Mark\Training\Data\ShootingMat_01_Olive_CO.paa"};


};