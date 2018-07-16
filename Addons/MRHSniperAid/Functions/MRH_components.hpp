#define ROOTPATH "\MRHSatellite
#define SCRIPTPATH(ARG) ROOTPATH\Scripts\scr_##ARG"
#define PAAPATH(ARG) ROOTPATH\Paa\##ARG"
#define QUOTE "
#define FUNC(ARG) call MRH_fnc_##ARG
#define SVAR(ARG1,ARG2,ARG3) setVariable [##QUOTE##MRH_##ARG1##QUOTE,##ARG2,##ARG3]
#define GVAR(ARG) getVariable ##QUOTE##MRH_##ARG##QUOTE
#define HASACE3 missionNamespace getVariable "MRH_hasAce3"
#define SETTINGSFULLSCREEN ["MRH_SAT_allowFullscreen"] call cba_settings_fnc_get
#define SETTINGSALLOWLASERING ["MRH_SAT_allowLasering"] call cba_settings_fnc_get
#define SETTINGSALLOWTARGETDETECTION ["MRH_SAT_allowTargetDetection"] call cba_settings_fnc_get
#define SETTINGSALLOWTARGETTRACKING ["MRH_SAT_allowTargetTracking"] call cba_settings_fnc_get
