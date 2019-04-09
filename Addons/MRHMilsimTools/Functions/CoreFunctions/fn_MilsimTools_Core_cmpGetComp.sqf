/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_compName"];
_comp = [];
_traceMessage = "";
// if an array is provided the it's the composition
if (_compName isEqualType []) exitWith {_compName};

//if not an array it has to be a string
if !(_compName isEqualType "") exitWith {TRACE("MRH Composition Getter: error, element provided is neither a string nor an array")};



//function will search in configfile from mission to generalconfigfile

_compFromMissionCfg =getarray (missionConfigFile >>"cfgMRHcompositions">>_compName>>"mrhComp");

if !(_compFromMissionCfg isEqualTo []) exitWith {
	_traceMessage = format ["MRH Composition Getter: composition found in missionConfigFile %1",_compFromMissionCfg];
	TRACE(_traceMessage);
	
	_compFromMissionCfg
	
	};

//if not found in mission cfg search in  configFile
_compFromCfg =getarray (ConfigFile >>"cfgMRHcompositions">>_compName>>"mrhComp");
if !(_compFromCfg isEqualTo []) exitWith {
	_traceMessage = format ["MRH CompositionGetter: composition found in configFile %1",_compFromCfg];
	TRACE(_traceMessage);
	_compFromCfg
	
	};
//return empty array if nothing was found
_traceMessage = format ["MRH Composition getter: no composition found for %1",_compName];
TRACE(_tracemessage);
_comp