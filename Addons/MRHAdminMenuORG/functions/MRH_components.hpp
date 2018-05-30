#define ROOTPATH "\MRHAdminMenu
#define SCRIPTPATH(ARG) ROOTPATH\scripts\scr_##ARG"
#define PAAPATH(ARG) ROOTPATH\paa\##ARG"
#define QUOTE "
#define FUNC(ARG) call MRH_fnc_##ARG
#define SVAR(ARG1,ARG2,ARG3) setVariable [##QUOTE##MRH_##ARG1##QUOTE,##ARG2,##ARG3]
#define GVAR(ARG) getVariable ##QUOTE##MRH_##ARG##QUOTE
#define FDIS(ARG) ((finddisplay 312103) displayCtrl ##ARG##)
