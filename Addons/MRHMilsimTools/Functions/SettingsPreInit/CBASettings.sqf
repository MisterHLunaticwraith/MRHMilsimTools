/*
// SLIDER --- extra arguments: [_min, _max, _default, _trailingDecimals]
["Test_Setting_3", "SLIDER",   ["-test slider-",   "-tooltip-"], "My Category", [0, 10, 5, 0]] call cba_settings_fnc_init;


_setting	Unique setting name.  Matches resulting variable name STRING//
_settingType	Type of setting.  Can be “CHECKBOX”, “EDITBOX”, “LIST”, “SLIDER” or “COLOR” STRING//
_title	Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>//
_category	Category for the settings menu STRING//
_valueInfo	Extra properties of the setting depending of _settingType.  See examples below <ANY>
_isGlobal	1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
_script	Script to execute when setting is changed.  (optional) <CODE>
[_x] call cba_settings_fnc_get;
[_x , "CHECKBOX",gettext (configfile >> "CfgMods" >> _x >> "name"), "MRHSpawner Allowed DLCs", true,1, { call MRH_fnc_Spawner_AllowedDLCs;}] call cba_settings_fnc_init;
*/
// allow zeus players to access the admin menuAction
["MRH_MilsimTools_AllowAdminForZeus", "CHECKBOX",   [localize "STR_MRH_ADMIN_CBA_AllowAdminForZeusPretty",localize "STR_MRH_ADMIN_CBA_AllowAdminForZeusToolTip"], "MRH_MilsimTools - Core settings",false,1] call cba_settings_fnc_init;
//Settings to kill deadplayersupon reconnecting
["MRH_MilsimTools_AllowDeadReco", "CHECKBOX",   [localize "STR_MRH_MS_CBA_SET_ALLOWEDDEAD_PRETTYNAME",localize "STR_MRH_MS_CBA_SET_ALLOWEDDEAD_TOOLTIP"], "MRH_MilsimTools - Core settings",true,1] call cba_settings_fnc_init;
//Settings to reset hasdied variable upon respawn
["MRH_MilsimTools_ResetHasDiedOnRespawn", "CHECKBOX",   [localize "STR_MRH_CBA_RESETRESPAWNHASDIEDPPRETTY",localize "STR_MRH_CBA_RESETRESPAWNHASDIEDTOOLTIP"], "MRH_MilsimTools - Core settings",false,1] call cba_settings_fnc_init;
//Slider for dead count
["MRH_MilsimTools_AdminCasualtiesCap", "SLIDER",   [localize "STR_MRH_MS_CBA_MAXKILLSLIDERPRETTY",localize "STR_MRH_MS_CBA_MAXKILLSLIDERTOOLTIP"], "MRH_MilsimTools - Core settings", [0, 100, 60, 0],1] call cba_settings_fnc_init;
//setting for dead hint
["MRH_MilsimTools_ShowAdminDeadHint", "CHECKBOX",   [localize "STR_MRH_MS_CBA_SHOWADMINHINTPRETTY",localize "STR_MRH_MS_CBA_SHOWADMINHINTTOOLTIP"], "MRH_MilsimTools - Core settings",true] call cba_settings_fnc_init;
//setting to remove map for non leading players
["MRH_MilsimTools_Rmv_map_nolead", "CHECKBOX",   [localize "STR_MRH_MS_CBA_CORE_REMOVEMAPPRETTY",localize "STR_MRH_MS_CBA_CORE_REMOVEMAPTOOLTIP"], "MRH_MilsimTools - Core settings",false,1] call cba_settings_fnc_init;
// settings for intro cutscene
["MRH_MilsimTools_PlayIntro_ToPlayer", "CHECKBOX",   [localize "STR_MRH_MS_CBA_CORE_ALLOWINTROCUTPLAYERPRETTY",localize "STR_MRH_MS_CBA_CORE_ALLOWINTROCUTPLAYERTOOLTIP"],"MRH_MilsimTools - Core settings",true] call cba_settings_fnc_init;
// setting for removing bodies of disconnected players
["MRH_MilsimTools_Delete_disconnected_body", "CHECKBOX",   [localize "STR_MRH_MS_CBA_CORE_REMOVEDISCONNECTEDBODYPRETTY",localize "STR_MRH_MS_CBA_CORE_REMOVEDISCONNECTEDBODYTOOLTIP"], "MRH_MilsimTools - Core settings",true,1] call cba_settings_fnc_init;
//setting to apply medic patch on ace3 medics 
["MRH_MilsimTools_Core_ApplyMedicPatch", "CHECKBOX",   [localize "STR_MRH_CBA_ApplyMedicPatchSetting",localize "STR_MRH_CBA_ApplyMedicPatchSettingToolTip"], "MRH_MilsimTools - Core settings",true,1] call cba_settings_fnc_init;
//===Below are settings for the jip menu
//allow jip menu on startup
["MRH_MilsimTools_Jip_MenuAllow", "CHECKBOX",   [localize "STR_MRH_MS_CBA_JIP_ALLOWPRETTY",localize "STR_MRH_MS_CBA_JIP_ALLOWTOOLTIP"], "MRH_MilsimTools - JIP settings",true,1] call cba_settings_fnc_init;
//include ais in JIPmenu's player list
["MRH_MilsimTools_Jip_MenuIncludeAI", "CHECKBOX",   [localize "STR_MRH_MS_CBA_JIP_INCLUDEAIPRETTY",localize "STR_MRH_MS_CBA_JIP_INCLUDEAITOOLTIP"], "MRH_MilsimTools - JIP settings",true,1] call cba_settings_fnc_init;
//groups from same side only
["MRH_MilsimTools_Jip_Menu_sideOnly", "CHECKBOX",   [localize "STR_MRH_MS_CBA_JIP_SIDEONLYPRETTY",localize "STR_MRH_MS_CBA_JIP_SIDEONLYTOOLTIP"], "MRH_MilsimTools - JIP settings",true,1] call cba_settings_fnc_init;

