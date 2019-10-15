class StaticATWeapon;
class MRH_117FRadioStation: StaticATWeapon //static
{
	author = "Mr H";
	editorPreview = "\MRHMiscItems\Models\ProjectionScreen\Data\screenPreview.jpg";
	//_generalMacro = "Banner_01_F";
	scope = 2;
	scopeCurator = 2;
	displayName = "117F Radio Post";
	model = "\MRHMiscItems\Models\117RadioStation\117RadioStation.p3d";
	icon = "iconObject_circle";
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Props";
	vehicleClass = "Small_items";
	destrType = "DestructNo";
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