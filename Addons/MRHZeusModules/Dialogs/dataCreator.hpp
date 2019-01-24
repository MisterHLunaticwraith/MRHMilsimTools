class MRHDataCreator
{
	idd=220119;
   
	movingenable=true;
    onLoad = "[] spawn MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnLoad";
    onUnLoad = "[findDisplay 220119] call MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnUnLoad";
    
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Tyjibu)
////////////////////////////////////////////////////////
#include "dataPreviewer.hpp"
class MRHBack: IGUIBackMRHZeusModules
{
	idc = 2201;
	x = 0.288594 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.422812 * safezoneW;
	h = 0.462 * safezoneH;
};
class MRHDataNameTitle: RscTextMRHZeusModules
{
	idc = 1000;
	text = $STR_MRH_MRHMRHZeusModules_GENDATANAME; //--- ToDo: Localize;
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.885 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHGenDataDisplayName: RscTextMRHZeusModules
{
	idc = 1001;
	text = "SomeDataName"; //--- ToDo: Localize;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.907 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHNewDataTitleTitle: RscTextMRHZeusModules
{
	idc = 1002;
	text = $STR_MRH_MRHMRHZeusModules_TITLECOL; //--- ToDo: Localize;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHDataTitleEdit: RscEditMRHZeusModules
{
	idc = 1400;
    onChar = "call MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnCharRefresh";
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.2475 * safezoneW;
	h = 0.022 * safezoneH;
    colorText[] = {0.678,0.6,0.533,1};
};
class MRHDataEntryTitle: RscTextMRHZeusModules
{
	idc = 1003;
   
	text = $STR_MRH_MRHMRHZeusModules_TEXTCOL; //--- ToDo: Localize;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHDataTextEdit: RscEditMRHZeusModules
{
	idc = 1401;
    onChar = "call MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnCharRefresh";
    colorText[] = {0.678,0.6,0.533,1}; 
    style = ST_MULTI;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.2475 * safezoneW;
	h = 0.385 * safezoneH;
};
class MRHHelpersTitle: RscTextMRHZeusModules
{
	idc = 1004;
	text = $STR_MRH_MRHMRHZeusModules_HELPERSCOLTEXT; //--- ToDo: Localize;
	x = 0.597969 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAddLineBreakHelper: RscButtonMRHZeusModules
{
	idc = 1600;
    action = "_text = ctrlText 1401; _text = _text + '<br/>';ctrlSetText [1401, _text];call MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnCharRefresh";
	text = $STR_MRH_MRHMRHZeusModules_ADDLINEBREAK; //--- ToDo: Localize;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHInsertSelPicHelper: RscButtonMRHZeusModules
{
	idc = 1601;
    action = "call MRH_fnc_MilsimTools_ZeusModules_insertPictureMarkup;call MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnCharRefresh";
	text = $STR_MRH_MRHMRHZeusModules_INSERTPICFRPRV; //--- ToDo: Localize;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHInsertRedText: RscButtonMRHZeusModules
{
	idc = 1602;
	text = $STR_MRH_MRHMRHZeusModules_INSREDCOLMU; //--- ToDo: Localize;
    action = "['RED'] call MRH_fnc_MilsimTools_ZeusModules_insertMarkUp;call MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnCharRefresh";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHInsertGreenText: RscButtonMRHZeusModules
{
	idc = 1603;
    action = "['GREEN'] call MRH_fnc_MilsimTools_ZeusModules_insertMarkUp;call MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnCharRefresh";
	text = $STR_MRH_MRHMRHZeusModules_INSGREENCOLMU; //--- ToDo: Localize;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHInsertUnderlined: RscButtonMRHZeusModules
{
	idc = 1604;
	text = $STR_MRH_MRHMRHZeusModules_INSEUNLMU; //--- ToDo: Localize;
    action = "['LINED'] call MRH_fnc_MilsimTools_ZeusModules_insertMarkUp;call MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnCharRefresh";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHInsertHtml: RscButtonMRHZeusModules
{
	idc = 1605;
	text = $STR_MRH_MRHMRHZeusModules_INSHTMLMU; //--- ToDo: Localize;
    action = "['URL'] call MRH_fnc_MilsimTools_ZeusModules_insertMarkUp;call MRH_fnc_MilsimTools_ZeusModules_dataCreatorOnCharRefresh";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.786 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHCreateDataButton: RscButtonMRHZeusModules
{
	idc = 1606;
	text = $STR_MRH_MRHMRHZeusModules_CREATEDATAENTRY; //--- ToDo: Localize;
    action = "call MRH_fnc_MilsimTools_ZeusModules_dataCreatorCreateDataAction";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.841 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHCloseButton: RscButtonMRHZeusModules
{
	idc = 1607;
	text = $STR_MRH_MRHMRHZeusModules_GENCLOSE; //--- ToDo: Localize;
    action = "closeDialog  0";
	x = 0.639219 * safezoneW + safezoneX;
	y = 0.841 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.033 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};