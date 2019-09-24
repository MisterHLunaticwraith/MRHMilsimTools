/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
['all'] call MRH_fnc_MilsimTools_DebugTools_showAddonsButtonAction;
*/
#include "MRH_C_Path.hpp"

params [["_type","all"]];
_ARGS= [false,false];
_command ={(_ARGS call MRH_fnc_MilsimTools_DebugTools_ListModsAndAddons) select 0};
_help = "";
switch (true) do
{
	case (_type isEqualTo "all") : {_ARGS = [false,false]; _help = (localize "STR_MRH_MRHDebugTools_helpAll")};
	case (_type isEqualTo "forgithub") : {_ARGS =[true,true]; _help = (localize "STR_MRH_MRHDebugTools_helpGitHub")};
	case (_type isEqualTo "onlyAddons") : {_command = {[] call MRH_fnc_MilsimTools_DebugTools_readAbleList}; _help = (localize "STR_MRH_MRHDebugTools_allAddons")};
	case (_type isEqualTo "onlyMods") : {_command = {true call MRH_fnc_MilsimTools_DebugTools_readAbleList}; _help = (localize "STR_MRH_MRHDebugTools_onlyMods")};
};
_display = findDisplay 390;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_LOGTEXT = CTRLF(1207);
_HELPTEXT = CTRLF(1206);

_logToPrint = call _command;



_LOGTEXT ctrlSetText _logToPrint;
_HELPTEXT ctrlSetStructuredText parseText _help;
[390,1207] CFUNC(SetCtrlSize);
[390,1206] CFUNC(SetCtrlSize);
