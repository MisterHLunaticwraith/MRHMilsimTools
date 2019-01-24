class MRHAttributeDataMenu
{
	idd=200119;
   
	movingenable=true;
    onUnLoad = "((findDisplay 200119) getVariable ['MRH_ZeusModules_displayparams',[objNull,objNull]]) params ['_logic','_unit']; deleteVehicle _logic;";
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Zuhypu)
////////////////////////////////////////////////////////
#include "dataPreviewer.hpp"
class MRHBack: IGUIBackMRHZeusModules
{
	idc = 2201;
	x = 0.12875 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.525937 * safezoneW;
	h = 0.374 * safezoneH;
};
class MRHAttributeDataTitle: RscTextMRHZeusModules
{
	idc = 1000;
	text = $STR_MRH_MRHMRHZeusModules_ATTDATATOPLAYOBJTITLE; //--- ToDo: Localize;
	x = 0.133906 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHTipTextBox: RscTextMRHZeusModules
{
	idc = 1001;
    style = 16;
	text = $STR_MRH_MRHMRHZeusModules_ATTDATATIP; //--- ToDo: Localize;
	x = 0.144219 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.308 * safezoneH;
};
class MRHDataToAddListBox: RscListboxMRHZeusModules
{
	idc = 1500;
	x = 0.262812 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.319 * safezoneH;
};
class MRHDataToAddTitle: RscTextMRHZeusModules
{
	idc = 1002;
	text = $STR_MRH_MRHMRHZeusModules_DATATOADDCOL; //--- ToDo: Localize;
	x = 0.262812 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHPicsToAddPile: RscListboxMRHZeusModules
{
	idc = 1501;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.319 * safezoneH;
};
class MRHPicsToAddTitle: RscTextMRHZeusModules
{
	idc = 1003;
	text = $STR_MRH_MRHMRHZeusModules_PICTURESTOADDCOL; //--- ToDo: Localize;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAddDaraFromSelector: RscButtonMRHZeusModules
{
	idc = 1600;
	text = $STR_MRH_MRHMRHZeusModules_ADDDATATOPILE; //--- ToDo: Localize;
	action = "[200119,1500]call MRH_fnc_MilsimTools_ZeusModules_addDataToListBox";
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHRmvDataFromPileButton: RscButtonMRHZeusModules
{
	idc = 1601;
	text = $STR_MRH_MRHMRHZeusModules_REMOVEDATAFROMPILE; //--- ToDo: Localize;
	action = "[200119,1500]call MRH_fnc_MilsimTools_ZeusModules_removeDataFromListBox";
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHAddPicToPileButton: RscButtonMRHZeusModules
{
	idc = 1602;
	text = $STR_MRH_MRHMRHZeusModules_ADDSELPICPILE; //--- ToDo: Localize;
	action = "[200119,1501,false]call MRH_fnc_MilsimTools_ZeusModules_addDataToListBox";
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHRemovePicFPileButton: RscButtonMRHZeusModules
{
	idc = 1603;
	text = $STR_MRH_MRHMRHZeusModules_REMOVESELPICPILE; //--- ToDo: Localize;
	action = "[200119,1501]call MRH_fnc_MilsimTools_ZeusModules_removeDataFromListBox";
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHAddButton: RscButtonMRHZeusModules
{
	idc = 1604;
	text = $STR_MRH_MRHMRHZeusModules_GENADD; //--- ToDo: Localize;
	action ="call MRH_fnc_MilsimTools_ZeusModules_attributeDataModuleAction";
	x = 0.453594 * safezoneW + safezoneX;
	y = 0.786 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.055 * safezoneH;
};
class MRHCancelButton: RscButtonMRHZeusModules
{
	idc = 1605;
	text = $STR_MRH_MRHMRHZeusModules_GENCANCEL; //--- ToDo: Localize;
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.786 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.055 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};