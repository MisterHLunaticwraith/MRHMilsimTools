#define FDIS(ARG) ((finddisplay 312103) displayCtrl ##ARG##)
disableSerialization;
_CtrlMissionTime = FDIS(1101);
while {ctrlShown _CtrlMissionTime} do {

_formatedTime = [time/3600,"HH:MM:SS"] call BIS_fnc_timeToString;
_stringfinal = "Temps écoulé depuis le début de la mission:"+ " " + "<t color='#26fc0a'>" + _formatedTime + "</t>";
_CtrlMissionTime ctrlSetStructuredText parsetext _stringfinal;
sleep 1;
};