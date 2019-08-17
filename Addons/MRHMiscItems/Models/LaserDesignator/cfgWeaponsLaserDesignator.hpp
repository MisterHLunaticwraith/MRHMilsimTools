class MRH_laser_designator: CBA_MiscItem
{
	author = "Mr H.";
	displayName = $STR_MRH_MRHMiscItems_LaserDesignatorFolded;
	scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
	
	//hiddenSelectionsTextures[] = {"\A3\Structures_F_Mark\Training\Data\ShootingMat_01_Khaki_CO.paa"};

	picture = "\MRHMiscItems\Models\LaserDesignator\LaserDesignatorInv_ca.paa";
	descriptionShort = $STR_MRH_MRHMiscItems_LaserDesignatorDesc;
	//type = 0;
	ace_arsenal_hide = 0;
	class ItemInfo: CBA_MiscItem_ItemInfo
			{
				mass= 128;//en lb*10
			};

};