/*
Function name:MRH_fnc_MilsimTools_DebugTools_ListModsAndAddons
Author: Mr H.
Description: Browses through config files and returns a list of all activated addons and mods with their version, excluding base arma 3 components. Mods need to have a properly configured cfgMods / cfgPatches if the addon uses CBA versionning, version will be included
Return value: <ARRAY> where 0<STRING> is a compiled list of addons and mods, see parameters for its final output formatting, 1 is an <ARRAY>of ALL non arma ADDONS (cfgPatches) and 2 is an <ARRAY> of all non vanilla MODS (cfgMods). 0 and 2 might be missing some mods/addons if they are not properly configured or missing but 1 should always include all addons. 
Public:Yes
Parameters:
Parameters define what the select 0 <STRING> will look like: 
0-<BOOL> (optional, default false) only mods will only list mod names and not the addons if set to true, else will try to list all the addons from this mod under it
1-<BOOL> (optional, default false) for github reports will return a ready to paste list of mods in the formet use by cba, ace3, milsim tools and other mods for their bug reports on github
Example(s):
EX1 call MRH_fnc_MilsimTools_DebugTools_ListModsAndAddons;
will return a list like(truncated here):
Arma 3 194,145977 Stable

//---------cba version :3.12.2.190909---------//
["
      cba_common  version  :3.12.2.190909","
      cba_events  version  :3.12.2.190909","
      cba_hashes  version  :3.12.2.190909","
      cba_jam  version  :3.12.2.190909","
      cba_jam_finish  version  :3.12.2.190909","
      cba_jr_prep  version  :3.12.2.190909","
      cba_keybinding  version  :3.12.2.190909","
      cba_modules  version  :3.12.2.190909","
      cba_music  version  :3.12.2.190909","
      cba_network  version  :3.12.2.190909","
      cba_settings  version  :3.12.2.190909","
      cba_statemachine  version  :3.12.2.190909","
      cba_strings  version  :3.12.2.190909","
      cba_vectors  version  :3.12.2.190909","
      cba_xeh  version  :3.12.2.190909","
      CBA_Extended_EventHandlers  version  :","
      cba_xeh_a3  version  :","
      cba_accessory  version  :3.12.2.190909","
      cba_ai  version  :3.12.2.190909","
      cba_arrays  version  :3.12.2.190909","
      cba_diagnostic  version  :3.12.2.190909","
      cba_disposable  version  :3.12.2.190909","
      cba_ee  version  :","
      cba_help  version  :3.12.2.190909","
      cba_jr  version  :3.12.2.190909","
      cba_optics  version  :3.12.2.190909","
      cba_ui  version  :3.12.2.190909","
      cba_ui_helper  version  :","
      cba_versioning  version  :3.12.2.190909","
      cba_main  version  :3.12.2.190909","
      cba_main_a3  version  :3.12.2.190909"]

//---------MRHMilsimTools version :1.17.5---------//
["
      MRHMilsimTools  version  :1.17.5"]

EX2 [true,true] call MRH_fnc_MilsimTools_DebugTools_ListModsAndAddons;
will return a string like this:
- **Arma 3:** `194,145977` Stable

- **ace:** `3.12.6.43`

- **cba:** `3.12.2.190909`

- **MRHMilsimTools:** `1.17.5`




*/
#include "MRH_C_Path.hpp"
params [["_onlyMods",false],["_forBugReport",false]];
_allCfgPatches = "true" configClasses (configFile >> "CfgPatches");//gettext (configfile >> "CfgMods" >> _dlc >> "logo");
_allPatchesConfigNames = _allCfgPatches apply {configName _x};
_toExclude = ["Core","A3Data","3DEN","Map_VR","CuratorOnly_Air_F_Beta_Heli_Attack_01","CuratorOnly_Air_F_Beta_Heli_Attack_02","CuratorOnly_Air_F_Gamma_UAV_01","CuratorOnly_Armor_F_AMV","CuratorOnly_armor_f_beta_APC_Tracked_02","CuratorOnly_Armor_F_Marid","CuratorOnly_Armor_F_Panther","CuratorOnly_Armor_F_Slammer","CuratorOnly_Armor_F_T100K","CuratorOnly_Boat_F_Boat_Armed_01","CuratorOnly_Characters_F_BLUFOR","CuratorOnly_Characters_F_Common","CuratorOnly_Characters_F_OPFOR","CuratorOnly_Modules_F_Curator_Animals","CuratorOnly_Modules_F_Curator_Chemlights","CuratorOnly_Modules_F_Curator_Effects","CuratorOnly_Modules_F_Curator_Environment","CuratorOnly_Modules_F_Curator_Flares","CuratorOnly_Modules_F_Curator_Lightning","CuratorOnly_Modules_F_Curator_Mines","CuratorOnly_Modules_F_Curator_Objectives","CuratorOnly_Modules_F_Curator_Ordnance","CuratorOnly_Modules_F_Curator_Smokeshells","CuratorOnly_Signs_F","CuratorOnly_Soft_F_Crusher_UGV","CuratorOnly_Soft_F_MRAP_01","CuratorOnly_Soft_F_MRAP_02","CuratorOnly_Soft_F_Quadbike","CuratorOnly_Static_F_Gamma","CuratorOnly_Static_F_Mortar_01","CuratorOnly_Structures_F_Civ_Ancient","CuratorOnly_Structures_F_Civ_Camping","CuratorOnly_Structures_F_Civ_Garbage","CuratorOnly_Structures_F_EPA_Civ_Constructions","CuratorOnly_Structures_F_EPB_Civ_Dead","CuratorOnly_Structures_F_Ind_Cargo","CuratorOnly_Structures_F_Ind_Crane","CuratorOnly_Structures_F_Ind_ReservoirTank","CuratorOnly_Structures_F_Ind_Transmitter_Tower","CuratorOnly_Structures_F_Items_Vessels","CuratorOnly_Structures_F_Mil_BagBunker","CuratorOnly_Structures_F_Mil_BagFence","CuratorOnly_Structures_F_Mil_Cargo","CuratorOnly_Structures_F_Mil_Fortification","CuratorOnly_Structures_F_Mil_Radar","CuratorOnly_Structures_F_Mil_Shelters","CuratorOnly_Structures_F_Research","CuratorOnly_Structures_F_Walls","CuratorOnly_Structures_F_Wrecks"];
_allNonVanilla = [];
{
	if ((((_x splitString "_") select 0) !="A3")&& !(_x in _toExclude)) then {_allNonVanilla pushBackUnique _x};
} forEach _allPatchesConfigNames;

