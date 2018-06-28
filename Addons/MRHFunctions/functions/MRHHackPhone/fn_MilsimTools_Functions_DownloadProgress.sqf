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
	//disableSerialization;
	210382 cutRsc ["MRHHackPhone", "PLAIN"];
	//_handle = findDisplay 46 createDisplay "MRHHackPhone";
	//_handle = createdialog "MRHHackPhone";
	//a faire: ajouter eventhandlerpourdetecterla fermeture du dialogue etmettre fin austricpt

	_sourceobject = _this select 0;
	_FileSize = _sourceobject GVAR(FileSize); // en Mo
	_FileName = _sourceobject GVAR(FileName); 
	disableSerialization;

	_display = uiNamespace getVariable "MRHHackPhone";
	_ctrlSIZE = (_display displayCtrl 1203);
	_ctrlSPEED = (_display displayCtrl 1204);
	_ctrlDOWN = (_display displayCtrl 1205);
	_ctrlDIST = (_display displayCtrl 1206);
	//_ctrlSIZE = ((findDisplay 210382) displayCtrl 1203); 
	//_ctrlSPEED = ((findDisplay 210382) displayCtrl 1204);
	//_ctrlDOWN = ((findDisplay 210382) displayCtrl 1205); 
	///afficher la taille du fichier
	_FileSizeText = "<t font = 'PuristaLight'><t size = '0.5'><t color ='#32b141'>" + (localize "STR_MRH_HP_SizeColumn")+ " " + str _FileSize + "Mo" + "</t>";
	_FileSizeText = parsetext _FileSizeText;
	_ctrlSIZE ctrlsetStructuredText _FileSizeText;
	///

	_FileSize = _FileSize *8;
	_progress = _sourceobject GVAR(progressdone);
	_downloading = true;


	_speedY = _sourceobject GVAR(speedyinterrupt);
	////
	while {_downloading} do {


	playSound "MRH_Functions_biptimer";
	_speed = random [3,5,7];//Mbs
	_speedY = (_speed + _speedY);
	_speedrate = [_speed,2] call BIS_fnc_cutDecimals;
	_SpeedText = "<t font = 'PuristaLight'><t size = '0.5'><t color ='#32b141'>" + (localize "STR_MRH_HP_SpeedColumn")+ " " + str _speedrate + "Mb/s" + "</t>";
	_SpeedText = parsetext _SpeedText;
	_ctrlSPEED ctrlsetStructuredText _SpeedText;


	_progressrate = (_speed/_FileSize);


	_progress = _progress + _progressrate;
	_progressvalue = _speedY/8; 
	//_FileSize/10 *_progress;
	_progressvalue = [_progressvalue,2] call BIS_fnc_cutDecimals;
	_progresstext = "<t font = 'PuristaLight'><t size = '0.5'><t color ='#32b141'>" + (localize "STR_MRH_HP_ReceivedColumn")+ " " + str _progressvalue + "Mo" + "</t>";
	_progresstext = parsetext _progresstext;
	_ctrlDOWN ctrlsetStructuredText _progresstext;
	(_display displayCtrl 1202) progressSetPosition _progress;

	////
	_dist = player distance _sourceobject;
	switch (true) do {
	case (_dist > 20):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\signallost.paa"; hint (localize "STR_MRH_HP_SgnalLost"); _downloading = false; sleep 2; _display closedisplay 2; _sourceobject SVAR(progressdone, _progress,false); _sourceobject SVAR(speedyinterrupt, _speedY,false);};
	case (_dist > 15 && _dist <=20):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\0bar.paa";};
	case (_dist > 10 && _dist <=15):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\1bar.paa"};
	case (_dist > 5 && _dist <=10):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\2bar.paa"};
	case (_dist < 5 && _dist >=0):{_ctrlDIST ctrlsetText "\MRHFunctions\img\hackphone\fullsignal.paa"};
	};
	////
	//((findDisplay 210382) displayCtrl 1202) progressSetPosition _progress;
	sleep 1;
	if (_progress >= 1) then {_downloading = false; hint (localize "STR_MRH_HP_DlFinished"); _display closedisplay 2;
	[_sourceobject,0,["ACE_MainActions","download"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
	missionnamespace setVariable [_FileName, true,true];
	_codeToRun = _sourceobject GVAR(codeToRun);
	[_sourceobject] spawn _codeToRun;
	//publicVariable _FileName;
	//publicVariableServer _FileName;
	};
	};
};