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
_indexBF = _rosterSideDisplay lbadd "BluFor";
lbSetData [2101, _indexBF , "Blu"];
_indexOF = _rosterSideDisplay lbadd "OpFor";
lbSetData [2101, _indexOF , "Op"];
_indexInd = _rosterSideDisplay lbadd "Independents";
lbSetData [2101, _indexInd , "Inde"];
_indexCiv = _rosterSideDisplay lbadd "Civilians";
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
_starttext = "Il y avait" +" "+"<t color='#26fc0a'>" + str COUNT_ALIVE +"</t>" +" " + "joueurs au départ.";
_percenttext = "<t color='#ff0022'>" + str _percentage +"</t>" + " pourcents de joueurs morts.";
_currentMissionText = "Vous jouez la mission:" + " " +"<t color='#ffa42d'>" + missionname +"</t><br/>" + "Il-y-a actuellement:" + " " + "<t color='#ffa42d'>"+ str (count allplayers)+"</t>" + " " +"joueur sur le serveur";
_Disconnected = "<t color='#ff0022'>" +str COUNT_OFFLINE +"</t>" + " " + "players have left the server since mission start.";
_totalDead = COUNT_ALLDEAD / (COUNT_ONLINE +COUNT_OFFLINE)*100;
_totalDeadText = "During the mission" + " " +"<t color='#ff0022'>" + str _totalDead + "</t>" + " " + "percent players have died, including players that have left the server";

_missiontext = _currentMissionText + "<br/>" + _starttext + "<br/>" + _percenttext + "<br/>" + _Disconnected + "<br/>" +_totalDeadText;

_missiontext = "<t size ='0.8'>" + _missiontext + "</t>";
_missionInfoCtrl = FDIS(1101);
_missionInfoCtrl ctrlSetStructuredText parsetext _missiontext;

//disableSerialization;
[] spawn {
	_CtrlMissionTime = FDIS(1100);
	while {ctrlShown _CtrlMissionTime} do 
		{
		_formatedTime = [time/3600,"HH:MM:SS"] call BIS_fnc_timeToString;
		_stringfinal = "<t size ='0.8'>"+ "Mission name:" + " "+"<t color='#ffa42d'>" + missionname + "</t></t>"+ "<br/>" + " "+ "<t size ='0.7'>" + "time since mission start:"+ " " + "<t color='#26fc0a'>" + _formatedTime + "</t>";
		_CtrlMissionTime ctrlSetStructuredText parsetext _stringfinal;
		sleep 1;
		};
};