/*
Function name: MRH_fnc_MilsimTools_SoldierTab_isDataCollectPoint
Author: Mr H.
Description: turns any item into a data collect point (ace action)
Return value: none
Public: yes
Parameters:
0-<OBJECT> object to add the action to
1 - <ARRAY>- Optionnal -Array of strings of data entries to give to the player (defined in MRH_SoldierTabData config entry)
2 - <ARRAY>-Optionnal -Array of pictures to give to the player (defined in MRH_SoldierTabIntelPictures)
3 - <BOOLEAN> -optionnal - true to remove action after the data is collected, default false
Example(s):
[this,["dataEntry1","dataEntry2"],[],true]call MRH_fnc_MilsimTools_SoldierTab_isDataCollectPoint;
or
[this,["dataEntry2"],["pic1"],true]call MRH_fnc_MilsimTools_SoldierTab_isDataCollectPoint;
or
[this,[],["pic2"],false]call MRH_fnc_MilsimTools_SoldierTab_isDataCollectPoint;
*/
#include "MRH_C_Path.hpp"
params ["_object",["_Data",[]],["_pictures",[]],["_remove",false]];
_object SVAR(DataToCollect,_data,true);
_object SVAR(PicturesToCollect,_pictures,true);
_object SVAR(MustBeRemoved,_remove,true);

_statement = {
	if !("MRH_SoldierTab" in items MRH_player) ExitWith {hint (localize "STR_MRH_ST_FC_HintNeedTab");};
	_object = _this select 0;
	_Data = _object GVAR(DataToCollect);
	if !(_Data isEqualTo []) then {[MRH_player,_Data] FUNC(attributeData);};
	_Pictures = _object GVAR(PicturesToCollect);
	if !(_Pictures isEqualTo []) then {[MRH_player,_Pictures] FUNC(attributePictures);};
	_remove = _object GVAR(MustBeRemoved);
	if (_remove) then {
		[_object,0,["ACE_MainActions","MRH_SoldierTab_CollectDataAndPics"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
	};

};

_action =
["MRH_SoldierTab_CollectDataAndPics", 
(localize "STR_MRH_ST_FC_CollectDataACE"),
 PAAPATH(download.paa), 
 
_statement 


, 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 