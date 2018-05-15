if !(serverCommandAvailable "#kick") ExitWith {};
#include "MRH_Components.hpp"
_handle = createDialog "MRHCustomAdminMenu";
disableSerialization;
//display missiontime
execVM SCRIPTPATH(MissionTime.sqf);
//displaymissioninfo
_percentage = publicPlayerKilled/publicAllPlayers*100;
_percentage = round _percentage;
_starttext = "Il y avait" +" "+"<t color='#26fc0a'>" + str publicAllPlayers +"</t>" +" " + "joueurs au départ.";
_percenttext = "<t color='#ff0022'>" + str _percentage +"</t>" + " pourcents de joueurs morts.";
_missiontext = "Vous jouez la mission:" + " " +"<t color='#ffa42d'>" + missionname +"</t><br/>" + "Il-y-a actuellement:" + " " + "<t color='#ffa42d'>"+ str (count allplayers)+"</t>" + " " +"joueur sur le serveur"
+ "<br/>" + _starttext + "<br/>" + _percenttext;
_missionInfoCtrl = FDIS(1102);
_missionInfoCtrl ctrlSetStructuredText parsetext _missiontext;

/////Fill playersList
_ctrlLIST = FDIS(1500);

{

_role = _x getVariable "DisplayName";
if (isNil "_role") then {_role = "Pas de rôle définit"};
_playernammetext = format ["%1, %2", _role,name _x]; 
_index = _ctrlLIST  lbAdd  _playernammetext;
lbSetData [1500, _index , str _x];

_deathcheck = _x getVariable "hasdied";
if (_deathcheck) then {
lbSetPictureColor [1500, _index, [0,0,0,0]];
lbSetPicture [1500, _index, PAAPATH(dead.paa)];}
else {
lbSetPictureColor [1500, _index, [0,0,0,0]];
lbSetPicture [1500, _index, PAAPATH(alive.paa)];}


} forEach AllPlayers;