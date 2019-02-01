#define ROOTPATH "MRHJipMenu
#define CFGPATH(ARG) ROOTPATH\cfgHPP\##ARG"
#define PAAPATH(ARG) ROOTPATH\paa\##ARG"
#define GUIPATH(ARG) ROOTPATH\gui\##ARG"
#define FUNC(ARG) call MRH_fnc_MilsimTools_Jip_##ARG
#define CFUNC(ARG) call MRH_fnc_MilsimTools_Core_##ARG
#define EFUNC(ARG1,ARG2) call MRH_fnc_MilsimTools_##ARG1##_##ARG2
#define GFUNC(ARG) call MRH_fnc_##ARG
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

#define IS_DEBUG ["MRH_MilsimTools_DebugTools_isDebugMode"] call cba_settings_fnc_get
#define TRACE(ARG) [(##ARG##)] call MRH_fnc_MilsimTools_DebugTools_trace