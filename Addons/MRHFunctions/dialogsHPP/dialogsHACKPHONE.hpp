//class RscTitles
//{
class MRHHackPhone
{
	idd=210382;
	movingenable=true;
	onLoad = "((_this select 0) displayCtrl 1202) progressSetPosition 0; uiNamespace setVariable ['MRHHackPhone', _this select 0]";
	//onLoad = "uiNamespace setVariable ['MRHHackPhone', _this select 0]";
	duration = "99999999";
	class controls 
	{


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Marova)
////////////////////////////////////////////////////////

class MRHHackPhoneFrame: RscPictureMRHHackPhone
{
	idc = 1200;
	text = "\MRHFunctions\img\hackphone\hackphone.paa";
	x = 0.801875 * safezoneW + safezoneX;
	y = 0.486 * safezoneH + safezoneY;
	w = 0.170625 * safezoneW;
	h = 0.504 * safezoneH;
};
class MRHphonescreen: RscPictureMRHHackPhone
{
	idc = 1201;
	text = "\MRHFunctions\img\hackphone\download.paa";
	x = 0.808438 * safezoneW + safezoneX;
	y = 0.486 * safezoneH + safezoneY;
	w = 0.150937 * safezoneW;
	h = 0.49 * safezoneH;
};
class MRHProgressBar: RscProgressMRHHackPhone
{
	idc = 1202;
	//onLoad = "((_this select 0) displayCtrl 1202) progressSetPosition 0.5";
	//text = "red.paa";
	x = 0.84125 * safezoneW + safezoneX;
	y = 0.794 * safezoneH + safezoneY;
	w = 0.091875 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHFileSize: RscStructuredTextMRHHackPhone
{
	idc = 1203;
	text = "FileSize";
	x = 0.854375 * safezoneW + safezoneX;
	y = 0.724 * safezoneH + safezoneY;
	w = 0.0590625 * safezoneW;
	h = 0.014 * safezoneH;
};
class MRHDownloadSpeed: RscStructuredTextMRHHackPhone
{
	idc = 1204;
	text = "DownloadSpeed";
	x = 0.854375 * safezoneW + safezoneX;
	y = 0.752 * safezoneH + safezoneY;
	w = 0.0590625 * safezoneW;
	h = 0.014 * safezoneH;
};
class MRHDownloaded: RscStructuredTextMRHHackPhone
{
	idc = 1205;
	text = "Downloaded";
	x = 0.854375 * safezoneW + safezoneX;
	y = 0.78 * safezoneH + safezoneY;
	w = 0.0590625 * safezoneW;
	h = 0.014 * safezoneH;
};
class MRHSignal: RscPictureMRHHackPhone
{
	idc = 1206;
	text = "\MRHFunctions\img\hackphone\fullsignal.paa";
	x = 0.749375 * safezoneW + safezoneX;
	y = 0.864 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.07 * safezoneH;
};
/*
class MRHTEMPLATETEXT: RscStructuredText
{
	idc = 1100;
	text = "teetet"; //--- ToDo: Localize;
	x = 0.213542 * safezoneW + safezoneX;
	y = 0.301852 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.07 * safezoneH;
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
////
//};
