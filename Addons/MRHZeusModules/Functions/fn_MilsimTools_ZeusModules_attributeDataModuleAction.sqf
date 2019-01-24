/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
*/
#include "MRH_C_Path.hpp"
_display = findDisplay 200119;
(_display getVariable ["MRH_ZeusModules_displayparams",[objNull,objNull]]) params ["_logic","_unit"];

_allDataToAddData = [200119,1500] FUNC(allListBoxData);
_allPicsToAddData = [200119,1501] FUNC(allListBoxData);


if ((_allDataToAddData isEqualTo []) && (_allPicsToAddData isEqualTo [])) exitWith {[objNull, "Error: No data or pictures selected"] call BIS_fnc_showCuratorFeedbackMessage;};

switch (true) do 
{
	case (isPlayer _unit) :{
			if !(_allDataToAddData isEqualTo []) then
			{
				[_unit,_allDataToAddData]call MRH_fnc_MilsimTools_SoldierTab_attributeData;
			};
			if !(_allPicsToAddData isEqualTo []) then
			{
				[_unit,_allPicsToAddData]call MRH_fnc_MilsimTools_SoldierTab_attributePictures;
			};
		};

	case (!(isPlayer _unit) && (_unit isKindOf "Man")) : {
		[[_unit,_allDataToAddData,_allPicsToAddData],{
			params ["_unit","_allDataToAddData","_allPicsToAddData"];
			//[_unit,0,["ACE_MainActions","MRH_SoldierTab_CollectDataAndPics"]] call ace_interact_menu_fnc_removeActionFromObject;
			_statement = {
				(_this select 1)params ["_unit","_allDataToAddData","_allPicsToAddData"];
				if !(_allDataToAddData isEqualTo []) then
			{
				[player,_allDataToAddData]call MRH_fnc_MilsimTools_SoldierTab_attributeData;
			};
			if !(_allPicsToAddData isEqualTo []) then
			{
				[player,_allPicsToAddData]call MRH_fnc_MilsimTools_SoldierTab_attributePictures;
			};



			};
			[_unit, "I have some data for you pal! I'll transfer it to your tablet", _statement,"LOCAL",false,_this] call MRH_fnc_simpleAceMessage;
			
		}] RemoteExec ["Call",[0,-2] select isDedicated,true];

	};
	case !(_unit isKindOf "Man"): {
		[[_unit,_allDataToAddData,_allPicsToAddData],{
			params ["_unit","_allDataToAddData","_allPicsToAddData"];
			[_unit,0,["ACE_MainActions","MRH_SoldierTab_CollectDataAndPics"]] call ace_interact_menu_fnc_removeActionFromObject;
			[_unit,_allDataToAddData,_allPicsToAddData,false]call MRH_fnc_MilsimTools_SoldierTab_isDataCollectPoint;
		}] RemoteExec ["Call",[0,-2] select isDedicated,true];
	};
};
_receiverName = getText (configFile>>"cfgVehicles">>typeOf _unit >>"displayName");
if (_unit isKindOf "Man" ) then {_receiverName = name _unit};
_message = format [localize "STR_MRH_MRHMRHZeusModules_DATAATTOMESS",_receiverName];
[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;

closeDialog 0;
/*
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_ctrlTree = CTRLF(9902);
_ctrlText = CTRLF(9903);
_picsListBox = CTRLF(9904);
_picPreview =CTRLF(9905);
_refreshButton = CTRLF(9907);

_toAddDataListBox = CTRLF(1500);
_toAddPictureListBox = CTRLF()
*/