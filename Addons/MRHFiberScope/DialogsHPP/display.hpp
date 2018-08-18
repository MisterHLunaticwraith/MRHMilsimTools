class RscTitles
{
	class MRHFiberScope
	{
		idd=11042018;
		movingenable=false;
		onLoad = "uiNamespace setVariable ['MRHFiberScope', _this select 0]";
		//onLoad = "uiNamespace setVariable ['MRHHackPhone', _this select 0]";
		duration = "99999999";
		class controls 
		{

			class MRHHackPhoneFrame: RscPictureMRHFiberScope
			{
				idc = 1200;
				text = "\MRHFiberScope\Paa\FiberScopeMask.paa";

					x = -0.00531249 * safezoneW + safezoneX;
					y = -0.00399999 * safezoneH + safezoneY;
					w = 1.01063 * safezoneW;
					h = 1.008 * safezoneH;
			};
		};
	};
};	