//below are settings for the team roster
//allow all sides
["MRH_MilsimTools_Roster_AllowAllSides", "CHECKBOX",   [localize "STR_MRH_ROSTER_ALLOWALLSIDESPRETTY",localize "STR_MRH_ROSTER_ALLOWALLSIDESTOOLTIP"], "MRH_MilsimTools - Roster settings",false,1] call cba_settings_fnc_init;
//show groups with only AIs
["MRH_MilsimTools_Roster_ShowAIgroups", "CHECKBOX",   [localize "STR_MRH_ROSTER_INCLUDE_AI_GROUPSPRETTY",localize "STR_MRH_ROSTER_INCLUDE_AI_GROUPSTOOLTIP"], "MRH_MilsimTools - Roster settings",false,1] call cba_settings_fnc_init;
//show ais within groups
//show groups with only AIs
["MRH_MilsimTools_Roster_ShowAiWithinGrps", "CHECKBOX",   [localize "STR_MRH_ROSTER_INCLUDE_AI_UNITSPRETTY",localize "STR_MRH_ROSTER_INCLUDE_AI_UNITSTOOLTIP"], "MRH_MilsimTools - Roster settings",true,1] call cba_settings_fnc_init;
//below are choices for the colors
// color for blufor
["MRH_MilsimTools_Roster_ColorBF", "COLOR",   [localize "STR_MRH_COLOR_BFPRETTY",localize "STR_MRH_COLOR_TOOLTIP"], "MRH_MilsimTools - Roster settings",[0.259,0.525,0.957,1],1] call cba_settings_fnc_init;
//color for opfor
["MRH_MilsimTools_Roster_ColorOp", "COLOR",   [localize "STR_MRH_COLOR_OFPRETTY",localize "STR_MRH_COLOR_TOOLTIP"], "MRH_MilsimTools - Roster settings",[0.929,0.063,0.063,1],1] call cba_settings_fnc_init;
//color for independent
["MRH_MilsimTools_Roster_ColorInd", "COLOR",   [localize "STR_MRH_COLOR_INDEPRETTY",localize "STR_MRH_COLOR_TOOLTIP"], "MRH_MilsimTools - Roster settings",[0.212,0.847,0.286,1],1] call cba_settings_fnc_init;
//colorfor civs
["MRH_MilsimTools_Roster_ColorCiv", "COLOR",   [localize "STR_MRH_COLOR_CIVPRETTY",localize "STR_MRH_COLOR_TOOLTIP"], "MRH_MilsimTools - Roster settings",[0.686,0.141,0.588,1],1] call cba_settings_fnc_init;
//colorunknown
["MRH_MilsimTools_Roster_ColorUnknown", "COLOR",   [localize "STR_MRH_COLOR_UKPRETTY",localize "STR_MRH_COLORUKTOOLTIP"], "MRH_MilsimTools - Roster settings",[0.929,0.82,0.118,1],1] call cba_settings_fnc_init;
//=======Below are settings for the tablet
//Settings to allow map on the tablet
["MRH_MilsimTools_AllowMapTablet", "CHECKBOX",   [localize "STR_MRH_CBA_TABLET_ALLOWMAPPRETTY",localize "STR_MRH_CBA_TABLET_ALLOWMAPTOOLTIP"], "MRH_MilsimTools - Tablet settings",true,1] call cba_settings_fnc_init;
//=======Below are settings for the hackingtool
//Settings to allow map on the tablet
["MRH_MilsimTools_RequireHackingTool", "CHECKBOX",   [localize "STR_MRH_RequireHackingToolPretty",localize "STR_MRH_RequireHackingToolTip"], "MRH_MilsimTools - Hacking settings",true,1] call cba_settings_fnc_init;
//=====Below are settings for the heli taxi
["MRH_MilsimTools_Heli_UseHeliTaxiInMission", "CHECKBOX",   [localize "STR_MRH_CBA_Heli_UseHeli",localize "STR_MRH_CBA_Heli_UseHeliToolTip"], "MRH_MilsimTools - Heli Taxi",false,1] call cba_settings_fnc_init;
["MRH_MilsimTools_Heli_NumberSimulTPerSide", "EDITBOX",   [localize "STR_MRH_CBA_Heli_NumberPerSide",localize "STR_MRH_CBA_Heli_NumberPerSideToolTip"],"MRH_MilsimTools - Heli Taxi","3",1] call cba_settings_fnc_init;


