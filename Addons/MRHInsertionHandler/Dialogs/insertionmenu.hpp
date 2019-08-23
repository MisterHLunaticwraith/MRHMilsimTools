#include "defines.hpp"
#include "MRH_C_Path.hpp"
class MRHInsertionInterface
{
	idd=15082018;
	movingenable=true;
	
	class controls 
	{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Lymexe)
////////////////////////////////////////////////////////

class MRHBack: IGUIBackMRHInsertionInterface
{
	idc = 2200;
	x = 7.37607e-008 * safezoneW + safezoneX;
	y = -4.91738e-008 * safezoneH + safezoneY;
	w = 1.00547 * safezoneW;
	h = 1.001 * safezoneH;
};
class MRHSelectInfo: RscStructuredTextMRHInsertionInterface
{
	idc = 1100;
	text = $STR_MRH_MRHInsertionHandler_SelectinsertPoint; //--- ToDo: Localize;
	x = 0.12875 * safezoneW + safezoneX;
	y = 0.00500001 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHMapZone: RscMapControlMRHInsertionInterface
{
	idc = 1200;
    onMouseButtonDblClick = "_this call MRH_fnc_MilsimTools_InsertionHandler_onMapDoubleClick;";
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.128751 * safezoneW + safezoneX;
	y = 0.038 * safezoneH + safezoneY;
	w = 0.443438 * safezoneW;
	h = 0.946 * safezoneH;
};
class MRHSelectVehInfo: RscStructuredTextMRHInsertionInterface
{
	idc = 1101;
	text = $STR_MRH_MRHInsertionHandler_selectInsertVeh; //--- ToDo: Localize;
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.049 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHSelectVehCombo: RscComboMRHInsertionInterface
{
	idc = 2100; 
    onLbSelChanged = "call MRH_fnc_MilsimTools_InsertionHandler_fillPlayersToGoList;";
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.071 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAvailablecargoslotsText: RscStructuredTextMRHInsertionInterface
{
	idc = 1102;
	text = $STR_MRH_MRHInsertionHandler_AvailCGSlotsIntel; //--- ToDo: Localize;
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.093 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHSelectAltitudeText: RscStructuredTextMRHInsertionInterface
{
	idc = 1103;
	text = $STR_MRH_MRHInsertionHandler_DesiredAltIntel; //--- ToDo: Localize;
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.137 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAltitudeField: RscEditMRHInsertionInterface
{
	idc = 1000;
	text = "500"; //--- ToDo: Localize;
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.159 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHStartInsertButton: RscButtonMRHInsertionInterface
{
	idc = 1600;
	text = $STR_MRH_MRHInsertionHandler_startInsertionBtton; //--- ToDo: Localize;
    action = "call MRH_fnc_MilsimTools_InsertionHandler_startInsertion;";
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.918 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.033 * safezoneH;
};
class RscControlsGroup_2300: RscControlsGroupMRHInsertionInterface
{
	idc = 2300;
	moving = true;
    x = -0.000156274 * safezoneW + safezoneX;
    y = 0.203 * safezoneH + safezoneY;
    w = 0.128906 * safezoneW;
    h = 0.715 * safezoneH;
	class Controls
	{
        class MRHFlightChecList: RscStructuredTextMRHInsertionInterface
        {
            idc = 1104;
            text = ""; //--- ToDo: Localize;
            x = 0;
            y = 0;
            w = 0.128906 * safezoneW;
            h = 0.715 * safezoneH;
        };
    };
}
class MRHCecklistTitle: RscStructuredTextMRHInsertionInterface
{
	idc = 1105;
	text = $STR_MRH_MRHInsertionHandler_InsertionChecListTitle; //--- ToDo: Localize;
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.181 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHSelectInsertionTypeCombo: RscComboMRHInsertionInterface
{
	idc = 2101;
	show = true;//for later devs
	onLbSelChanged = "call MRH_fnc_MilsimTools_InsertionHandler_onInsertionTypeChanged";
	x = -0.0104688 * safezoneW + safezoneX;
	y = 0.027 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHSelectInsertionTypeText: RscStructuredTextMRHInsertionInterface
{
	idc = 1106;
	show = true;//for later devs
	text = $STR_MRH_MRHInsertionHandler_MenuSelectInsertTypeTitle; //--- ToDo: Localize;
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.00500001 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHPersonelChoiceInfo: RscStructuredTextMRHInsertionInterface
{
	idc = 1107;
	text = $STR_MRH_MRHInsertionHandler_PerToInsertTitle; //--- ToDo: Localize;
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.00500001 * safezoneH + safezoneY;
	w = 0.422812 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHPersonelToAdd: RscStructuredTextMRHInsertionInterface
{
	idc = 1108;
	text = $STR_MRH_MRHInsertionHandler_persToAddFlight; //--- ToDo: Localize;
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.038 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHSelectGrpInfo: RscStructuredTextMRHInsertionInterface
{
	idc = 1109;
	text = $STR_MRH_MRHInsertionHandler_selectGrpTitle; //--- ToDo: Localize;
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.06 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHSelectGrpCombo: RscComboMRHInsertionInterface
{
	idc = 2102;
    onLbSelChanged = "call MRH_fnc_MilsimTools_InsertionHandler_fillPlayersToAddList;";
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.082 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscControlsGroup_2301: RscControlsGroupMRHInsertionInterface
{
	idc = 2301;
	moving = true;
    x = 0.572187 * safezoneW + safezoneX;
    y = 0.104 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.495 * safezoneH;

    class Controls
	{
        class MRHSelectedGrpListBox: RscListboxMRHInsertionInterface
        {
            idc = 1500;
            x = 0;
            y = 0;
            w = 0.201094 * safezoneW;
            h = 0.495 * safezoneH;
        };
    };
};
class MRHPersonelOnboardInfo: RscStructuredTextMRHInsertionInterface
{
	idc = 1110;
	text = $STR_MRH_MRHInsertionHandler_perInInsertText; //--- ToDo: Localize;
	x = 0.773281 * safezoneW + safezoneX;
	y = 0.038 * safezoneH + safezoneY;
	w = 0.221719 * safezoneW;
	h = 0.066 * safezoneH;
};
class RscControlsGroup_2302: RscControlsGroupMRHInsertionInterface
{
	idc = 2302;
	moving = true;
    x = 0.773281 * safezoneW + safezoneX;
    y = 0.104 * safezoneH + safezoneY;
    w = 0.221719 * safezoneW;
    h = 0.495 * safezoneH;

    class Controls
	{
        class MRHOnboardListBox: RscListboxMRHInsertionInterface
        {
            idc = 1501;
            x = 0;
            y = 0;
            w = 0.221719 * safezoneW;
            h = 0.495 * safezoneH;
        };
    };
};
class MRHAddToPersonelButton: RscButtonMRHInsertionInterface
{
	idc = 1601;
	text = $STR_MRH_MRHInsertionHandler_addToPersButton; //--- ToDo: Localize;
    action = "call MRH_fnc_MilsimTools_InsertionHandler_addToPlayerListAction;";
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHRemoveFromPersonelButton: RscButtonMRHInsertionInterface
{
	idc = 1602;
	text = $STR_MRH_MRHInsertionHandler_remvFromPersButton; //--- ToDo: Localize;
    action = "call MRH_fnc_MilsimTools_InsertionHandler_removeFromPlayerListAction;";
	x = 0.773281 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.221719 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHExtraGear: RscStructuredTextMRHInsertionInterface
{
	idc = 1111;
	text = $STR_MRH_MRHInsertionHandler_extraGearExplanationInfo; //--- ToDo: Localize;
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.643 * safezoneH + safezoneY;
	w = 0.422812 * safezoneW;
	h = 0.044 * safezoneH;
};
class RscControlsGroup_2303: RscControlsGroupMRHInsertionInterface
{
	idc = 2303;
	moving = true;
    x = 0.572187 * safezoneW + safezoneX;
    y = 0.687 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.264 * safezoneH;

    class Controls
	{
        class MRHAvailableGearListBox: RscListboxMRHInsertionInterface
        {
            idc = 1502;
            x = 0;
            y = 0;
            w = 0.201094 * safezoneW;
            h = 0.264 * safezoneH;
        };
    };
};
class RscControlsGroup_2304: RscControlsGroupMRHInsertionInterface
{
	idc = 2304;
	moving = true;
    x = 0.773281 * safezoneW + safezoneX;
    y = 0.687 * safezoneH + safezoneY;
    w = 0.221719 * safezoneW;
    h = 0.264 * safezoneH;

    class Controls
	{
        class MRHGearOnboardListBox: RscListboxMRHInsertionInterface
        {
            idc = 1503;
            x = 0;
            y = 0;
            w = 0.221719 * safezoneW;
            h = 0.264 * safezoneH;
        };
    };
};
class MRHAddToGearButton: RscButtonMRHInsertionInterface
{
	idc = 1603;
	text = $STR_MRH_MRHInsertionHandler_BringOnBoardButt; //--- ToDo: Localize;
	action = "call MRH_fnc_MilsimTools_InsertionHandler_addToGearListAction;";
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.951 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHRemoveFromBoardButton: RscButtonMRHInsertionInterface
{
	idc = 1604;
	action = "call MRH_fnc_MilsimTools_InsertionHandler_removeFromGearListAction;";
	text = $STR_MRH_MRHInsertionHandler_RmvFromCGButton; //--- ToDo: Localize;
	x = 0.773281 * safezoneW + safezoneX;
	y = 0.951 * safezoneH + safezoneY;
	w = 0.221719 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHCancelButton: RscButtonMRHInsertionInterface
{
	idc = 1605;
	text = $STR_MRH_MRHInsertionHandler_Cancel; //--- ToDo: Localize;
    action = "closedialog 0";
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.951 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.033 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
    };
};