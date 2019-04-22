//Defines _RHS_CBPS
#define ADDON MRH_RHS_CBPS
#define ADDONVAR RHS_CBPS

//Defines list of paths
#define ROOTPATH "MRH_RHS_CBPS
#define SCRIPTPATH(ARG) ROOTPATH\scripts\scr_##ARG"
#define PAAPATH(ARG) ROOTPATH\paa\##ARG"
#define CFGPATH(ARG) ROOTPATH\cfgHPP\##ARG"
#define GUIPATH(ARG) ROOTPATH\gui\##ARG"

//defines functions shortcurts
#define FUNC(ARG) call MRH_fnc_MilsimTools_##ADDONVAR##_##ARG
#define CFUNC(ARG) call MRH_fnc_MilsimTools_Core_##ARG
#define EFUNC(ARG1,ARG2) call MRH_fnc_MilsimTools_##ARG1##_##ARG2
#define GFUNC(ARG) call MRH_fnc_##ARG

//--spawned funcs, always use with params or empty params eg [] SFUNC(someFunc)
#define SFUNC(ARG) spawn MRH_fnc_MilsimTools_##ADDONVAR##_##ARG
#define SCFUNC(ARG) spawn MRH_fnc_MilsimTools_Core_##ARG
#define SEFUNC(ARG1,ARG2) spawn MRH_fnc_MilsimTools_##ARG1##_##ARG2
#define SGFUNC(ARG) spawn MRH_fnc_##ARG
#define QFUNC(ARG) QUOTE##MRH_fnc_MilsimTools_RHS_CBPS_##ARG##QUOTE
//Defines setVariables shortcuts
#define QUOTE "
#define ESVAR(ARG1,ARG2,ARG3) setVariable [##QUOTE##MRH_##ARG1##QUOTE,##ARG2,##ARG3]
#define EGVAR(ARG) getVariable ##QUOTE##MRH_##ARG##QUOTE
#define SVAR(ARG1,ARG2,ARG3) setVariable [##QUOTE##MRH_##ADDONVAR##_##ARG1##QUOTE,##ARG2,##ARG3]
#define GVAR(ARG) getVariable ##QUOTE##MRH_##ADDONVAR##_##ARG##QUOTE
#define GVARDef(ARG,ARG2) getVariable [##QUOTE##MRH_##ADDONVAR##_##ARG##QUOTE,##ARG2] 
#define PLSVAR(ARG1,ARG2,ARG3) player setVariable [##QUOTE##MRH_##ADDONVAR##_##ARG1##QUOTE,##ARG2,##ARG3]
#define PLGVAR(ARG) player getVariable ##QUOTE##MRH_##ADDONVAR##_##ARG##QUOTE
#define MNSVAR(ARG1,ARG2,ARG3) missionNamespace setVariable [##QUOTE##MRH_##ADDONVAR##_##ARG1##QUOTE,##ARG2,##ARG3]
#define MNGVAR(ARG) missionNamespace getVariable ##QUOTE##MRH_##ADDONVAR##_##ARG##QUOTE
#define UISVAR(ARG1,ARG2,ARG3) uiNamespace setVariable [##QUOTE##MRH_##ADDONVAR##_##ARG1##QUOTE,##ARG2,##ARG3]
#define UIGVAR(ARG) uiNamespace getVariable ##QUOTE##MRH_##ADDONVAR##_##ARG##QUOTE

//Defines find display shortcut
#define FDIS(ARG) ((finddisplay 03062018) displayCtrl ##ARG##)

//Defines player registry shortcuts
#define PLAYERREGISTRY_INIT missionNameSpace getVariable ["MRH_MilsimTools_Core_allPlayersAtInit",[]]
#define PLAYERREGISTRY_ONLINE missionNameSpace getVariable ["MRH_MilsimTools_Core_allPlayersOnline",[]]
#define PLAYERREGISTRY_CURDEAD missionNameSpace getVariable ["MRH_MilsimTools_Core_allCurrentlyDeadPlayers",[]]
#define PLAYERREGISTRY_ALLDEAD missionNameSpace getVariable ["MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers",[]]
#define PLAYERREGISTRY_OFFLINE missionNameSpace getVariable ["MRH_MilsimTools_Core_allDisconnectedPlayers",[]]
#define PLAYERREGISTRY_ALIVE missionNameSpace getVariable ["MRH_MilsimTools_Core_allAlivePlayers",[]]

#define COUNT_INIT count (PLAYERREGISTRY_INIT)
#define COUNT_ONLINE count (PLAYERREGISTRY_ONLINE)
#define COUNT_CURDEAD count (PLAYERREGISTRY_CURDEAD)
#define COUNT_ALLDEAD count (PLAYERREGISTRY_ALLDEAD)
#define COUNT_OFFLINE count (PLAYERREGISTRY_OFFLINE)
#define COUNT_ALIVE count (PLAYERREGISTRY_ALIVE)

//redefines ctrlsize function for this mod
#define CTRLRSZ(ARG) [03062018,##ARG##] CFUNC(SetCtrlSize)