["MRH_MilsimTools_Heli_ConditionIsFormLeader", "CHECKBOX",   [localize "STR_MRH_CBA_Heli_MustBeFL",localize "STR_MRH_CBA_Heli_MustBeFLToolTip"], ["MRH_MilsimTools - Heli Taxi","Conditions to be able to call the Heli"],true,1] call cba_settings_fnc_init;
["MRH_MilsimTools_Heli_isCustomConditionSet", "CHECKBOX",   [localize "STR_MRH_CBA_Heli_UseCondition",localize "STR_MRH_CBA_Heli_UseConditionToolTip"],["MRH_MilsimTools - Heli Taxi",localize "STR_MRH_CBA_Heli_SubCatConditions"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_Heli_CustomCondition", "EDITBOX",   [localize "STR_MRH_CBA_Heli_CustomCondition",localize "STR_MRH_CBA_Heli_CustomConditionTooltip"],["MRH_MilsimTools - Heli Taxi",localize"STR_MRH_CBA_Heli_SubCatConditions"],"(isFormationLeader MRH_player) && ([MRH_player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio)",1] call cba_settings_fnc_init;

//////////
["MRH_MilsimTools_BluForHelis", "EDITBOX",   [localize "STR_MRH_CBA_Heli_ForBF",localize "STR_MRH_CBA_Heli_ClassnamesToolTip"], ["MRH_MilsimTools - Heli Taxi",localize "STR_MRH_CBA_Heli_ForBF"],"B_Heli_Transport_01_F,B_Heli_Light_01_F,B_Heli_Transport_03_unarmed_F,B_T_VTOL_01_infantry_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_BluForOpFor", "EDITBOX",   [localize "STR_MRH_CBA_Heli_ForOF",localize "STR_MRH_CBA_Heli_ClassnamesToolTip"], ["MRH_MilsimTools - Heli Taxi",localize "STR_MRH_CBA_Heli_ForOF"],"O_Heli_Transport_04_bench_F,O_Heli_Light_02_unarmed_F,O_Heli_Transport_04_covered_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_BluForInde", "EDITBOX",   [localize "STR_MRH_CBA_Heli_ForID",localize "STR_MRH_CBA_Heli_ClassnamesToolTip"], ["MRH_MilsimTools - Heli Taxi",localize "STR_MRH_CBA_Heli_ForID"],"I_Heli_Transport_02_F,I_Heli_light_03_unarmed_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_BluForCivs", "EDITBOX",   [localize "STR_MRH_CBA_Heli_ForCiv",localize "STR_MRH_CBA_Heli_ClassnamesToolTip"], ["MRH_MilsimTools - Heli Taxi",localize "STR_MRH_CBA_Heli_ForCiv"],"C_Heli_Light_01_civil_F",1] call cba_settings_fnc_init;
//---------below are the settings for medevac
["MRH_MilsimTools_MEDEVAC_UseMedEVACInMission", "CHECKBOX",   [localize "STR_MRH_CBA_MEDEVAC_useMedEvac",localize "STR_MRH_CBA_MEDEVAC_useMedEvacTooltip"], "MRH_MilsimTools - MEDEVAC",false,1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_DelayBetween", "SLIDER",   [localize "STR_MRH_CBA_MEDEVAC_delayBetweenSettings",localize "STR_MRH_CBA_MEDEVAC_delayBetweenSettingsToolTip"],"MRH_MilsimTools - MEDEVAC",[0,1200,120,0],1] call cba_settings_fnc_init;

["MRH_MilsimTools_MEDEVAC_timeToReachLZ", "SLIDER",   [localize "STR_MRH_CBA_MEDEVAC_timeToReachLZSetting",localize "STR_MRH_CBA_MEDEVAC_timeToReachLZSettingToolTip"],"MRH_MilsimTools - MEDEVAC",[0,3000,600,0],1] call cba_settings_fnc_init; //set min to 60 after debug

["MRH_MilsimTools_MEDEVAC_ConditionIsFormLeader", "CHECKBOX",   [localize "STR_MRH_CBA_Heli_MustBeFL",localize "STR_MRH_CBA_Heli_MustBeFLToolTip"], ["MRH_MilsimTools - MEDEVAC","Conditions to be able to call the Heli"],true,1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_isCustomConditionSet", "CHECKBOX",   [localize "STR_MRH_CBA_Heli_UseCondition",localize "STR_MRH_CBA_Heli_UseConditionToolTip"],["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_Heli_SubCatConditions"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_MEDEVAC_CustomCondition", "EDITBOX",   [localize "STR_MRH_CBA_Heli_CustomCondition",localize "STR_MRH_CBA_Heli_CustomConditionTooltip"],["MRH_MilsimTools - MEDEVAC",localize"STR_MRH_CBA_Heli_SubCatConditions"],"(isFormationLeader MRH_player) && ([MRH_player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio)",1] call cba_settings_fnc_init;

////////////avail medevac helis
["MRH_MilsimTools_MEDEVAC_BluFor", "EDITBOX",   [localize "STR_MRH_CBA_Heli_ForBF",localize "STR_MRH_CBA_MEDEVAC_severalClassnamesToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_MEDEVACHelicoptersPerSide"],"B_Heli_Light_01_F,B_Heli_Transport_01_F,B_Heli_Transport_03_unarmed_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_OpFor", "EDITBOX",   [localize "STR_MRH_CBA_Heli_ForOF",localize "STR_MRH_CBA_MEDEVAC_severalClassnamesToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_MEDEVACHelicoptersPerSide"],"O_Heli_Light_02_dynamicLoadout_F,O_Heli_Transport_04_medevac_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_Inde", "EDITBOX",   [localize "STR_MRH_CBA_Heli_ForID",localize "STR_MRH_CBA_MEDEVAC_severalClassnamesToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_MEDEVACHelicoptersPerSide"],"I_Heli_light_03_unarmed_F,I_Heli_Transport_02_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_Civs", "EDITBOX",   [localize "STR_MRH_CBA_Heli_ForCiv",localize "STR_MRH_CBA_MEDEVAC_severalClassnamesToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_MEDEVACHelicoptersPerSide"],"C_IDAP_Heli_Transport_02_F,C_Heli_Light_01_civil_F",1] call cba_settings_fnc_init;

////// avail escort helis
["MRH_MilsimTools_MEDEVAC_ESCORT_BluFor", "EDITBOX",   [localize "STR_MRH_CBA_MEDEVAC_EscortHeliBF",localize "STR_MRH_CBA_MEDEVAC_singleClassNameToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_EscortHelisPerSIde"],"B_Heli_Attack_01_dynamicLoadout_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_ESCORT_OpFor", "EDITBOX",   [localize "STR_MRH_CBA_MEDEVAC_EscortHeliOP",localize "STR_MRH_CBA_MEDEVAC_singleClassNameToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_EscortHelisPerSIde"],"O_Heli_Attack_02_dynamicLoadout_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_ESCORT_Inde", "EDITBOX",   [localize "STR_MRH_CBA_MEDEVAC_EscortHeliIND",localize "STR_MRH_CBA_MEDEVAC_singleClassNameToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_EscortHelisPerSIde"],"I_Heli_light_03_dynamicLoadout_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_ESCORT_BluForCivs", "EDITBOX",   [localize "STR_MRH_CBA_MEDEVAC_EscortHeliCIVS",localize "STR_MRH_CBA_MEDEVAC_singleClassNameToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_EscortHelisPerSIde"],"C_Heli_Light_01_civil_F",1] call cba_settings_fnc_init;

//medic class 
["MRH_MilsimTools_MEDEVAC_MEDICCLASS_BluFor", "EDITBOX",   [localize "STR_MRH_CBA_MEDEVAC_MedicClassname_BF",localize "STR_MRH_CBA_MEDEVAC_MedicClassNameToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_MedicsPerSide"],"B_medic_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_MEDICCLASS_OpFor", "EDITBOX",   [localize "STR_MRH_CBA_MEDEVAC_MedicClassname_OP",localize "STR_MRH_CBA_MEDEVAC_MedicClassNameToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_MedicsPerSide"],"O_medic_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_MEDICCLASS_Inde", "EDITBOX",   [localize "STR_MRH_CBA_MEDEVAC_MedicClassname_INDE",localize "STR_MRH_CBA_MEDEVAC_MedicClassNameToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_MedicsPerSide"],"I_medic_F",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MEDEVAC_MEDICCLASS_Civs", "EDITBOX",   [localize "STR_MRH_CBA_MEDEVAC_MedicClassname_CIVS",localize "STR_MRH_CBA_MEDEVAC_MedicClassNameToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_MedicsPerSide"],"C_Man_Paramedic_01_F",1] call cba_settings_fnc_init;
//extra items to call medevac
["MRH_MilsimTools_MEDEVAC_MEDICCLASS_ItemsCall", "EDITBOX",   [localize "STR_MRH_CBA_MEDEVAC_CallItemsMags",localize "STR_MRH_CBA_MEDEVAC_CallItemsMagsToolTip"], ["MRH_MilsimTools - MEDEVAC",localize "STR_MRH_CBA_MEDEVAC_CallItemsMags"],"ACE_HandFlare_Red,SmokeShellOrange",1] call cba_settings_fnc_init;

//---------below are settings for map
["MRH_MilsimTools_Map_ZoomRatio", "SLIDER",   [localize "STR_MRH_CBA_EnhancedMap_FoldZoomLevel",localize "STR_MRH_CBA_EnhancedMap_FoldZoomLevelToolTip"], "MRH_MilsimTools - Enhanced Map", [0, 1, 0.3, 2],1] call cba_settings_fnc_init;
["MRH_MilsimTools_Map_FoldUseAceLight", "CHECKBOX",   [localize "STR_MRH_CBA_EnhancedMap_UseAceLightFold",localize "STR_MRH_CBA_EnhancedMap_UseAceLightFoldToolTip"], "MRH_MilsimTools - Enhanced Map",true,1] call cba_settings_fnc_init;
["MRH_MilsimTools_Map_ReplaceVanillaMap", "CHECKBOX",   [localize "STR_MRH_CBA_EnhancedMap_ReplaceVanillaMap",localize "STR_MRH_CBA_EnhancedMap_ReplaceVanillaMapToolTip"], "MRH_MilsimTools - Enhanced Map",false,1] call cba_settings_fnc_init;

//--------------below are the settings for artillery fire support
["MRH_MilsimTools_FireSupport_useFireSupport", "CHECKBOX",   [localize "STR_MRH_CBA_FireSupport_AllowFSsetting",localize "STR_MRH_CBA_FireSupport_AllowFSsettingToolTip"],["MRH_MilsimTools - Fire Suppport"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_ConditionIsFormLeader", "CHECKBOX",   [localize "STR_MRH_CBA_Heli_MustBeFL",localize "STR_MRH_CBA_General_MustBEFlToolTip"], ["MRH_MilsimTools - Fire Suppport",localize "STR_MRH_CBA_FireSupport_ConditionsAS_Cat"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_isCustomConditionSet", "CHECKBOX",   [localize "STR_MRH_CBA_General_UseCustomCondition",localize "STR_MRH_CBA_General_UseCustomConditionToolTip"],["MRH_MilsimTools - Fire Suppport",localize "STR_MRH_CBA_FireSupport_ConditionsAS_Cat"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CustomCondition", "EDITBOX",   [localize "STR_MRH_CBA_General_CustomConditionCodetoUse",localize "STR_MRH_CBA_General_CustomConditionCodetoUseToolTip"],["MRH_MilsimTools - Fire Suppport",localize "STR_MRH_CBA_FireSupport_ConditionsAS_Cat"],"(isFormationLeader MRH_player) && ([MRH_player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio)",1] call cba_settings_fnc_init;


["MRH_MilsimTools_FireSupport_ArtyMagazines", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_AvailableArtyMags",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - Fire Suppport",localize "STR_MRH_CBA_FireSupport_AvailableArtyMags"],"32Rnd_155mm_Mo_shells,6Rnd_155mm_Mo_smoke,6Rnd_155mm_Mo_mine,2Rnd_155mm_Mo_Cluster,6Rnd_155mm_Mo_AT_mine",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_ArtyShots", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_AVailableNumberOfArtilleryAmmo",localize "STR_MRH_CBA_FireSupport_AVailableNumberOfArtilleryAmmoToolTip"], ["MRH_MilsimTools - Fire Suppport","Available artillery shots"],"10",1] call cba_settings_fnc_init;
//delay
["MRH_MilsimTools_Arty_DelayBetween", "SLIDER",   [localize "STR_MRH_CBA_Supports_GenCoolOffSetting",localize "STR_MRH_CBA_Supports_GenCoolOffSettingTooltip"],"MRH_MilsimTools - Fire Suppport",[0,6000,60,0],1] call cba_settings_fnc_init;

//--------------------------below are the settings for CAS SUpport
["MRH_MilsimTools_FireSupport_useCASSupport", "CHECKBOX",   [localize "STR_MRH_CBA_FireSupport_AllowCasSetting",localize "STR_MRH_CBA_FireSupport_AllowCasSettingToolTip"],["MRH_MilsimTools - CAS Suppport"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CAS_ConditionIsFormLeader", "CHECKBOX",   [localize "STR_MRH_CBA_Heli_MustBeFL",localize "STR_MRH_CBA_General_MustBEFlToolTip"], ["MRH_MilsimTools - CAS Suppport",localize "STR_MRH_CBA_FireSupport_ConditionsForCASCat"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CAS_isCustomConditionSet", "CHECKBOX",   [localize "STR_MRH_CBA_General_UseCustomCondition",localize "STR_MRH_CBA_General_UseCustomConditionToolTip"],["MRH_MilsimTools - CAS Suppport",localize "STR_MRH_CBA_FireSupport_ConditionsForCASCat"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CAS_CustomCondition", "EDITBOX",   [localize "STR_MRH_CBA_General_CustomConditionCodetoUse",localize "STR_MRH_CBA_General_CustomConditionCodetoUseToolTip"],["MRH_MilsimTools - CAS Suppport",localize "STR_MRH_CBA_FireSupport_ConditionsForCASCat"],"(isFormationLeader MRH_player) && ([MRH_player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio)",1] call cba_settings_fnc_init;


["MRH_MilsimTools_FireSupport_CASShots", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_AvailableNumberOfCas",localize "STR_MRH_CBA_FireSupport_AvailableNumberOfCasToolTip"], ["MRH_MilsimTools - CAS Suppport",localize "STR_MRH_CBA_FireSupport_AvailCASRunsCAT"],"5",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CASPlanesBluFor", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_CASAvailablePlanes",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - CAS Suppport",localize "STR_MRH_CBA_FireSupport_AvailPlanesBFCat"],"B_Plane_CAS_01_dynamicLoadout_F,B_Plane_Fighter_01_F,B_UAV_02_dynamicLoadout_F,B_UAV_05_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CASPlanesOpFor", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_CASAvailablePlanes",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - CAS Suppport",localize "STR_MRH_CBA_FireSupport_AvailPlanesOFCat"],"O_Plane_Fighter_02_F,O_UAV_02_dynamicLoadout_F,O_Plane_CAS_02_dynamicLoadout_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CASPlanesInde", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_CASAvailablePlanes",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - CAS Suppport",localize "STR_MRH_CBA_FireSupport_AvailPlanesINDCat"],"I_Plane_Fighter_04_F,I_Plane_Fighter_03_dynamicLoadout_F",1] call cba_settings_fnc_init;
//delay 
["MRH_MilsimTools_CAS_DelayBetween", "SLIDER",   [localize "STR_MRH_CBA_Supports_GenCoolOffSetting",localize "STR_MRH_CBA_Supports_GenCoolOffSettingTooltip"],"MRH_MilsimTools - CAS Suppport",[0,6000,120,0],1] call cba_settings_fnc_init;
//--------------------------below are the settings for  Supply drops
["MRH_MilsimTools_FireSupport_Supplies_useSupplyDrops", "CHECKBOX",   [localize "STR_MRH_CBA_FireSupport_Supplies_Allow",localize "STR_MRH_CBA_FireSupport_Supplies_AllowTooltip"],["MRH_MilsimTools - Supply drops"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_Supplies_ConditionIsFormLeader", "CHECKBOX",   [localize "STR_MRH_CBA_Heli_MustBeFL",localize "STR_MRH_CBA_General_MustBEFlToolTip"], ["MRH_MilsimTools - Supply drops", localize "STR_MRH_CBA_FireSupport_Supplies_ConditionsSupplies"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_Supplies_isCustomConditionSet", "CHECKBOX",   [localize "STR_MRH_CBA_General_UseCustomCondition",localize "STR_MRH_CBA_General_UseCustomConditionToolTip"],["MRH_MilsimTools - Supply drops",localize "STR_MRH_CBA_FireSupport_Supplies_ConditionsSupplies"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_Supplies_CustomCondition", "EDITBOX",   [localize "STR_MRH_CBA_General_CustomConditionCodetoUse",localize "STR_MRH_CBA_General_CustomConditionCodetoUseToolTip"],["MRH_MilsimTools - Supply drops",localize "STR_MRH_CBA_FireSupport_Supplies_ConditionsSupplies"],"(isFormationLeader MRH_player) && ([MRH_player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio)",1] call cba_settings_fnc_init;


["MRH_MilsimTools_FireSupport_NumberOfSuppliesDrops", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_Supplies_AvailSupplyDrpNb",localize "STR_MRH_CBA_FireSupport_Supplies_AvailSupplyDrpNbTooltip"], ["MRH_MilsimTools - Supply drops", localize "STR_MRH_CBA_FireSupport_Supplies_AvailSupplyDrpNb"],"3",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_SupplyPlanesBluFor", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_CASAvailablePlanes",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - Supply drops",localize "STR_MRH_CBA_FireSupport_AvailPlanesBFCat"],"B_T_VTOL_01_vehicle_F,B_Heli_Transport_03_unarmed_F,B_Heli_Transport_01_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_SupplyPlanesOpFor", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_CASAvailablePlanes",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - Supply drops",localize "STR_MRH_CBA_FireSupport_AvailPlanesOFCat"],"O_T_VTOL_02_vehicle_dynamicLoadout_F,O_Heli_Light_02_unarmed_F,O_Heli_Transport_04_box_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_SupplyPlanesInde", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_CASAvailablePlanes",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - Supply drops",localize "STR_MRH_CBA_FireSupport_AvailPlanesINDCat"],"I_Heli_Transport_02_F,I_Heli_light_03_unarmed_F,I_C_Plane_Civil_01_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_Supplies_ListOfAvailableSupplies", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_Supplies_ObjectsToAllow", localize "STR_MRH_CBA_FireSupport_Supplies_ObjectsToAllowTooltip"],["MRH_MilsimTools - Supply drops",localize "STR_MRH_CBA_FireSupport_Supplies_ObjectsToAllow"],"B_LSV_01_unarmed_F,ACE_Box_82mm_Mo_Combo,ACE_medicalSupplyCrate_advanced,ACE_Box_Misc,B_supplyCrate_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_Supplies_DistanceForAircraft", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_Supplies_DistancePDZ", localize "STR_MRH_CBA_FireSupport_Supplies_DistancePDZTooltip"],["MRH_MilsimTools - Supply drops",localize "STR_MRH_CBA_FireSupport_Supplies_DistancePDZ"],"2000",1] call cba_settings_fnc_init;
//delay 
["MRH_MilsimTools_SupplyDrop_DelayBetween", "SLIDER",   [localize "STR_MRH_CBA_Supports_GenCoolOffSetting",localize "STR_MRH_CBA_Supports_GenCoolOffSettingTooltip"],"MRH_MilsimTools - Supply drops",[0,6000,600,0],1] call cba_settings_fnc_init;
//-----------------below are the settings for insertion handler
["MRH_MilsimTools_InsertionHandler_SupplyPlanesBluFor", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_CASAvailablePlanes",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - Insertion Handler",localize "STR_MRH_CBA_FireSupport_AvailPlanesBFCat"],"B_T_VTOL_01_infantry_F,B_Heli_Transport_03_unarmed_F,B_Heli_Transport_01_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_InsertionHandler_SupplyPlanesOpFor", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_CASAvailablePlanes",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - Insertion Handler",localize "STR_MRH_CBA_FireSupport_AvailPlanesOFCat"],"O_T_VTOL_02_infantry_dynamicLoadout_F,O_Heli_Light_02_unarmed_F,O_Heli_Transport_04_box_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_InsertionHandler_SupplyPlanesInde", "EDITBOX",   [localize "STR_MRH_CBA_FireSupport_CASAvailablePlanes",localize "STR_MRH_CBA_General_ClassnamesTypeRulesToolTip"], ["MRH_MilsimTools - Insertion Handler",localize "STR_MRH_CBA_FireSupport_AvailPlanesINDCat"],"I_Heli_Transport_02_F,I_Heli_light_03_unarmed_F,I_C_Plane_Civil_01_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_InsertionHandler_allowStatic", "CHECKBOX",   [localize "STR_MRH_CBA_insertionHandler_settingUseStatic",localize "STR_MRH_CBA_insertionHandler_settingUseStaticToolTip"],["MRH_MilsimTools - Insertion Handler"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_InsertionHandler_allowHALO", "CHECKBOX",   [localize "STR_MRH_CBA_insertionHandler_settingUseHALO",localize "STR_MRH_CBA_insertionHandler_settingUseHALOToolTip"],["MRH_MilsimTools - Insertion Handler"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_InsertionHandler_allowSub","CHECKBOX",   [localize "STR_MRH_CBA_insertionHandler_settingUseSub",localize "STR_MRH_CBA_insertionHandler_settingUseSubToolTip"],["MRH_MilsimTools - Insertion Handler"],true,1] call cba_settings_fnc_init;
//-----------------below are the settings for Halo Gear Addon
["MRH_MilsimTools_HaloGear_hypoxiaUse", "CHECKBOX",   [localize "STR_MRH_CBA_HaloGear_enabEPOSet",localize "STR_MRH_CBA_HaloGear_enabEPOSetToolTip"],["MRH_MilsimTools - Halo Jumps"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_hypoxiaAltitude", "SLIDER",   [localize "STR_MRH_CBA_HaloGear_hypoAltSet",   localize "STR_MRH_CBA_HaloGear_hypoAltSetToolTip"], "MRH_MilsimTools - Halo Jumps", [0, 10000, 4600, 0],1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_missionConfiguredProtectiveGear", "EDITBOX",   [localize "STR_MRH_CBA_HaloGear_missionCfgProt",localize "STR_MRH_CBA_HaloGear_missionCfgProtTooltip"], "MRH_MilsimTools - Halo Jumps","RHS_jetpilot_usaf,rhs_zsh7a,rhs_zsh7a_alt,RHS_TU95MS_vvs_old",1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_AADDefaultOpeningAltitude", "EDITBOX",   [localize "STR_MRH_CBA_HaloGear_AADDefaultHeight",localize "STR_MRH_CBA_HaloGear_AADDefaultHeightToolTip"], ["MRH_MilsimTools - Halo Jumps", ""],"900",1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_allowManualAADSetting", "CHECKBOX",   [localize "STR_MRH_CBA_HaloGear_AllowManAAD",localize "STR_MRH_CBA_HaloGear_AllowManAADToolTip"],["MRH_MilsimTools - Halo Jumps"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_playRebreatherSounds", "CHECKBOX",   [localize "STR_MRH_CBA_HaloGear_PlayRebSounds",localize "STR_MRH_CBA_HaloGear_PlayRebSoundsTooltip"],["MRH_MilsimTools - Halo Jumps"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_haloMaskBreakingChancePerc", "SLIDER",   [localize "STR_MRH_CBA_HaloGear_OddsOfBreaking",localize "STR_MRH_CBA_HaloGear_OddsOfBreakingToolTip"], "MRH_MilsimTools - Halo Jumps", [0, 100, 10, 0],1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_disableMaskHud", "CHECKBOX",   [localize "STR_MRH_CBA_HaloGear_disableHud",localize "STR_MRH_CBA_HaloGear_disableHudToolTip"],["MRH_MilsimTools - Halo Jumps"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_disableMaskHudCompass", "CHECKBOX",   [localize "STR_MRH_CBA_HaloGear_disableHudCompass",localize "STR_MRH_CBA_HaloGear_disableHudElToolTip"],["MRH_MilsimTools - Halo Jumps"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_disableMaskHudAltimeter", "CHECKBOX",   [localize "STR_MRH_CBA_HaloGear_disableHudAlt",localize "STR_MRH_CBA_HaloGear_disableHudElToolTip"],["MRH_MilsimTools - Halo Jumps"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_HaloGear_disableMaskHudVelocity", "CHECKBOX",   [localize "STR_MRH_CBA_HaloGear_disableHudVel",localize "STR_MRH_CBA_HaloGear_disableHudElToolTip"],["MRH_MilsimTools - Halo Jumps"],false,1] call cba_settings_fnc_init;


//-----------below are the settings for the debug mode 
["MRH_MilsimTools_DebugTools_isDebugMode", "CHECKBOX",   [localize "STR_MRH_CBA_DebugMode_SettingName",localize "STR_MRH_CBA_DebugMode_SettingNameToolTip"],["MRH_MilsimTools - Debug Mode"],false,1,{call MRH_fnc_MilsimTools_DebugTools_debugHintboxInit;}] call cba_settings_fnc_init;

//--------- below are the settings for the field medical tent

["MRH_MilsimTools_MiscItems_FieldMedicalTentDeployTime", "SLIDER",   [localize "STR_MRH_CBA_MedTentDeploySetting",localize "STR_MRH_CBA_MedTentDeploySettingToolTip"], "MRH_MilsimTools - Medical Tent", [20, 120, 20, 0],1] call cba_settings_fnc_init;
["MRH_MilsimTools_MiscItems_FieldMedicalTentRepackTime", "SLIDER",   [localize "STR_MRH_CBA_MedTentRepackSetting",localize "STR_MRH_CBA_MedTentRepackSettingToolTip"], "MRH_MilsimTools - Medical Tent", [10, 120, 10, 0],1] call cba_settings_fnc_init;

//-----Below are the settings for FOB objects
["MRH_MilsimTools_FOB_BIG_composition", "EDITBOX",   [localize "STR_MRH_CBA_CompforFobSet",localize "STR_MRH_CBA_CompNameTootip"], ["MRH_MilsimTools - Deployable Fobs", "FOB"],"MRH_FieldHQSmall_default",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MiscItems_FOB_BIGDeployTime", "SLIDER",   [localize "STR_MRH_CBA_CompDeployTime",localize "STR_MRH_CBA_CompDeployTimeTooltip"], ["MRH_MilsimTools - Deployable Fobs", "FOB"], [20, 240, 20, 0],1] call cba_settings_fnc_init;
["MRH_MilsimTools_MiscItems_FOB_BIGRepackTime", "SLIDER",   [localize "STR_MRH_CBA_CompRepackTime",localize "STR_MRH_CBA_CompRepackTimeToolTip"], ["MRH_MilsimTools - Deployable Fobs", "FOB"], [20, 240, 20, 0],1] call cba_settings_fnc_init;
["MRH_MilsimTools_MiscItems_FOB_BIGRepackRadius", "SLIDER",   [localize "STR_MRH_CBA_CompDeleteDistRadius",localize "STR_MRH_CBA_CompDeleteDistRadiusToolTip"], ["MRH_MilsimTools - Deployable Fobs", "FOB"], [0, 100, 50, 0],1] call cba_settings_fnc_init;

["MRH_MilsimTools_CAMP_composition", "EDITBOX",   [localize "STR_MRH_CBA_CampDeployComp",localize "STR_MRH_CBA_CompNameTootip"], ["MRH_MilsimTools - Deployable Fobs", "Camp"],"MRH_SmallCamp_default",1] call cba_settings_fnc_init;
["MRH_MilsimTools_MiscItems_CAMP_DeployTime", "SLIDER",   [localize "STR_MRH_CBA_CampDeployTime",localize "STR_MRH_CBA_CompDeployTimeTooltip"], ["MRH_MilsimTools - Deployable Fobs", "Camp"], [10, 240, 10, 0],1] call cba_settings_fnc_init;
["MRH_MilsimTools_MiscItems_CAMP_GRepackTime", "SLIDER",   [localize "STR_MRH_CBA_CampRepackTime",localize "STR_MRH_CBA_CompRepackTimeToolTip"], ["MRH_MilsimTools - Deployable Fobs", "Camp"], [10, 240, 10, 0],1] call cba_settings_fnc_init;
["MRH_MilsimTools_MiscItems_CAMP_GRepackRadius", "SLIDER",   [localize "STR_MRH_CBA_CampRadiusAroundDelete",localize "STR_MRH_CBA_CompDeleteDistRadiusToolTip"], ["MRH_MilsimTools - Deployable Fobs", "Camp"], [0, 100, 10, 0],1] call cba_settings_fnc_init;