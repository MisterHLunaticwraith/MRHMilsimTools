class MRH_117FRadioStation_Base: StaticWeapon //static
{
	author = "Mr H";
	editorPreview = "\MRHMiscItems\Models\117RadioStation\Data\117StationPreview.jpg";
	//_generalMacro = "Banner_01_F";
	scope = 1;
	scopeCurator = 1;
	side = 1;
	typicalCargo[] = {"Soldier"};
	displayName = $STR_MRH_MRHMiscItems_117FStationDisplay;
	model = "\MRHMiscItems\Models\117RadioStation\117RadioStation.p3d";
	icon = "\MRHMarkers\paa\radiocall.paa";
	editorCategory = "EdCat_MRH_RadioPosts";
	//editorSubcategory = "EdSubcat_MRH_Props";
	editorSubcategory = "EdSubcat_Turrets";
	//vehicleClass = "Small_items";
	//destrType = "DestructNo";
	mapSize = 0.5;
	transportSoldier = 0;
	getInAction = "PlayerProne";
	getOutAction = "PlayerProne";
	threat[] = {0.7, 0.3, 0};
	accuracy = 0.12;
	cost = 10000;
	class EventHandlers {
		init = "_this call MRH_fnc_MilsimTools_MiscItems_117StationInit;";
		
	};
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
class ACE_Actions : ACE_Actions
	{
		class ACE_MainActions :ACE_MainActions
		{
			selection = "mem01";
			class AntennaConnectTablet {
					displayName = $STR_MRH_MRHMiscItems_connectantennatab;
					condition = "('MRH_SoldierTab' in items MRH_player) && ((MRH_player getVariable ['MRH_AntennaLinkedToSoldierTablet',objNull]) != _target)";
					exceptions[] = {};
					statement = "[_target,MRH_player] call MRH_fnc_MilsimTools_MiscItems_handleAntennaConnection;";
					icon = "\MRHMarkers\paa\iconconnect";
					
				};
		};
	};
class Turrets: Turrets {
	class MainTurret: MainTurret {
		minTurn = -45;
		maxTurn = 45;
		initTurn = 0;
		minElev = -10;
		maxElev = 40;
		initElev = 0;
		axis= "Radio";
		memoryPointsGetInGunner = "mem05";
		memoryPointsGetInGunnerDir = "mem04";

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
			minAngleX = -180;
			maxAngleX = 180;
			initAngleY = 0;
			minAngleY = -100;
			maxAngleY = 100;
			minFov = "1";
			maxFov = "1";
			initFov= "1";
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
		opticsDisablePeripherialVision = 0;
		LODOpticsIn= 1000;
	};
};
class Hitpoints
{
	class HitAntenna
	{
		armor = 0.3;
		material = -1; //disables the feature; this damage texture method is deprecated (and not very good looking)
		name = "HitAntenna"; //the vertex name in the P3D's HitPoints LOD
		visual = "Antenna"; //<---this is where the section name goes (tying the swap to this hit location)
		passThrough = 1;
		minimalHit = 0.01;
		explosionShielding = 2.0;
		radius = 1;
	};
	class HitRadio
	{
		armor = 0.3;
		material = -1; //disables the feature; this damage texture method is deprecated (and not very good looking)
		name = "HitRadio"; //the vertex name in the P3D's HitPoints LOD
		visual = "Radio"; //<---this is where the section name goes (tying the swap to this hit location)
		passThrough = 1;
		minimalHit = 0.01;
		explosionShielding = 2.0;
		radius = 1;
	};
};

class Damage {
tex[] = {};
mat[] = {
	//antenna rvs
	"MRHMiscItems\Models\SatComAntenna\Data\antenna.rvmat",
	"MRHMiscItems\Models\SatComAntenna\Data\antenna_damage.rvmat",
	"MRHMiscItems\Models\SatComAntenna\Data\antenna_destruct.rvmat",
	//Cable
	"MRHMiscItems\Models\117RadioStation\Data\AntennaCable.rvmat",
	"MRHMiscItems\Models\117RadioStation\Data\AntennaCable.rvmat",
	"MRHMiscItems\Models\117RadioStation\Data\AntennaCable.rvmat",
	//Phone
	"MRHMiscItems\Models\117RadioStation\Data\Phoneline.rvmat",
	"MRHMiscItems\Models\117RadioStation\Data\Phoneline.rvmat",
	"MRHMiscItems\Models\117RadioStation\Data\Phoneline.rvmat",
	//radio
	"MRHMiscItems\Models\117RadioStation\Data\117FwBattery.rvmat",
	"MRHMiscItems\Models\117RadioStation\Data\117FwBattery_damage.rvmat",
	"MRHMiscItems\Models\117RadioStation\Data\117FwBattery_destruct.rvmat"
}; //toDo
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
//TFAR compat
tf_hasLRradio = 1;
tf_isolatedAmount = 0;
//ACRE compat
class AcreRacks {
		class Rack_1 {
			displayName = $STR_MRH_MRHMiscItems_AcreDashName; // Name is displayed in the interaction menu.
			shortName = $STR_MRH_MRHMiscItems_AcreDashName;
			componentName = "ACRE_VRC103";
			allowedPositions[] = {"gunner","external"}; // Who has access. "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
			disabledPositions[] = {};
			defaultComponents[] = {};
			mountedRadio = "ACRE_PRC117F";                 // Predefined mounted radio
			isRadioRemovable = 0;
			intercom[] = {"intercom_1"};                   // All units in intercom can receive/send transmittions (ACE3 interaction menu) but they cannot manipulate the radio (GUI interface).

		};
	};
};

class MRH_117FRadioStation_NoRack : MRH_117FRadioStation_Base
{
	class ACE_Actions : ACE_Actions
	{
		class ACE_MainActions :ACE_MainActions
		{
			class MRH_Ace_repack117Fstation
				{
					displayName = $STR_MRH_MRHMiscItems_repack117Station;
					condition = "[_target] call MRH_fnc_MilsimTools_MiscItems_canRepackRadioStation";
					exceptions[] = {"isNotSitting"};
					statement = "[_target,MRH_player] call MRH_fnc_MilsimTools_MiscItems_repackRadioStation;";
					icon = "\MRHMiscItems\Models\117RadioStation\Data\117StationUnpackIco.paa"; //todo
					
				};
		};
	};
	class AcreRacks {
		class Rack_1 {
			displayName = $STR_MRH_MRHMiscItems_AcreDashName; // Name is displayed in the interaction menu.
			shortName = $STR_MRH_MRHMiscItems_AcreDashName;
			componentName = "ACRE_VRC103";
			allowedPositions[] = {"gunner","external"}; // Who has access. "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
			disabledPositions[] = {};
			defaultComponents[] = {};
			mountedRadio = "";                 // Predefined mounted radio
			isRadioRemovable = 0;
			intercom[] = {"intercom_1"};                   // All units in intercom can receive/send transmittions (ACE3 interaction menu) but they cannot manipulate the radio (GUI interface).

		};
	};
};
class  B_MRH_117FRadioStation :  MRH_117FRadioStation_Base
{
	_generalMacro = "B_MRH_117FRadioStation";
	scope = 2;
	side = 1;
	faction = "BLU_F";
	crew = "B_officer_F";
	
};

class  O_MRH_117FRadioStation :  MRH_117FRadioStation_Base
{
	_generalMacro = "B_MRH_117FRadioStation";
	scope = 2;
	side = 0;
	faction = "OPF_F";
	crew = "O_officer_F";
	
};

class  I_MRH_117FRadioStation :  MRH_117FRadioStation_Base
{
	_generalMacro = "B_MRH_117FRadioStation";
	scope = 2;
	side = 2;
	faction = "IND_F";
	crew = "I_officer_F";
	
};

class  C_MRH_117FRadioStation :  MRH_117FRadioStation_Base
{
	_generalMacro = "B_MRH_117FRadioStation";
	scope = 2;
	side = 3;
	faction = "CIV_F";
	crew = "C_man_p_fugitive_F";
	
};
//uncomment for testing purposes
/*
class  B_MRH_117FRadioStationTest :  MRH_117FRadioStation_NoRack
{
	_generalMacro = "B_MRH_117FRadioStation";
	displayName = "test";
	scope = 2;
	side = 1;
	faction = "BLU_F";
	crew = "B_officer_F";
	
};
*/