/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call ;
*/
params ["_sourceobject"];
_requiresTool = ["MRH_MilsimTools_RequireHackingTool"] call cba_settings_fnc_get;
_noGo = false;
if (_requiresTool) then 
{
	if !("MRH_HackingTool" in items player) then {hint (localize "STR_MRH_HP_HintToolIsRequired"); _noGo = true;};
};
if (_noGo) ExitWith {};

[_sourceobject] spawn {
	#include "MRH_C_Path.hpp"
	params ["_sourceobject"];
	210382 cutRsc ["MRHHackPhone", "PLAIN"];
	playSound "MRH_Functions_Hack";
	
	_HackTime = _sourceobject GVAR(HackTime); // Temps total du Hack
	_HackName = _sourceobject GVAR(HackName); 
	disableSerialization;

	_display = uiNamespace getVariable "MRHHackPhone";
	_ctrlPIC = (_display displayCtrl 1201);
	_ctrlPIC ctrlsettext "\MRHFunctions\img\hackphone\hackscreen.paa";
	_ctrlSIZE = (_display displayCtrl 1203)ctrlShow false;
	//ctrlShow [1203, false]; 
	_ctrlSPEED = (_display displayCtrl 1204);//on garde ce display pour le temps restant
	_SpeedText = "<t font = 'PuristaLight'><t size = '0.5'><t color ='#32b141'>"+ (localize "STR_MRH_HP_HackInprogress")+"</t>";
	_SpeedText = parsetext _SpeedText;
	_ctrlSPEED ctrlsetStructuredText _SpeedText;

	_ctrlDOWN = (_display displayCtrl 1205)ctrlShow false;
	 
	_ctrlDIST = (_display displayCtrl 1206);





	_progress = _sourceobject GVAR(progressdone);
	_hacking = true;


	_speedY = _sourceobject GVAR(speedyinterrupt);//a voir si on garde
	_sleep = _HackTime/100;
	while {_hacking} do {


	_progress = _progress + 0.01;
	(_display displayCtrl 1202) progressSetPosition _progress;

	////
	_dist = player distance _sourceobject;
	switch (true) do {
	case (_dist > 20):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\signallost.paa"; hint (localize "STR_MRH_HP_SgnalLost"); _hacking = false; sleep 2; _display closedisplay 2; _sourceobject SVAR(progressdone, _progress,false);};
	case (_dist > 15 && _dist <=20):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\0bar.paa";};
	case (_dist > 10 && _dist <=15):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\1bar.paa"};
	case (_dist > 5 && _dist <=10):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\2bar.paa"};
	case (_dist < 5 && _dist >=0):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\fullsignal.paa"};
	};
	////
	//((findDisplay 210382) displayCtrl 1202) progressSetPosition _progress;
	sleep _sleep;
	if (_progress >= 1) then {_hacking = false; hint (localize "STR_MRH_HP_HackComplete"); _display closedisplay 2;
	[_sourceobject,0,["ACE_MainActions","hack"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
	missionnamespace setVariable [_HackName, true,true];
	_codeToRun = _sourceobject GVAR(hackCodeToRun);
	[_sourceobject] spawn _codeToRun;
	//publicVariable _HackName;
	//publicVariableServer _HackName;
	playSOund "MRH_Functions_biptimer";
	};
	};
};