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

	params ["_unit","_previous"];
	_previous params ["_recordNotes","_recordHelmet","_recordVest","_recordUniform","_recordBackPack","_recordPW","_recordSW","_recordHGW","_recordAmmo","_recordItems","_recordEquips","_recordGenInfo"];
	([(loadAbs _unit)]FUNC(armaWeightToReal)) params ["_weight","_units"];
	player setDiaryRecordText [["MRH_Loadout_summary", _recordGenInfo],
			[
				(localize "STR_MRH_LO_Di_LDINFO"),
				"<font size='18' color='#BD8700'>" +(toUpper (localize "STR_MRH_LO_Di_LDINFO")) +"</font><br/><br/>"+
				(localize "STR_MRH_LO_Di_TotalWeight")+" "+"<font color='#2bfa06'>" +(_weight toFixed 2) + " " + _units + "</font><br/><br/>"+
				(localize "STR_MRH_LO_Di_UniSpace")+ ([([(loadUniform _unit)*100,17]FUNC(diaryPercentageBar)),"<br/><br/><font color='#ff0000'>"+(localize "STR_MRH_LO_Di_NOTEQUIP")+"</font><br/><br/>"]select ((uniform _unit )isEqualTo ""))+
				(localize "STR_MRH_LO_Di_VestSpace") + ([([(loadVest _unit)*100,17]FUNC(diaryPercentageBar)),"<br/><br/><font color='#ff0000'>"+(localize "STR_MRH_LO_Di_NOTEQUIP")+"</font><br/><br/>"]select ((vest _unit )isEqualTo ""))+
				(localize "STR_MRH_LO_Di_BPSpace")+ ([([(loadBackpack _unit)*100,17]FUNC(diaryPercentageBar)),"<br/><br/><font color='#ff0000'>"+(localize "STR_MRH_LO_Di_NOTEQUIP")+"</font><br/><br/>"]select ((backpack _unit )isEqualTo ""))
			]
	];

	player setDiaryRecordText [["MRH_Loadout_summary", _recordHelmet], [(localize "STR_MRH_LO_Di_LT_Helmet"),"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_Helmet")) +"</font><br/><br/>"+([headGear _unit]FUNC(generateItemText))]];
	
	player setDiaryRecordText [["MRH_Loadout_summary", _recordVest], [(localize "STR_MRH_LO_Di_LT_VEST"), "<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_VEST")) +"</font><br/><br/>"+([Vest _unit]FUNC(generateItemText))+"<br/><br/>"+(localize "STR_MRH_LO_Di_VestSpace") + ([([(loadVest _unit)*100,17]FUNC(diaryPercentageBar)),"<br/><br/><font color='#ff0000'>"+"<br/><br/>"+(localize "STR_MRH_LO_Di_NOTEQUIP")+"</font><br/><br/>"]select ((vest _unit )isEqualTo ""))]];

	player setDiaryRecordText [["MRH_Loadout_summary", _recordUniform], [(localize "STR_MRH_LO_Di_LT_UNI"), "<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_UNI")) +"</font><br/><br/>"+([uniform _unit]FUNC(generateItemText))+"<br/><br/>"+(localize "STR_MRH_LO_Di_UniSpace")+ ([([(loadUniform _unit)*100,17]FUNC(diaryPercentageBar)),"<br/><br/><font color='#ff0000'>"+"<br/><br/>"+(localize "STR_MRH_LO_Di_NOTEQUIP")+"</font><br/><br/>"]select ((uniform _unit )isEqualTo ""))]];

	player setDiaryRecordText [["MRH_Loadout_summary", _recordBackPack], [(localize "STR_MRH_LO_Di_LT_BackPack"),"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_BackPack")) +"</font><br/><br/>"+([backpack _unit,true]FUNC(generateItemText))+"<br/><br/>"+(localize "STR_MRH_LO_Di_BPSpace")+ ([([(loadBackpack _unit)*100,17]FUNC(diaryPercentageBar)),"<br/><br/><font color='#ff0000'>"+"<br/><br/>"+(localize "STR_MRH_LO_Di_NOTEQUIP")+"</font><br/><br/>"]select ((backpack _unit )isEqualTo ""))]];

	player setDiaryRecordText [["MRH_Loadout_summary", _recordPW], [(localize "STR_MRH_LO_Di_LT_PW"),"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_PW")) +"</font><br/><br/>"+([primaryWeapon _unit,false,false,true]FUNC(generateItemText)) +([_unit,true,1]FUNC(generateMagazinesText))]];
	
	player setDiaryRecordText [["MRH_Loadout_summary", _recordSW], [(localize "STR_MRH_LO_Di_LT_SW"), "<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_SW")) +"</font><br/><br/>"+([secondaryWeapon _unit,false,false,true]FUNC(generateItemText)) +([_unit,true,2]FUNC(generateMagazinesText))]];

	player setDiaryRecordText [["MRH_Loadout_summary", _recordHGW], [(localize "STR_MRH_LO_Di_LT_HG"), "<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_HG")) +"</font><br/><br/>"+([handGunWeapon _unit,false,false,true]FUNC(generateItemText)) +([_unit,true,3]FUNC(generateMagazinesText))]];

	player setDiaryRecordText [["MRH_Loadout_summary", _recordAmmo], [(localize "STR_MRH_LO_Di_LT_AMMO"), "<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_AMMO")) +"</font><br/><br/>"+([_unit]FUNC(generateMagazinesText))]];

	player setDiaryRecordText [["MRH_Loadout_summary", _recordItems], [(localize "STR_MRH_LO_Di_ITEMS"), "<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_ITEMS"))+"</font><br/><br/>"+([_unit,true]FUNC(generateMagazinesText))]];

	player setDiaryRecordText [["MRH_Loadout_summary", _recordEquips], [(localize "STR_MRH_LO_Di_EQUIPMENT"), "<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_EQUIPMENT")) +"</font><br/><br/>"+([_unit,true,4]FUNC(generateMagazinesText))]];
	//player setDiaryRecordText [["MRH_Loadout_summary", diaryRecord], [title, text]];