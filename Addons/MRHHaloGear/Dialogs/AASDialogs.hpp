#include  "defines.hpp"
#include "MRH_C_Path.hpp"
class MRH_AAS_Cypres2Menu
{
	idd=211218;
	movingenable=false;
    onload = "";
    onUnload = "[_this] call MRH_fnc_MilsimTools_HaloGear_AADMenuAction";
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Manavu)
////////////////////////////////////////////////////////

class MRH_AAS_PicBack: RscPictureMRHHaloGear
{
	idc = 1200;
	text = PAAPATH(Cypres2AAS.paa);
	x = 0.7475 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.257813 * safezoneW;
	h = 0.099 * safezoneH;
};
class MRH_AAD_HeightInput: RscEditMRHHaloGear
{
	idc = 1400;
	text = "1234"; //--- ToDo: Localize;
	x = 0.778437 * safezoneW + safezoneX;
	y = 0.742 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRH_CloseButton: RscButtonMRHHaloGear
{
	idc = 1600;
    action = "closeDialog 0";
	x = 0.891875 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
    };
};