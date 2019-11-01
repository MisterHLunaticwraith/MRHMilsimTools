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
params ["_unit"];
	private _use = ["MRH_MilsimTools_LD_ShowLoadOutInBrief"]call cba_settings_fnc_get;
	if !(_use) exitWith {};
	private _previous = missionNamespace getVariable ["MRH_MilsimTools_Core_LoadOutDiaryHandles",[]];
	if !(_previous isEqualTo []) exitWith {[_unit,_previous]FUNC(updateLoadOutText)};
	player createDiarySubject ["MRH_Loadout_summary",(localize "STR_MRH_LO_Di_LDMAINT"),"\MRHMarkers\paa\repack.paa"];
	private _recordNotes = player createDiaryRecord ["MRH_Loadout_summary", 
			[
				(localize "STR_MRH_LO_Di_NOTES"),
				"<font size='18' color='#BD8700'>" +(localize "STR_MRH_LO_Di_LTTITLE") +"</font><br/><br/>"+ (localize "STR_MRH_LO_Di_LTMTADD") + "<img image='\MRHMilsimTools\POWEREDBYMT_ca.paa' width='256' height='128'/>"
			]



		];
	private _recordHelmet = player createDiaryRecord ["MRH_Loadout_summary", 
				[
					(localize "STR_MRH_LO_Di_LT_Helmet"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_Helmet")) +"</font><br/><br/>"+([headGear _unit]FUNC(generateItemText))
				]



			];
	private _recordVest = player createDiaryRecord ["MRH_Loadout_summary", 
				[
					(localize "STR_MRH_LO_Di_LT_VEST"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_VEST")) +"</font><br/><br/>"+([Vest _unit]FUNC(generateItemText))
				]
	];

	private _recordUniform= player createDiaryRecord ["MRH_Loadout_summary",
				[
					(localize "STR_MRH_LO_Di_LT_UNI"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_UNI")) +"</font><br/><br/>"+([uniform _unit]FUNC(generateItemText))
				]
	];

	private _recordBackPack = player createDiaryRecord ["MRH_Loadout_summary",
				[
					(localize "STR_MRH_LO_Di_LT_BackPack"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_BackPack")) +"</font><br/><br/>"+([backpack _unit,true]FUNC(generateItemText))
				]
	];

	private _recordPW = player createDiaryRecord ["MRH_Loadout_summary",
				[
					(localize "STR_MRH_LO_Di_LT_PW"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_PW")) +"</font><br/><br/>"+([primaryWeapon _unit,false,false,true]FUNC(generateItemText)) +([_unit,true,1]FUNC(generateMagazinesText))
				]
	];
	private _recordSW = player createDiaryRecord ["MRH_Loadout_summary",
				[
					(localize "STR_MRH_LO_Di_LT_SW"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_SW")) +"</font><br/><br/>"+([secondaryWeapon _unit,false,false,true]FUNC(generateItemText)) +([_unit,true,2]FUNC(generateMagazinesText))
				]
	];

	private _recordHGW = player createDiaryRecord ["MRH_Loadout_summary",
				[
					(localize "STR_MRH_LO_Di_LT_HG"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_HG")) +"</font><br/><br/>"+([handGunWeapon _unit,false,false,true]FUNC(generateItemText)) +([_unit,true,3]FUNC(generateMagazinesText))
				]
	];

	private _recordAmmo = player createDiaryRecord ["MRH_Loadout_summary",
				[
					(localize "STR_MRH_LO_Di_LT_AMMO"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_LT_AMMO")) +"</font><br/><br/>"+([_unit]FUNC(generateMagazinesText))
				]
	];

	private _recordItems = player createDiaryRecord ["MRH_Loadout_summary",
				[
					(localize "STR_MRH_LO_Di_ITEMS"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_ITEMS"))+"</font><br/><br/>"+([_unit,true]FUNC(generateMagazinesText))
				]
	];

	private _recordEquips = player createDiaryRecord ["MRH_Loadout_summary",
				[
					(localize "STR_MRH_LO_Di_EQUIPMENT"),
					"<font size='18' color='#BD8700'>" +(toUpper(localize "STR_MRH_LO_Di_EQUIPMENT")) +"</font><br/><br/>"+([_unit,true,4]FUNC(generateMagazinesText))
				]
	];
	private _recordHandles = [_recordNotes,_recordHelmet,_recordVest,_recordUniform,_recordBackPack,_recordPW,_recordSW,_recordHGW,_recordAmmo,_recordItems,_recordEquips];
	missionNamespace setVariable ["MRH_MilsimTools_Core_LoadOutDiaryHandles",_recordHandles];