_allCfgMods = "true" configClasses (configFile >> "CfgMods");//gettext (configfile >> "CfgMods" >> _dlc >> "logo");
_allCfgModsConfigNames = _allCfgMods apply {configName _x};
_toExcludeMods = ["A3","Mod_Base","DLCBundle","UnknownMod","Curator","Kart","Heli","Mark","OfficialMod","Expansion","DLCBundle2","Jets","Argo","Orange","Tacops","Tank","Warlords","Enoch"];
_allNonVanillaMods = [];
{
	if !(_x in _toExcludeMods)then {_allNonVanillaMods pushBackUnique _x};
} forEach _allCfgModsConfigNames;
_fnc_findParentMod = {
	params ["_mod","_allPatches"];
	private _return = [];
	_mod = toLower _mod;
	{
		if ((toLower _x) find (toLower _mod) == 0) then {_return pushBackUnique _x};
	}forEach _allpatches;
	_return
};

_sorted = [];
{
	private _addonsForThis= [_x,_allNonVanilla] call _fnc_findParentMod;
	_sorted pushBackUnique [_x,_addonsForThis];
}forEach _allNonVanillaMods;

_fnc_addonWithVersion ={
	params ["_addons"];
	private _versionMod = "";
	private _return = [];
	{
		private _version = getText (configFile >>"CfgPatches">>_x>>"versionStr");
		_versionMod = _version;
		_return PushBackUnique ([endl,"      ",_x,"  version  :",_version] joinString "");
	}forEach _addons;
	[_return,_versionMod]
};
_armaVersion = (productVersion select 0)+ " " + str (productVersion select 2) +","+ str (productVersion select 3) + " " +  (productVersion select 4);
if (_forBugReport) then {_armaVersion = "- **" +(productVersion select 0)+ ":** `" + str (productVersion select 2) +","+ str (productVersion select 3) + "` " +  (productVersion select 4);};
_final =[];
{
	_x params ["_modName","_addons"];
	private _withVersion = [_addons] call _fnc_addonWithVersion;
	private _array = [endl,"//---------",_ModName," version :",(_withVersion select 1),"---------//",endl,_withVersion select 0];
	if (_onlyMods) then {_array = [endl,"//---------",_ModName," version :",(_withVersion select 1),"---------//",endl]};
	if (_forBugReport) then {_array = [endl,"- **",_ModName,":** ","`",(_withVersion select 1),"`",endl]};
	_final pushBackUnique (_array joinString "");
}forEach _sorted;
_final append [endl,endl,"//----GENERATED WITH MRH MILSIM TOOLS----//"];
_final2 = [_armaVersion,endl];
_final2 append _final;
[(_final2 joinString ""),_allNonVanilla,_allNonVanillaMods]