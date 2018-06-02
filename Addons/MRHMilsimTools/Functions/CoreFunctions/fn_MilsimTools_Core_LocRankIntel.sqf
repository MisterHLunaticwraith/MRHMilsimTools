/*
Function name:MRH_fnc_MilsimTools_Core_LocRankIntel
Author: Mr H.
Description: returns given unit's localized rank, path to rank image , nato code for the rank
you can define customized pics in a cfgMRHRankPictures, see online documentation
Return value: <ARRAY> of <STRINGS> in the form [localized Rank, path to image file, nato code ]
Public: yes
Parameters: <OBJECT> unit to check
Example(s):
_allIntel = [player] call MRH_fnc_MilsimTools_Core_LocRankIntel;
_localizedRank = ([player] call MRH_fnc_MilsimTools_Core_LocRankIntel) select 0;
_rankPaa =([player] call MRH_fnc_MilsimTools_Core_LocRankIntel) select 1;
_natoCode = ([player] call MRH_fnc_MilsimTools_Core_LocRankIntel) select 2;
*/
params ["_unit"];

//get unit's rank
_rank = rank _unit;

// get pic from mission config file, if nothing  search in configfile
_srcCfg= missionConfigFile;
_allRanks = getarray (missionconfigFile>>"cfgMRHRankPictures">>"allMRHRanks");
if (_allRanks isEqualTo []) then 
{
_allRanks = getarray (configFile>>"cfgMRHRankPictures">>"allMRHRanks");
_srcCfg = configFile;
};
//find config entry:
_cfgEntry = "";
{
_entrycheck = getText (_srcCfg >>"cfgMRHRankPictures">>_x>>"rank");
if (_rank == _entrycheck) then {_cfgEntry = _x};

} forEach _allranks;


_rankPic = gettext (_srcCfg>>"cfgMRHRankPictures">>_cfgEntry>>"rankPic");

//security: reset to cfg if no new is found
if (_rankPic == "") then {_rankPic = gettext (configFile>>"cfgMRHRankPictures">>_cfgEntry>>"rankPic");};


// create necessary variables
_localizedName = "";
_natoCode = "";

// localize the ranks and give nato code

switch (true) do 
{
case (_rank == "PRIVATE") : {_localizedName = localize "STR_MRH_MS_LOCALIZED_RANKS_PRIVATE"; _natoCode ="OR-1";};
case (_rank == "CORPORAL") : {_localizedName = localize "STR_MRH_MS_LOCALIZED_RANKS_CORPORAL"; _natoCode ="OR-4";};
case (_rank == "SERGEANT") : {_localizedName = localize "STR_MRH_MS_LOCALIZED_RANKS_SERGEANT"; _natoCode ="OR-5";};
case (_rank == "LIEUTENANT") : {_localizedName = localize "STR_MRH_MS_LOCALIZED_RANKS_LIEUTENANT"; _natoCode ="OF-1";};
case (_rank == "CAPTAIN") : {_localizedName = localize "STR_MRH_MS_LOCALIZED_RANKS_CAPTAIN"; _natoCode ="OF-2";};
case (_rank == "MAJOR") : {_localizedName = localize "STR_MRH_MS_LOCALIZED_RANKS_MAJOR"; _natoCode ="OF-3";};
case (_rank == "COLONEL") : {_localizedName = localize "STR_MRH_MS_LOCALIZED_RANKS_COLONEL"; _natoCode ="OF-5";};


};
//return value
[_localizedName,_rankPic,_natoCode]