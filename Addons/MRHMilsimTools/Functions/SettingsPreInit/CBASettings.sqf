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