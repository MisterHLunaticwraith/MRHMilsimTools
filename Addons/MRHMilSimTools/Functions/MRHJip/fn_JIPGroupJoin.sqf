//Pour debugguer et ou/tester avec des IA jouables remplacer toutes les références à Groupwithplayers par allgroups
GroupsWithPlayers = [];
{
	_units = units _x;
	if ({isPlayer _x} count _units >= 1) then {
		GroupsWithPlayers set [count GroupsWithPlayers,_x];
	};
} forEach allGroups;













disableSerialization;
///====donne le groupe du joueur
_orggroup = format ["%1",groupID group player]; //_orggroup = format ["%1", group player];
_orggroup = parsetext _orggroup;
_data = "";
((findDisplay 210382) displayCtrl 1101) ctrlSetStructuredText _orggroup;


///ctrlbox référence la combobox ctrlList le menu déroulant
_ctrlBOX = ((findDisplay 210382) displayCtrl 2100);

/////liste et assigne les groupes disponibles au combo
{
_text = format ["%1",groupID _x]; //_text = format ["%1", _x];
_value = _ctrlBOX  lbAdd  _text;
lbSetData [2100, _value, str _x];

} forEach GroupsWithPlayers;






/////variables initialisées
reset = false;
groupSelected = "";
groupleader = objNull;
soldats = [];
//selectedgroup = "";
listen = 1;

////////// Début de la boucle

[] spawn { while {listen == 1} do {

///définit la fenêtre liste
disableSerialization;
_ctrlLIST = ((findDisplay 210382) displayCtrl 1500);
///////

selectedgroup = lbData [ 2100, (lbCurSel 2100)];
sleep 2;
selectedgroup2 = lbData [ 2100, (lbCurSel 2100)];
if (selectedgroup != selectedgroup2) then {lbClear 1500; reset = true;}; //selectedgroup = selectedgroup2;
{

    _group = _x;
    _groupName = format["%1", _group];
    if (_groupName == selectedgroup2) then {   ////2
        groupSelected = _group;
		groupleader = leader _x; /////meileure solution passer par les leaders
    };
} forEach GroupsWithPlayers;
soldats = units group groupleader arrayIntersect playableUnits; //soldats = units group groupleader;

if (reset) then {
{
_text2 = format ["%1, %2", _x getVariable "DisplayName",name _x];   //_text2 = format ["%1", _x];
_value2 = _ctrlLIST  lbAdd  _text2;

lbSetPictureColor [1500, _value2, [0,0,0,0]];
deathcheck = _x getVariable "hasdied";
if (deathcheck) then {lbSetPicture [1500, _value2, "\MRHMilSimTools\GUI\dead.paa"];}
else {lbSetPicture [1500, _value2, "\MRHMilSimTools\GUI\alive.paa"];};
lbSetData [1500, _value2, str _x]; ///_value2
} forEach soldats;
reset = false;
}

 else {reset = false};


//



};
};
[] spawn { while {listen == 1} do {selectedplayer = lbData [ 1500, (lbCurSel 1500)];
{

    
    _soldiername = format["%1", _x];
    if (_soldiername == selectedplayer) then {   ////2
        playerselected = _x;
		
    };
} forEach soldats;



};};
