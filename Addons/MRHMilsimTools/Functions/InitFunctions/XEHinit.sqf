#include "MRH_C_Path.hpp"
_fullVersioning = (call MRH_fnc_MilsimTools_DebugTools_ListModsAndAddons) select 0;
_toTraceFullV = format ["MRH MilsimTools: Activated mods and addons:%1 %2",endl,_fullVersioning];
TRACE(_toTraceFullV);
_toTraceJustAddonsAndMods = format["MRH Milsim Tools activated mods: %1 %2 %3 activated addons: %4 %5",endl,(true call MRH_fnc_MilsimTools_DebugTools_readAbleList),endl,endl,(call MRH_fnc_MilsimTools_DebugTools_readAbleList)];
TRACE(_toTraceJustAddonsAndMods);

MRH_MISSION_ROOT_FOUND = true;
if ((str missionConfigFile)isEqualTo "") then {
	MRH_MISSION_ROOT_FOUND = false;
	private _toTraceHasDesc = format ["Mission: %1 has no description.ext",missionName];
	TRACE(_toTraceHasDesc);
	};
	
if(MRH_MISSION_ROOT_FOUND) then {
	MRH_MISSION_ROOT = call {
		private "_arr";
		_arr = toArray str missionConfigFile;
		_arr resize (count _arr - 15);
		toString _arr
	};
	_missionRootTrace = format ["MRH Milsim Tools Core- Local mission root is: %1",MRH_MISSION_ROOT];
	TRACE(_missionRootTrace);
};
