#include "MRH_components.hpp"
["MRH_MilsimTools_RadioChatter_restartRadios",
	{
		false FUNC(killAllRadios);
		private _allMissionRadios = missionNamespace getVariable ["MRH_MilsimTools_RadioChatter_AllMissionRadios",[]];
		{
			private _loopParams = _x getVariable ["MRH_MilsimTools_RadioChatter_loopParams",[]];
			if (_loopParams isEqualTo []) exitWith {};
			_x setVariable ["MRH_RadioChatter_RadioOn",true,true];
			_loopParams FUNC(RadioLoop);
		}forEach _allMissionRadios;
	}
] call CBA_fnc_addEventHandler;