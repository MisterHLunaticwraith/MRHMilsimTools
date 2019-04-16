/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
if (is3DEN) exitWith {};

params ["_sourceObjectArray","_typeOfFob"];
_sourceObject = _sourceObjectArray select 0;
_composition = "";
_deployTime = 0;
_repackTime =0;
_repackRadius = 0;

switch (true) do {
	case (_typeOfFob == "MainFob") : {
		 _composition = ["MRH_MilsimTools_FOB_BIG_composition"] call cba_settings_fnc_get;
		 _deployTime = ["MRH_MilsimTools_MiscItems_FOB_BIGDeployTime"] call cba_settings_fnc_get;
		 _repackTime = ["MRH_MilsimTools_MiscItems_FOB_BIGRepackTime"] call cba_settings_fnc_get;
		 _repackRadius = ["MRH_MilsimTools_MiscItems_FOB_BIGRepackRadius"] call cba_settings_fnc_get;

	};
	case (_typeOfFob == "Camp") : {
		 _composition = ["MRH_MilsimTools_CAMP_composition"] call cba_settings_fnc_get;
		 _deployTime = ["MRH_MilsimTools_MiscItems_CAMP_DeployTime"] call cba_settings_fnc_get;
		 _repackTime = ["MRH_MilsimTools_MiscItems_CAMP_GRepackTime"] call cba_settings_fnc_get;
		 _repackRadius = ["MRH_MilsimTools_MiscItems_CAMP_GRepackRadius"] call cba_settings_fnc_get;

	};
};
_parameters=[_sourceObject,_composition,_repackRadius,_deployTime,_repackTime];
_message = format ["MRH_MilsimTools_FOB_init, called with params %1, parameters passed to deployable FOB %2",_this,_parameters];
TRACE(_message);
_parameters CFUNC(isDeployableFob);
