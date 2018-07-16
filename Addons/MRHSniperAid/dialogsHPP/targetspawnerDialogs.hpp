class MRHTargetSpawner
{
	idd=05042018;
	movingenable=false;
	
	class controls 
	{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Sivoky)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Wavuti)
////////////////////////////////////////////////////////

class MRHGuiBack: IGUIBackMRHTargetSpawner
{
	idc = 2200;

	x = 0.241044 * safezoneW + safezoneX;
	y = 0.1584 * safezoneH + safezoneY;
	w = 0.518437 * safezoneW;
	h = 0.686 * safezoneH;
};
class MRHMarkersList: RscListBoxMRHTargetSpawner
{
	idc = 1500;

	x = 0.244062 * safezoneW + safezoneX;
	y = 0.206 * safezoneH + safezoneY;
	w = 0.137812 * safezoneW;
	h = 0.616 * safezoneH;
};
class MRHTextSelectMarker: RscStructuredTextMRHTargetSpawner
{
	idc = 1100;

	text = $STR_MRH_SniperTraining_SelectMarker; //--- ToDo: Localize;
	x = 0.244062 * safezoneW + safezoneX;
	y = 0.164 * safezoneH + safezoneY;
	w = 0.49875 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHTargetType: RscStructuredTextMRHTargetSpawner
{
	idc = 1101;

	text = $STR_MRH_SniperTraining_SelectTargetType; //--- ToDo: Localize;
	x = 0.401563 * safezoneW + safezoneX;
	y = 0.206 * safezoneH + safezoneY;
	w = 0.34125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHTypeSelector: RscComboMRHTargetSpawner
{
	idc = 2100;

	x = 0.401563 * safezoneW + safezoneX;
	y = 0.248 * safezoneH + safezoneY;
	w = 0.21 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHtextSelectBehaviour: RscStructuredTextMRHTargetSpawner
{
	idc = 1102;

	text = $STR_MRH_SniperTraining_SelectTargetBeha; //--- ToDo: Localize;
	x = 0.401563 * safezoneW + safezoneX;
	y = 0.29 * safezoneH + safezoneY;
	w = 0.34125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHSelectBehavior: RscComboMRHTargetSpawner
{
	idc = 2101;

	x = 0.401563 * safezoneW + safezoneX;
	y = 0.332 * safezoneH + safezoneY;
	w = 0.21 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHtextSelectSpeedMode: RscStructuredTextMRHTargetSpawner
{
	idc = 1103;

	text = $STR_MRH_SniperTraining_SelectTargetSpeed; //--- ToDo: Localize;
	x = 0.401563 * safezoneW + safezoneX;
	y = 0.388 * safezoneH + safezoneY;
	w = 0.34125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHSelectSpeedMode: RscComboMRHTargetSpawner
{
	idc = 2102;

	x = 0.401563 * safezoneW + safezoneX;
	y = 0.43 * safezoneH + safezoneY;
	w = 0.21 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHtext: RscStructuredTextMRHTargetSpawner
{
	idc = 1104;

	text = $STR_MRH_SniperTraining_SelectMoveRadius; //--- ToDo: Localize;
	x = 0.401563 * safezoneW + safezoneX;
	y = 0.472 * safezoneH + safezoneY;
	w = 0.34125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHExitButton: RscButtonMRHTargetSpawner
{
	idc = 1600;
	action = "closedialog 0";

	text = $STR_MRH_SniperTraining_Close; //--- ToDo: Localize;
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.752 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.07 * safezoneH;
};
class MRHSpawnButton: RscButtonMRHTargetSpawner
{
	idc = 1601;

	text = $STR_MRH_SniperTraining_SpawnTargetAction; //--- ToDo: Localize;
	x = 0.63125 * safezoneW + safezoneX;
	y = 0.752 * safezoneH + safezoneY;
	w = 0.091875 * safezoneW;
	h = 0.07 * safezoneH;
};
class MRHEditBox: RscEditMRHTargetSpawner
{
	idc = 1400;

	text = "10"; //--- ToDo: Localize;
	x = 0.401563 * safezoneW + safezoneX;
	y = 0.514 * safezoneH + safezoneY;
	w = 0.0853125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHMeters: RscStructuredTextMRHTargetSpawner
{
	idc = 1105;

	text = $STR_MRH_SniperTraining_Meters; //--- ToDo: Localize;
	x = 0.493437 * safezoneW + safezoneX;
	y = 0.514 * safezoneH + safezoneY;
	w = 0.105 * safezoneW;
	h = 0.042 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};