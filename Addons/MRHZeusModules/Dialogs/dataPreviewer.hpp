/*
class MRHZeusDataPreviewer
{
	idd=190119;
   
	movingenable=true;
    
	class controls 
	{
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Xyvydu)
////////////////////////////////////////////////////////

class MRHViewerBack: IGUIBackMRHZeusModules
{
	idc = 9901;
	onLoad = "[_this] spawn MRH_fnc_MilsimTools_ZeusModules_refreshDataPreviewer";
	x = 0.12875 * safezoneW + safezoneX;
	y = 0.038 * safezoneH + safezoneY;
	w = 0.737344 * safezoneW;
	h = 0.418 * safezoneH;
};
class MRHDataTree: RscTreeMRHZeusModules
{
	idc = 9902;
	onTreeSelChanged = "call MRH_fnc_MilsimTools_ZeusModules_dataViewerOnTvCurselChanged";
	x = 0.12875 * safezoneW + safezoneX;
	y = 0.06 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.352 * safezoneH;
};
class MRHctrlGRP :RscControlsGroupMRHZeusModules
{
	idc = 8899;
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.06 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.352 * safezoneH;
	class controls
	{
		class MRHDataViewer: RscStructuredTextMRHZeusModules
		{
			idc = 9903;
			x = 0;
			y = 0;
			w = 0.201094 * safezoneW;
			h = 0.352 * safezoneH;
		};
	};
};
class MRHPictureviewListBox: RscListboxMRHZeusModules
{
	idc = 9904;
	onLBSelChanged = "call MRH_fnc_MilsimTools_ZeusModules_dataViewerOnLbChanged";
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.06 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.352 * safezoneH;
};
class MRHPicPreview: RscPictureMRHZeusModules
{
	idc = 9905;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.654688 * safezoneW + safezoneX;
	y = 0.06 * safezoneH + safezoneY;
	w = 0.211406 * safezoneW;
	h = 0.308 * safezoneH;
};
class MRHPicCaptionPreview: RscStructuredTextMRHZeusModules
{
	idc = 9906;
	x = 0.654688 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.211406 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHRefreshDataButton: RscButtonMRHZeusModules
{
	idc = 9907;
	text = $STR_MRH_MRHMRHZeusModules_REFRDATA; //--- ToDo: Localize;
	//action = "systemChat str _this"//"[_this] spawn MRH_fnc_MilsimTools_ZeusModules_refreshDataPreviewer";
	x = 0.12875 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHTitlePreviewData: RscTextMRHZeusModules
{
	idc = 9908;
	text = $STR_MRH_MRHMRHZeusModules_DATAPRV; //--- ToDo: Localize;
	x = 0.12875 * safezoneW + safezoneX;
	y = 0.038 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHPicPrevTitle: RscTextMRHZeusModules
{
	idc = 9909;
	 //onLoad = "call MRH_fnc_MilsimTools_ZeusModules_refreshDataPreviewer";
	text = $STR_MRH_MRHMRHZeusModules_PICPREV; //--- ToDo: Localize;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.038 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
  /*
    };
};
*/