////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Pyxuxy)
////////////////////////////////////////////////////////

class MRHShareButtonPic: RscPictureMRHSoldierTab
{
	idc = 8200;
	MVT;
	FS;
	text = PAAPATH(sharebutton.paa);
	x = 0.695937 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHShareButtonActual: RscInvisibleButtonMRHSoldierTab
{
	idc = 8201;
	MVT;
	FS;
	action = "call MRH_fnc_MilsimTools_SoldierTab_ShareData;";
	x = 0.695937 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHShareListCombo: RscComboMRHSoldierTab
{
	idc = 8202;
	MVT;
	FS;
	onLBSelChanged = "ctrlShow [8205,true];";
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.022 * safezoneH;
};
class transferzone: RscProgressMRHSoldierTab
{
	idc = 8203;
	MVT;
	FS;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = (0.022 * safezoneH)/1.5;
};
class transfertextzone: RscStructuredTextMRHSoldierTab
{
	idc = 8204;
	MVT;
	FS;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.022 * safezoneH;
};
class TransferButton: RscButtonMRHSoldierTab
{
	idc = 8205;
	MVT;
	FS;
	text = $STR_MRH_ST_SendDataButton;
	action = "call MRH_fnc_MilsimTools_SoldierTab_SendData;";
	tooltip = "This will send all your data to the given player (Pictures and data)";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
