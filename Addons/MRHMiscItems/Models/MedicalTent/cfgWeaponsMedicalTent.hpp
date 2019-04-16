

class MRH_FoldedMedicalTent : CBA_MiscItem
{
	author = "Mr H.";
	displayName = $STR_MRH_MRHMiscItems_FieldMedicTentVehicleDisp;
	scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
	model = "\A3\Structures_F\Civ\Camping\Sleeping_bag_folded_F.p3d"; //model = "\A3\Structures_F\Civ\Camping\Ground_sheet_folded_khaki_F.p3d";
	//hiddenSelectionsTextures[] = {"\A3\Structures_F_Mark\Training\Data\ShootingMat_01_Khaki_CO.paa"};

	picture = "\MRHMiscItems\Models\MedicalTent\medicalTentInv_ca.paa";
	descriptionShort = $STR_MRH_MRHMiscItems_DescWPMedicalTent;
	//type = 0;
	ace_arsenal_hide = 0;
	class ItemInfo: CBA_MiscItem_ItemInfo
			{
				mass= 124;//en lb*10
			};

};