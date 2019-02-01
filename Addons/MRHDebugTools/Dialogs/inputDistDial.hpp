class MRHimputDistDial
{
	idd=330119;
    onLoad = "";

	
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Padyse)
////////////////////////////////////////////////////////

class MRHBack: IGUIBackMRHDebugTools
{
	idc = 2200;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.099 * safezoneH;
};
class MRHInfotext: RscTextMRHDebugTools
{
	idc = 1000;
	text = "Imput distance:"; //--- ToDo: Localize;
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHEditDist: RscEditMRHDebugTools
{
	idc = 1400;
	text = "1"; //--- ToDo: Localize;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHOkButton: RscButtonMRHDebugTools
{
	idc = 1600;
	text = $STR_MRH_MRHDebugTools_OKBUTT; //--- ToDo: Localize;
    action = "call MRH_fnc_MilsimTools_DebugTools_modelToWorldDrawMenuAction";
	x = 0.469062 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHCancelButton: RscButtonMRHDebugTools
{
	idc = 1601;
	text = $STR_MRH_MRHDebugTools_CLOSEBUTT; //--- ToDo: Localize;
    action = "closedialog 0";
	x = 0.422656 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.033 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};