/*
Function name: MRH_fnc_MilsimTools_Admin_FillMissionPage
Author: Mr H.
Description:  Fills the page for the mission page
Return value: None
Public: No
Parameters: None
Example(s):
call MRH_fnc_MilsimTools_Admin_FillMissionPage;
*/
#include "MRH_C_Path.hpp"

disableSerialization;



_ctrlToShow = [1100,2300,1101,1602,1603,1604,1605,2100,1102,1103,2800,1104,2801,2101,2301,1105];
_ctrlToHide = [1106,2302,1107,1607,1608,2102,1609,1610,1200,1611,1108];
{
ctrlShow [_x,false];
} forEach _ctrlToHide;

{
ctrlShow [_x,true];
} forEach _ctrlToShow;


FUNC(RefreshPlayersList);

//fill roster side selection choice
_rosterSideDisplay = FDIS(2101);
lbClear 2101;
_indexBF = _rosterSideDisplay lbadd (localize "STR_MRH_FILL_MS_PAGE_blufor");
lbSetData [2101, _indexBF , "Blu"];
_indexOF = _rosterSideDisplay lbadd (localize "STR_MRH_FILL_MS_PAGE_opfor");
lbSetData [2101, _indexOF , "Op"];
_indexInd = _rosterSideDisplay lbadd (localize "STR_MRH_FILL_MS_PAGE_ind");
lbSetData [2101, _indexInd , "Inde"];
_indexCiv = _rosterSideDisplay lbadd (localize "STR_MRH_FILL_MS_PAGE_civs");
lbSetData [2101, _indexCiv , "Civ"];
_rosterSideDisplay lbSetCurSel _indexBF;
FUNC(ApplyRoster);


//feed the possible endings to the endings list
_ctrlEndingLists = FDIS(2100);
_indexDefault = _ctrlEndingLists lbadd (localize "STR_MRH_ADM_DEB_ADMINTEMINATED");
lbSetData [2100, _indexDefault , "MRH_DefaultAdminEndMission"];
_ctrlEndingLists lbSetCurSel _indexDefault;
_allDebriefingEntries = [(missionconfigFile >> "CfgDebriefing")]call BIS_fnc_getCfgSubClasses;
{
_text = gettext (missionconfigFile >> "CfgDebriefing">>_x>>"title");
_value = _x;
_index = _ctrlEndingLists lbadd _text;
lbSetData [2100, _index, _value];
} forEach _allDebriefingEntries;

//mission details text

//displaymissioninfo
_percentage = COUNT_CURDEAD/COUNT_ONLINE*100;
_percentage = round _percentage;
_starttext = (localize "STR_MRH_FILL_MS_PAGE_THEREWERE") +" "+"<t color='#26fc0a'>" + str COUNT_INIT +"</t>" +" " + (localize"STR_MRH_FILL_MS_PAGE_PLAYERSATSTARTUP");
_percenttext = "<t color='#ff0022'>" + str _percentage +"</t>" + " " +(localize "STR_MRH_FILL_MS_PAGE_Percentplayerdead");
_currentMissionText = (localize "STR_MRH_FILL_MS_PAGE_YOUAREPLAYING") + " " +"<t color='#ffa42d'>" + missionname +"</t><br/>" + (localize "STR_MRH_FILL_MS_PAGE_thereareCur") + " " + "<t color='#ffa42d'>"+ str (count allplayers)+"</t>" + " " +(localize "STR_MRH_FILL_MS_PAGE_playersonthisserver");
_Disconnected = "<t color='#ff0022'>" +str COUNT_OFFLINE +"</t>" + " " + (localize "STR_MRH_FILL_MS_PAGE_playersgonesincemssstart");
_totalDead = COUNT_ALLDEAD / (COUNT_ONLINE +COUNT_OFFLINE)*100;
_totalDeadText = (localize "STR_MRH_FILL_MS_PAGE_DuringMission") + " " +"<t color='#ff0022'>" + str _totalDead + "</t>" + " " + (localize "STR_MRH_FILL_MS_PAGE_PercentDiedOverall");

_aliveWEST =  {alive _x && (side _x == west) && !isPlayer _x} count allUnits;
_aliveEAST =  {alive _x && (side _x == east) && !isPlayer _x} count allUnits;
_aliveINDE =  {alive _x && (side _x == Independent) && !isPlayer _x} count allUnits;
_aliveCIVs =  {alive _x && (side _x == Civilian) && !isPlayer _x} count allUnits;
_AliveWestText = (localize "STR_MRH_FILL_MS_PAGE_blufor") + " " + "<t color='#0970f7'>" + str _aliveWEST + "</t>" + "<br/>";
_AliveEastText = (localize "STR_MRH_FILL_MS_PAGE_opfor") + " " + "<t color='#ff0022'>" + str _aliveEAST + "</t>" + "<br/>";
_AliveIndeText = (localize "STR_MRH_FILL_MS_PAGE_ind") + " " + "<t color='#00c652'>" + str _aliveINDE + "</t>" + "<br/>";
_AliveCivText = (localize "STR_MRH_FILL_MS_PAGE_civs") + " " + "<t color='#c600b3'>" + str _aliveCIVs + "</t>" + "<br/>";
_remainingPerSideText = (localize "STR_MRH_FILL_RemainingUnitsPerSide") + "<br/>" + _AliveWestText + _AliveEastText + _AliveIndeText + _AliveCivText +(localize "STR_MRH_FILL_NOTINCLUDINGPLAYERS");

_missiontext = _currentMissionText + "<br/><br/>" + _starttext + "<br/>" + _percenttext + "<br/>" + _Disconnected + "<br/>" +_totalDeadText + "<br/><br/>" + _remainingPerSideText;

_missiontext = "<t size ='0.8'>" + _missiontext + "</t>";
_missionInfoCtrl = FDIS(1101);
_missionInfoCtrl ctrlSetStructuredText parsetext _missiontext;

//disableSerialization;

_CtrlMissionTime = FDIS(1100);

[{
	params ["_ctrlMissionTime"];
	_formatedTime = [time/3600,"HH:MM:SS"] call BIS_fnc_timeToString;
		_stringfinal = "<t size ='0.8'>"+ (localize "STR_MRH_FILL_MS_PAGE_MissionTitleName") + " "+"<t color='#ffa42d'>" + missionname + "</t></t>"+ "<br/>" + " "+ "<t size ='0.7'>" + (localize "STR_MRH_FILL_MS_PAGE_TimeSpentMissStart")+ " " + "<t color='#26fc0a'>" + _formatedTime + "</t>";
		_CtrlMissionTime ctrlSetStructuredText parsetext _stringfinal;
},
[_ctrlMissionTime],
{},
{
	params ["_ctrlMissionTime"];
	ctrlShown _CtrlMissionTime
},
1
] CFUNC(conditionalPFEH);