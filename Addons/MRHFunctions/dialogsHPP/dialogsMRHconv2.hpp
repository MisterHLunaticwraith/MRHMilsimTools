class MRHEventConvSystem
{	
	idd=240119;
	movingenable=true;
    onLoad = "uiNamespace setVariable ['MRHEventConvSystem', _this select 0]";
	duration = "99999999";
	//onUnload = "_cam = (_this select 0) getVariable 'MRH_convSystemCreatedCam';camDestroy _cam;_unit = (_this select 0) getVariable 'MRH_convSystemTalkingUnit'; _unit setRandomLip false;";
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Rylixe)
////////////////////////////////////////////////////////

class MRHBack: RscPictureMRHconvsystem
{
	idc = 1200;
	text = "\MRHFunctions\img\conversationUI2.paa";
	x = 0.262812 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.458906 * safezoneW;
	h = 0.088 * safezoneH;
};
class MRHAvatarPic: RscPictureMRHconvsystem
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.267969 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class MRHStructuredTextZone: RscStructuredTextMRHconvsystem
{
	idc = 1100;
	text = "";
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.397031 * safezoneW;
	h = 0.044 * safezoneH;
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
    };
};