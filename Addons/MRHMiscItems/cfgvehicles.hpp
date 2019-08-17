#define mag_xx(a,b) class _xx_##a {magazine = a; count = b;}
#define weap_xx(a,b) class _xx_##a {weapon = a; count = b;}
#define item_xx(a,b) class _xx_##a {name = a; count = b;}
#define backPack_xx(a,b) class _xx_##a {backpack = a; count = b;}
//	#include "MRH_C_Path.hpp"
//declare parents here
class Items_base_F;
class Static;
class ShootingMat_01_folded_Olive_F;
class ShootingMat_01_folded_Khaki_F;
class ShootingMat_01_Olive_F;
class ShootingMat_01_Khaki_F;
class Box_NATO_Ammo_F;
class B_supplyCrate_F;
class CargoNet_01_box_F;
class Camping_base_F;
class ACE_medicalSupplyCrate_advanced;
class B_Slingload_01_Cargo_F;
class B_W_Static_Designator_01_F;
//include items here
#include "\MRHMiscItems\Models\ElevatorButton\ElevatorButton.hpp"
#include "\MRHMiscItems\Models\UsbThumbDrive\usbDrive.hpp"
#include "\MRHMiscItems\Models\BioScanner\bioscanner.hpp"
#include "\MRHMiscItems\Models\ShootingMats\shootingmats.hpp"
#include "\MRHMiscItems\Models\MedicalTent\medicalTent.hpp"
#include "\MRHMiscItems\Models\Case\protectiveCase.hpp"

class Man;
    class CAManBase: Man 
	{

        class ACE_SelfActions 
		{
			class ACE_Equipment {

				class MRH_Ace_UnFoldShootingMatKhaki
				{
					displayName = $STR_MRH_MRHMiscItems_UnfoldSM;
					condition = "('MRH_ShootingMat_Khaki' in items MRH_player)";
					exceptions[] = {"isNotSitting"};
					statement = "['Khaki'] call MRH_fnc_MilsimTools_MiscItems_unfoldMat;";
					icon = "\MRHMiscItems\Models\ShootingMats\Data\ShootingMat_Khaki_ca.paa";
					
				};
				class MRH_Ace_UnFoldShootingMatOlive
				{
					displayName = $STR_MRH_MRHMiscItems_UnfoldSM;
					condition = "('MRH_ShootingMat_Olive' in items MRH_player)";
					exceptions[] = {"isNotSitting"};
					statement = "['Olive'] call MRH_fnc_MilsimTools_MiscItems_unfoldMat;";
					icon = "\MRHMiscItems\Models\ShootingMats\Data\ShootingMat_Olive_ca.paa";
					
				};

                class MRH_Ace_pitchMedicalTent
				{
					displayName = $STR_MRH_MRHMiscItems_AcePitchMedicalTent;
					condition = "('MRH_FoldedMedicalTent' in items MRH_player)";
					exceptions[] = {"isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_MiscItems_unfoldMedicalTent;";
					icon = "\MRHMiscItems\Models\MedicalTent\medicalTentInv_ca.paa";
					
				};

				class MRH_Ace_UnpackLaserDesignator
				{
					displayName = "Unpack laser designator";
					condition = "('MRH_laser_designator' in items MRH_player)";
					exceptions[] = {"isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_MiscItems_LaserDesignatorUnpack;";
					icon = "\MRHMiscItems\Models\LaserDesignator\LaserDesignatorInv_ca.paa";
					
				};
			};

		};
	};

	class MRH_emptyBox : Box_NATO_Ammo_F
{
    displayName = $STR_MRH_MRHMiscItems_EmptyAmmoCrate;
    editorCategory = "EdCat_MRH_Misc";
    editorSubcategory = "EdSubcat_MRH_Utilities";
    class TransportWeapons{};
	class TransportMagazines{};
	class TransportItems{};
};

class MRH_emptySupplyBox : B_supplyCrate_F
{
    displayName = $STR_MRH_MRHMiscItems_EmptySupplyBox;
    editorCategory = "EdCat_MRH_Misc";
    editorSubcategory = "EdSubcat_MRH_Utilities";
    class TransportWeapons{};
	class TransportMagazines{};
	class TransportItems{};
    class TransportBackpacks{};
	ace_cargo_size = 2;
    ace_cargo_canLoad = 1;
};

class MRH_AcexFoodSuppliesCrate : CargoNet_01_box_F
{
    displayName = $STR_MRH_MRHMiscItems_AcexFoodCrate;
    editorCategory = "EdCat_MRH_Misc";
    editorSubcategory = "EdSubcat_MRH_Utilities";
    class TransportWeapons{};
	class TransportMagazines{};
	class TransportItems
    {
        item_xx(ACE_Banana,15);
        item_xx(ACE_WaterBottle,10);
        item_xx(ACE_Canteen,10);
        item_xx(ACE_Can_Spirit,5);
        item_xx(ACE_Can_Franta,5);
        item_xx(ACE_Can_RedGull,5);
        item_xx(ACE_MRE_LambCurry,5);
        item_xx(ACE_MRE_BeefStew,5);
        item_xx(ACE_MRE_CreamTomatoSoup,5);
        item_xx(ACE_MRE_CreamChickenSoup,5);
        item_xx(ACE_MRE_ChickenTikkaMasala,5);
        item_xx(ACE_MRE_SteakVegetables,5);
        item_xx(ACE_MRE_MeatballsPasta,5);
        item_xx(ACE_MRE_ChickenHerbDumplings,5);
        item_xx(ACE_Humanitarian_Ration,5);
               
    };
    class TransportBackpacks{};
};

class MRH_FOB_container : B_Slingload_01_Cargo_F
{
	displayName = $STR_MRH_MRHMiscItems_BigFobContainerDispName;
    editorCategory = "EdCat_MRH_Misc";
    editorSubcategory = "EdSubcat_MRH_Utilities";
    class TransportWeapons{};
	class TransportMagazines{};
	class TransportItems{};
    class TransportBackpacks{};
	class EventHandlers {
		init = "[_this,'MainFob'] call MRH_fnc_MilsimTools_MiscItems_FOB_init;";
		
	};
};

class MRH_camp_container : MRH_emptySupplyBox
{
	displayName = $STR_MRH_MRHMiscItems_SmallCampContainerDispName;
	class EventHandlers {
		init = "[_this,'Camp'] call MRH_fnc_MilsimTools_MiscItems_FOB_init;";
		
	};
};

class MRH_laser_designator : B_W_Static_Designator_01_F //Static_Designator_01_base_F//
{
	displayName = $STR_MRH_MRHMiscItems_LaserDesignator;
	scope = 2;
	class UserActions {};
	crew = "C_UAV_AI_F";
	faction = "CIV_F";
	side = 3;
	//editorSubcategory = "EdSubcat_Turrets";
	class assembleInfo
	{
		assembleTo = "";
		base = "";
		displayName = "";
		primary = 0;
		dissasembleTo[] = {};
		
	};
	class EventHandlers {
		init = "[_this] call MRH_fnc_MilsimTools_MiscItems_LaserDesignatorInit;";
		
	};
};