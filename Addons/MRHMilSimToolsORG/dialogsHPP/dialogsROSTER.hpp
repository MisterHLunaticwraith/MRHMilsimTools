
class MRHRoster
{
	idd=777;
	movingenable=true;
	
	class controls 
	{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Venuvo)
////////////////////////////////////////////////////////

class MRHFond: RscPicture
{
	idc = 1200;
	text = "\MRHMilSimTools\GUI\page.paa";
	x = 0.0603125 * safezoneW + safezoneX;
	y = 0.038 * safezoneH + safezoneY;
	w = 0.879375 * safezoneW;
	h = 0.938 * safezoneH;
};

class MRHRControlsGroup: RscControlsGroup
{
	idc = 2300;
	x = 0.112813 * safezoneW + safezoneX;
	y = 0.206 * safezoneH + safezoneY;
	w = 0.328125+0.2 * safezoneW;                // scalability code which resizes correctly no matter what gui size or screen dimensions is used
	h = (SafezoneH  * 0.6);                // scalability code which resizes correctly no matter what gui size or screen dimensions is used

	
	class Controls
	{
		class MRHText: RscStructuredText
{
	idc = 1100;
	text = ""; //--- ToDo: Localize;
	x = 0
	y = 0
	w = 0.328124 * safezoneW;
	h = 0.7 * safezoneH;  //0.7
};
	};
};


class MRHidText: RscStructuredText
{
	idc = 1300;
	text = ""; //--- ToDo: Localize;
	x = 0.519688 * safezoneW + safezoneX;
	y = 0.178 * safezoneH + safezoneY;
	w = 0.203437 * safezoneW;
	h = 0.42 * safezoneH;
};

class MRHComsig: RscStructuredText
{
	idc = 1400;
	text = ""; //--- ToDo: Localize;
	x = 0.52625 * safezoneW + safezoneX;
	y = 0.668 * safezoneH + safezoneY;
	w = 0.242812 * safezoneW;
	h = 0.21 * safezoneH;
};


class MRHButton: RscButton
{
	idc = 1600;
	text = "Quitter"; //--- ToDo: Localize;
	x = 0.815 * safezoneW + safezoneX;
	y = 0.822 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.084 * safezoneH;
	action = "closedialog 0";
};

class MRHidpic: RscPicture
{
	idc = 1201;
	text = "";
	x = 0.742812 * safezoneW + safezoneX;
	y = 0.178 * safezoneH + safezoneY;
	w = 0.18375 * safezoneW;
	h = 0.28 * safezoneH;
};
class MRHRank: RscPicture
{
	idc = 1206;
	text = "";
	x = 0.801875 * safezoneW + safezoneX;
	y = 0.472 * safezoneH + safezoneY;
	w = 0.0853125 * safezoneW;
	h = 0.14 * safezoneH;
};

class MRHRControlsGroup2: RscControlsGroup
{
	idc = 2800;
	x = 0.539375 * safezoneW + safezoneX;
	y = 0.668 * safezoneH + safezoneY;
	w = 0.2650 * safezoneW;
	h = (SafezoneH  * 0.2);                // scalability code which resizes correctly no matter what gui size or screen dimensions is used

	
	class Controls
	{
		class MRHoRBAT: RscStructuredText
{
	idc = 2900;
	text = ""; //--- ToDo: Localize;
	x = 0
	y = 0
	w = 0.2625 -0.02* safezoneW;
	h = 0.3 * safezoneH;
};
	};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
class MRHRosterTablet
{
	idd=777;
	movingenable=true;
	
	class controls 
	{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Venuvo)
////////////////////////////////////////////////////////

class MRHFond: RscPicture
{
	idc = 1200;
	moving = true;
	text = "\MRHMilSimTools\GUI\tablet.paa";
	x = 0.198125 * safezoneW + safezoneX;
	y = 0.094 * safezoneH + safezoneY;
	w = 0.649687 * safezoneW;
	h = 0.812 * safezoneH;
};

class MRHRControlsGroup: RscControlsGroup
{
	idc = 2300;
	moving = true;
	
	x = 0.29 * safezoneW + safezoneX;
	y = 0.388 * safezoneH + safezoneY;
	w = 0.190312 * safezoneW;
	h = 0.336 * safezoneH;
	
	class Controls
	{
		class MRHText: RscStructuredText
{
	idc = 1100;
	moving = true;
	text = ""; //--- ToDo: Localize;
	x = 0.000001 
	y = 0.000001 
	w = 0.190311 * safezoneW;
	h = 0.335 * safezoneH;
	/*org
		x = 0.29 * safezoneW + safezoneX;
	y = 0.388 * safezoneH + safezoneY;
	w = 0.190312 * safezoneW;
	h = 0.336 * safezoneH;
	*/
};
	};
};


class MRHidText: RscStructuredText
{
	idc = 1300;
	moving = true;
	text = ""; //--- ToDo: Localize;
	x = 0.493437 * safezoneW + safezoneX;
	y = 0.374 * safezoneH + safezoneY;
	w = 0.0984375 * safezoneW;
	h = 0.224 * safezoneH;
};
/*
class MRHComsig: RscStructuredText
{
	idc = 1400;
	text = ""; //--- ToDo: Localize;
	x = 0.52625 * safezoneW + safezoneX;
	y = 0.668 * safezoneH + safezoneY;
	w = 0.242812 * safezoneW;
	h = 0.21 * safezoneH;
};
*/

class MRHButton: RscButton
{
	idc = 1600;
	moving = true;
	text = "Quitter"; //--- ToDo: Localize;
	x = 0.303125 * safezoneW + safezoneX;
	y = 0.752 * safezoneH + safezoneY;
	w = 0.1575 * safezoneW;
	h = 0.042 * safezoneH;
	action = "closedialog 0";
};

class MRHidpic: RscPicture
{
	idc = 1201;
	moving = true;
	text = "";
	x = 0.611562 * safezoneW + safezoneX;
	y = 0.402 * safezoneH + safezoneY;
	w = 0.065625 * safezoneW;
	h = 0.084 * safezoneH;
};
class MRHRank: RscPicture
{
	idc = 1206;
	moving = true;
	text = "";
	x = 0.624687 * safezoneW + safezoneX;
	y = 0.57 * safezoneH + safezoneY;
	w = 0.0328125 * safezoneW;
	h = 0.056 * safezoneH;
};

class MRHRControlsGroup2: RscControlsGroup
{
	idc = 2800;
	moving = true;
	x = 0.493437 * safezoneW + safezoneX;
	y = 0.626 * safezoneH + safezoneY;
	w = 0.196875 * safezoneW;
	h = 0.154 * safezoneH;
	
	class Controls
	{
		class MRHoRBAT: RscStructuredText
{
	idc = 2900;
	moving = true;
	text = ""; //--- ToDo: Localize;
	x = 0
	y = 0
	w = 0.111562 * safezoneW;
	h = 0.154 * safezoneH;
	/*org
		x = 0.5 * safezoneW + safezoneX;
	y = 0.626 * safezoneH + safezoneY;
	w = 0.111562 * safezoneW;
	h = 0.154 * safezoneH;
	*/
};
	};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


	};
};
