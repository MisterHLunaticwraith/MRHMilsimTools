class ctrlActivePicture;
class ctrlActivePictureKeepAspect;
class ctrlActiveText;
class ctrlButton;
class ctrlButtonCancel;
class ctrlButtonClose;
class ctrlButtonFilter;
class ctrlButtonOK;
class ctrlButtonPicture;
class ctrlButtonPictureKeepAspect;
class ctrlButtonSearch;
class ctrlButtonToolbar;
class ctrlCheckbox;
class ctrlCheckboxBaseline;
class ctrlCheckboxes;
class ctrlCheckboxToolbar;
class ctrlCombo;
class ctrlComboToolbar;
class ctrlControlsGroup;
class ctrlControlsGroupHighlight;
class ctrlControlsGroupNoHScrollbars;
class ctrlControlsGroupNoScrollbars;
class ctrlControlsGroupNoVScrollbars;
class ctrlControlsGroupTutorial;
class ctrlDefault;
class ctrlDefaultButton;
class ctrlDefaultText;
class ctrlEdit;
class ctrlEditMulti;
class ctrlHTML;
class ctrlListbox;
class ctrlListNBox;
class ctrlMap;
class ctrlMapEmpty;
class ctrlMapMain;
class ctrlMenu;
class ctrlMenuStrip;
class ctrlObject;
class ctrlObjectContainer;
class ctrlObjectZoom;
class ctrlProgress;
class ctrlShortcutButton;
class ctrlSliderH;
class ctrlSliderV;
class ctrlStatic;
class ctrlStaticBackground;
class ctrlStaticBackgroundDisable;
class ctrlStaticBackgroundDisableTiles;
class ctrlStaticFooter;
class ctrlStaticFrame;
class ctrlStaticLine;
class ctrlStaticMulti;
class ctrlStaticOverlay;
class ctrlStaticPicture;
class ctrlStaticPictureKeepAspect;
class ctrlStaticPictureTile;
class ctrlStaticTitle;
class ctrlStructuredText;
class ctrlToolbox;
class ctrlToolboxPicture;
class ctrlToolboxPictureKeepAspect;
class ctrlTree;
class ctrlXListbox;
class ctrlXSliderH;
class ctrlXSliderV;

class MRH_Display3DENAddons
{
	idd= 390;
   
	movingenable = false;
    onLoad = "uiNamespace setVariable ['MRH_Display3DENAddons', _this select 0]";

	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Bunuze)
////////////////////////////////////////////////////////
class MRH_GuiBack: ctrlStaticFrame
{
	idc = 1210;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.181 * safezoneH + safezoneY;
	w = 0.28875 * safezoneW;
	h = 0.627 * safezoneH;
};
class MRH_Header: ctrlStaticTitle
{
	idc = 1201;
	text = $STR_MRH_MRHDebugTools_listModsMenuTitle;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.181 * safezoneH + safezoneY;
	w = 0.28875 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRH_AllButton: ctrlButton
{
	idc = 1202;
	text = $STR_MRH_MRHDebugTools_ButtonAll;
	action = "['all'] call MRH_fnc_MilsimTools_DebugTools_showAddonsButtonAction;";
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.203 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRH_JustModButton: ctrlButton
{
	idc = 1203;
	text = $STR_MRH_MRHDebugTools_ButtonMods;
	action = "['onlyMods'] call MRH_fnc_MilsimTools_DebugTools_showAddonsButtonAction;";
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.203 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRH_AllAddonsButton: ctrlButton
{
	idc = 1204;
	text = $STR_MRH_MRHDebugTools_ButtonAllAddons;
	action = "['onlyAddons'] call MRH_fnc_MilsimTools_DebugTools_showAddonsButtonAction;";
	x = 0.510312 * safezoneW + safezoneX;
	y = 0.203 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRH_ForGithubButton: ctrlButton
{
	idc = 1205;
	text = $STR_MRH_MRHDebugTools_ButtonGitHub;
	action = "['forgithub'] call MRH_fnc_MilsimTools_DebugTools_showAddonsButtonAction;";
	x = 0.577344 * safezoneW + safezoneX;
	y = 0.203 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.022 * safezoneH;
};
class infoTextGrp : ctrlControlsGroup
{
	idc = 1211;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.28875 * safezoneW;
	h = 0.044 * safezoneH;
	class controls
	{
		class MRH_InfoTextZone: ctrlStructuredText
		{
			idc = 1206;
			text = $STR_MRH_MRHDebugTools_helpAll;
			x = 0;
			y = 0;
			w = 0.28875 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};

class TextZoneGrp : ctrlControlsGroup
{
	idc = 1210;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.28875 * safezoneW;
	h = 0.517 * safezoneH;
	class controls
	{
		class MRH_TextZone: ctrlEditMulti //ctrlStructuredText //ctrlEditMulti
		{
			idc = 1207;
			text = "";
			x = 0;
			y = 0;
			w = 0.28875 * safezoneW;
			h = 0.517 * safezoneH;
		};
	};
};

class MRH_CopyButton: ctrlButton
{
	idc = 1208;
	text = $STR_MRH_MRHDebugTools_ButtonToClipBoard;
	action = "copyToClipBoard (ctrlText ((findDisplay 390)displayCtrl 1207));systemChat 'Copied to clipboard'";
	x = 0.536094 * safezoneW + safezoneX;
	y = 0.786 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRH_CloseButton: ctrlButtonClose
{
	idc = 1209;
	action = "closeDialog 0";
	x = 0.592812 * safezoneW + safezoneX;
	y = 0.786 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.022 * safezoneH;
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};