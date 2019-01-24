/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
[	
	[
		"MyTag_DataName","My menu title","my menu text"	
	]
] MRH_fnc_MilsimTools_ZeusModules_dataCreatorFileTemporaryData;

*/
#include "MRH_C_Path.hpp"
//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
#include "MRH_C_Path.hpp"
params ["_dataToCreate"];

_entryName = _dataToCreate select 0;
_missionData = missionNamespace getVariable ["MRH_SoldierTab_missionData",[]];
_missionDataSubs = missionNamespace getVariable ["MRH_SoldierTab_missionDataSubs",[]];
//delete previous temp data
if ((_missionData find _entryName) != -1) then 
{
	_missionData deleteAt (_missionData find _entryName);
	{
		if ((_x select 0)== _entryName) then {_missionDataSubs deleteAt (_missionDataSubs find _x);};

	}forEach _missionDataSubs;
};


_missionData pushBackUnique _entryName;
_missionDataSubs pushBackUnique _dataToCreate;
MNSVAR(missionData,_missionData,false);
MNSVAR(missionDataSubs,_missionDataSubs,false);