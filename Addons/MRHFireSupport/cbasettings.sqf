//--------------below are the settings for artillery fire support
["MRH_MilsimTools_FireSupport_useFireSupport", "CHECKBOX",   ["Allow use of fire support",""],["MRH_MilsimTools - Fire Suppport"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_ConditionIsFormLeader", "CHECKBOX",   ["Must be formation leader",""], ["MRH_MilsimTools - Fire Suppport","Conditions to be able to call an artillery strike"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_isCustomConditionSet", "CHECKBOX",   ["Use custom condition",""],["MRH_MilsimTools - Fire Suppport","Conditions to be able to call an artillery strike"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CustomCondition", "EDITBOX",   ["Custom condition code to use",""],["MRH_MilsimTools - Fire Suppport","Conditions to be able to call an artillery strike"],"(isFormationLeader player) && ([player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio)",1] call cba_settings_fnc_init;


["MRH_MilsimTools_FireSupport_ArtyMagazines", "EDITBOX",   ["Available artillery magazines","classnames separated by comas without quotes"], ["MRH_MilsimTools - Fire Suppport","Available artillery magazines"],"32Rnd_155mm_Mo_shells,6Rnd_155mm_Mo_smoke,6Rnd_155mm_Mo_mine,2Rnd_155mm_Mo_Cluster,6Rnd_155mm_Mo_AT_mine",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_ArtyShots", "EDITBOX",   ["Available number of artillery ammunition","Number, represents how many shots can be fired"], ["MRH_MilsimTools - Fire Suppport","Available artillery shots"],"10",1] call cba_settings_fnc_init;

//--------------------------below are the settings for CAS SUpport
["MRH_MilsimTools_FireSupport_useCASSupport", "CHECKBOX",   ["Allow use of CAS support",""],["MRH_MilsimTools - CAS Suppport"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CAS_ConditionIsFormLeader", "CHECKBOX",   ["Must be formation leader",""], ["MRH_MilsimTools - CAS Suppport","Conditions to be able to call a CAS strike"],true,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CAS_isCustomConditionSet", "CHECKBOX",   ["Use custom condition",""],["MRH_MilsimTools - CAS Suppport","Conditions to be able to call a CAS strike"],false,1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CAS_CustomCondition", "EDITBOX",   ["Custom condition code to use",""],["MRH_MilsimTools - CAS Suppport","Conditions to be able to call a CAS strike"],"(isFormationLeader player) && ([player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio)",1] call cba_settings_fnc_init;


["MRH_MilsimTools_FireSupport_CASShots", "EDITBOX",   ["Available number of CAS Runs","Number, represents how many times a side can call CAS"], ["MRH_MilsimTools - CAS Suppport","Available CAS runs"],"5",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CASPlanesBluFor", "EDITBOX",   ["Available planes","classnames separated by comas without quotes"], ["MRH_MilsimTools - CAS Suppport","Available planes for BluFor"],"B_Plane_CAS_01_dynamicLoadout_F,B_Plane_Fighter_01_F,B_UAV_02_dynamicLoadout_F,B_UAV_05_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CASPlanesOpFor", "EDITBOX",   ["Available planes","classnames separated by comas without quotes"], ["MRH_MilsimTools - CAS Suppport","Available planes for OpFor"],"O_Plane_Fighter_02_F,O_UAV_02_dynamicLoadout_F,O_Plane_CAS_02_dynamicLoadout_F",1] call cba_settings_fnc_init;

["MRH_MilsimTools_FireSupport_CASPlanesInde", "EDITBOX",   ["Available planes","classnames separated by comas without quotes"], ["MRH_MilsimTools - CAS Suppport","Available planes for Inde"],"I_Plane_Fighter_04_F,I_Plane_Fighter_03_dynamicLoadout_F",1] call cba_settings_fnc_init;