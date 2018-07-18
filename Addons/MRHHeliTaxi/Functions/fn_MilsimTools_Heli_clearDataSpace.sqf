_VarName = "MRH_HeliTaxi_Available" + str (side player);
missionNamespace setVariable [_VarName,true,true];
_EHIndex = player getVariable "MRH_MilsimTools_HeliTaxi_KilledEHIndex";
player removeEventHandler ["Killed", _EHindex];
player setVariable ["MRH_TaxiHeli",nil];
deleteMarkerLocal "MRH_LZ_Marker_Back";
deleteMarkerLocal "MRH_LZ_Marker";
[player,1,["ACE_SelfActions","MRH_Taxi_Go"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","MRH_Taxi_Cancel"]] call ace_interact_menu_fnc_removeActionFromObject;