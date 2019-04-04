//	#include "MRH_C_Path.hpp"
//declare parents here
class Items_base_F;
class Static;
class ShootingMat_01_folded_Olive_F;
class ShootingMat_01_folded_Khaki_F;
class ShootingMat_01_Olive_F;
class ShootingMat_01_Khaki_F;
//include items here
#include "\MRHMiscItems\Models\ElevatorButton\ElevatorButton.hpp"
#include "\MRHMiscItems\Models\UsbThumbDrive\usbDrive.hpp"
#include "\MRHMiscItems\Models\BioScanner\bioscanner.hpp"
#include "\MRHMiscItems\Models\ShootingMats\shootingmats.hpp"

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
			};

		};
	};