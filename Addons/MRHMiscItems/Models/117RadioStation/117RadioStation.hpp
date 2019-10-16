class MRH_117FRadioStation_Base: StaticWeapon //static
{
	author = "Mr H";
	editorPreview = "\MRHMiscItems\Models\ProjectionScreen\Data\screenPreview.jpg";
	//_generalMacro = "Banner_01_F";
	scope = 1;
	scopeCurator = 1;
	side = 1;
	typicalCargo[] = {"Soldier"};
	displayName = "117F Radio Post";
	model = "\MRHMiscItems\Models\117RadioStation\117RadioStation.p3d";
	icon = "iconObject_circle";
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Props";
	//vehicleClass = "Small_items";
	//destrType = "DestructNo";
	mapSize = 0.5;
	transportSoldier = 0;
	getInAction = "PlayerProne";
	getOutAction = "PlayerProne";
	threat[] = {0.7, 0.3, 0};
	accuracy = 0.12;
	cost = 10000;
	attenuationEffectType = "";
	class SpeechVariants {
		class Default {
			speechSingular[] = {"veh_infantry_SF_s"};
			speechPlural[] = {"veh_infantry_SF_p"};
		};
	};
	textSingular = "$STR_A3_nameSound_veh_infantry_SF_s";
	textPlural = "$STR_A3_nameSound_veh_infantry_SF_p";
	nameSound = "veh_infantry_SF_s";
	
class Turrets: Turrets {
	class MainTurret: MainTurret {
		minTurn = -45;
		maxTurn = 45;
		initTurn = 0;
		minElev = -10;
		maxElev = 40;
		initElev = 0;
		axis= "Radio";
		memoryPointsGetInGunner = "mem01";
		memoryPointsGetInGunnerDir = "mem01";

		class ViewGunner {
			initAngleX = 5;
			minAngleX = -30;
			maxAngleX = 30;
			initAngleY = 0;
			minAngleY = -100;
			maxAngleY = 100;
			initFov = 0.75;
			minFov = 0.25;
			maxFov = 1.25;
		};

		class ViewOptics {
			initAngleX = 0;
			minAngleX = -30;
			maxAngleX = 30;
			initAngleY = 0;
			minAngleY = -100;
			maxAngleY = 100;
			minFov = "0.25/35";
			maxFov = "0.25/5";
			initFov= "0.25/5";
		};

		weapons[] = {};
		magazines[] = {};
		gunnerOpticsColor[] = {1,1,1,1};
		gunnerOpticsModel = "\A3\Weapons_F\empty.p3d";
		gunnerOpticsEffect[] ={}; //{"OpticsCHAbera1","OpticsBlur2"};
		gunnerOutOpticsShowCursor = 0;
		gunnerOpticsShowCursor = 0;
		gunnerAction = "Mortar_Gunner";//"ACE_SpottingScope";
		gunnerGetInAction = "GetInMortar";
		gunnerGetOutAction = "GetOutLow";
		gunnerForceOptics = 0;
		ejectDeadGunner = 1;
		turretInfoType = "";//"CBA_ScriptedOptic_zooming";
		opticsDisablePeripherialVision = 1;
	};
};
class Damage {
tex[] = {};
mat[] = {}; //toDo
};

	hiddenSelections[] = {
		"Antenna",
		"Cable",
		"Phone",
		"Radio"
		};
	hiddenSelectionsTextures[] = 
	{
		"\MRHMiscItems\Models\SatComAntenna\Data\Antenna_co.paa", //antenna
		"\MRHMiscItems\Models\117RadioStation\Data\AntennaCable_co.paa", //Cable
		"\MRHMiscItems\Models\117RadioStation\Data\Phoneline_co.paa", //Phone
		"\MRHMiscItems\Models\117RadioStation\Data\117FwBattery_co.paa" //Radio
	};
	hiddenSelectionsMaterials[] = 
	{
		"\MRHMiscItems\Models\SatComAntenna\Data\antenna.rvmat", //antenna
		"\MRHMiscItems\Models\117RadioStation\Data\AntennaCable.rvmat", //Cable
		"\MRHMiscItems\Models\117RadioStation\Data\Phoneline.rvmat", //Phone
		"\MRHMiscItems\Models\117RadioStation\Data\117FwBattery.rvmat" //Radio
	};
};

class  B_MRH_117FRadioStation :  MRH_117FRadioStation_Base
{
	_generalMacro = "B_MRH_117FRadioStation";
	scope = 2;
	side = 1;
	faction = "BLU_F";
	crew = "B_spotter_F";
};