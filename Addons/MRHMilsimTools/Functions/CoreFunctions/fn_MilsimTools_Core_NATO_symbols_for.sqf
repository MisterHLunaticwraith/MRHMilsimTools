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
	params ["_grp"];
	private ["_icon","_modifier","_leader"];
	_leader = leader _grp;
	switch (true) do 
	{
		case (isNull (objectParent _leader)):{
				if ((rank _leader) in ["CAPTAIN","MAJOR","COLONEL"])then {_icon ="\A3\Ui_f\data\Map\Markers\NATO\b_hq.paa"}else {_icon ="\A3\Ui_f\data\Map\Markers\NATO\b_inf.paa"
			}};
		case( (objectParent _leader)isKindOf "AIR") :{_icon ="\A3\ui_f\data\map\markers\nato\b_plane.paa"};
		case( (objectParent _leader)isKindOf "Car") :{_icon = "\A3\ui_f\data\map\markers\nato\b_motor_inf.paa"};
		case( (objectParent _leader)isKindOf "APC_Tracked_01_base_F") :{_icon = "\A3\ui_f\data\map\markers\nato\b_mech_inf.paa"};
		case( (objectParent _leader)isKindOf "Tank") :{_icon = "\A3\ui_f\data\map\markers\nato\b_armor.paa"};
		case( (objectParent _leader)isKindOf "Static") :{_icon ="\A3\ui_f\data\map\markers\nato\b_mortar.paa"};
		case( (objectParent _leader)isKindOf "Boat_F") :{_icon ="\A3\ui_f\data\map\markers\nato\b_naval.paa"};
		default {_icon ="\A3\Ui_f\data\Map\Markers\NATO\b_inf.paa"};
	};
		


	switch (true) do 
	{
		case (rank _leader == "PRIVATE"): {_modifier =""};
		case (rank _leader == "CORPORAL"): {_modifier = "\A3\ui_f\data\map\markers\nato\group_0.paa";};
		case (rank _leader == "SERGEANT"): {_modifier = "\A3\ui_f\data\map\markers\nato\group_1.paa"};
		case (rank _leader == "LIEUTENANT"): {_modifier ="\A3\ui_f\data\map\markers\nato\group_3.paa"};
		case (rank _leader == "CAPTAIN"): {_modifier ="\A3\ui_f\data\map\markers\nato\group_4.paa"};
		case (rank _leader == "MAJOR"): {_modifier ="\A3\ui_f\data\map\markers\nato\group_5.paa"};
		case (rank _leader == "COLONEL"): {_modifier ="\A3\ui_f\data\map\markers\nato\group_6.paa"};
	};
	[_icon,_modifier]