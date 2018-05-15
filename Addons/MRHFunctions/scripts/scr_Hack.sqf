
210382 cutRsc ["MRHHackPhone", "PLAIN"];
playSound "Hack";
_sourceobject = _this select 0;
_HackTime = _sourceobject getVariable "HackTime"; // Temps total du Hack
_HackName = _sourceobject getVariable "HackName"; 
disableSerialization;

_display = uiNamespace getVariable "MRHHackPhone";
_ctrlPIC = (_display displayCtrl 1201);
_ctrlPIC ctrlsettext "\MRHFunctions\img\hackphone\hackscreen.paa";
_ctrlSIZE = (_display displayCtrl 1203)ctrlShow false;
//ctrlShow [1203, false]; 
_ctrlSPEED = (_display displayCtrl 1204);//on garde ce display pour le temps restant
_SpeedText = "<t font = 'PuristaLight'><t size = '0.5'><t color ='#32b141'>Piratage en cours.</t>";
_SpeedText = parsetext _SpeedText;
_ctrlSPEED ctrlsetStructuredText _SpeedText;

_ctrlDOWN = (_display displayCtrl 1205)ctrlShow false;
 
_ctrlDIST = (_display displayCtrl 1206);





_progress = _sourceobject getVariable "progressdone";
_hacking = true;


_speedY = _sourceobject getVariable "speedyinterrupt";//a voir si on garde
_sleep = _HackTime/100;
while {_hacking} do {


_progress = _progress + 0.01;
(_display displayCtrl 1202) progressSetPosition _progress;

////
_dist = player distance _sourceobject;
switch (true) do {
case (_dist > 20):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\signallost.paa"; hint "Signal perdu"; _hacking = false; sleep 2; _display closedisplay 2; _sourceobject setVariable ["progressdone", _progress];};
case (_dist > 15 && _dist <=20):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\0bar.paa";};
case (_dist > 10 && _dist <=15):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\1bar.paa"};
case (_dist > 5 && _dist <=10):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\2bar.paa"};
case (_dist < 5 && _dist >=0):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\fullsignal.paa"};
};
////
//((findDisplay 210382) displayCtrl 1202) progressSetPosition _progress;
sleep _sleep;
if (_progress >= 1) then {_hacking = false; hint "Piratage terminé"; _display closedisplay 2;
[_sourceobject,0,["ACE_MainActions","hack"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
missionnamespace setVariable [_HackName, true,true];
//publicVariable _HackName;
//publicVariableServer _HackName;
playSOund "biptimer";
};
};
