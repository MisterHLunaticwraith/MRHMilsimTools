disableSerialization;
_ctrlLIST = ((findDisplay 030590) displayCtrl 1500);
_ctrlDEADTEXT = ((findDisplay 030590) displayCtrl 1100);
_ctrlSTARTPLAYERS = ((findDisplay 030590) displayCtrl 1101);
_ctrlPERCENT = ((findDisplay 030590) displayCtrl 1102);
_percentage = publicPlayerKilled/publicAllPlayers*100;
_percentage = round _percentage;
///liste des joueurs morts dans la liste:
{
disableSerialization;


deathcheck = _x getVariable "hasdied";
if (deathcheck) then {
_text2 = format ["%1, %2", _x getVariable "DisplayName",name _x];   //_text2 = format ["%1", _x];
_value2 = _ctrlLIST  lbAdd  _text2;
lbSetPictureColor [1500, _value2, [0,0,0,0]];
lbSetPicture [1500, _value2, "\MRHMilSimTools\GUI\dead.paa"];
}

} forEach AllPlayers;
////prépare les messages:
_deadtext = format ["%1 joueurs sont morts.",publicPlayerKilled];
_deadtext = "<t font = 'PuristaLight'>" + _deadtext + "</t>";
_deadtext = parsetext _deadtext;

_starttext = format ["Il y avait %1 joueurs au départ.",publicAllPlayers];
_starttext = "<t font = 'PuristaLight'>" + _starttext + "</t>";
_starttext = parsetext _starttext;

_percenttext = format ["%1 pourcents de joueurs morts.",_percentage];
_percenttext = "<t font = 'PuristaLight'>" + _percenttext + "</t>";
_percenttext = parsetext _percenttext;
//// remplis les messages
_ctrlDEADTEXT ctrlSetStructuredText _deadtext;
_ctrlSTARTPLAYERS ctrlSetStructuredText _starttext;
_ctrlPERCENT ctrlSetStructuredText _percenttext;