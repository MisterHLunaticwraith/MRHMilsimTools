openMap [true,true];
hint "Selectionnez une LZ";
onMapSingleClick {
	onMapSingleClick "";
	_availableDoubleCheck = call MRH_fnc_MilsimTools_Heli_isHeliTaxiAvailable;
	if !(_availableDoubleCheck) ExitWith {hint "Quelqu'un d'autre a déjà appelé le Taxi, taxi indisponible";openMap [false,false];};
	deleteMarkerLocal "MRH_LZ_Marker";
	hint "LZ selectionnée";
	_suitablePos = [_pos] call MRH_fnc_MilsimTools_Heli_findSuitableLZ;
	_marker = createMarkerLocal ["MRH_LZ_Marker", _suitablePos];
	_marker setMarkerTypeLocal "MRH_Heli";
	_marker setMarkerTextLocal "LZ sélectionnée";
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerAlphaLocal 1;
	[] Spawn {sleep 5; openMap [false,false];};
	[_suitablePos] call MRH_fnc_MilsimTools_Heli_HeliOnTheWay;
	_VarName = "MRH_HeliTaxi_Available" + str (side player);
	missionNamespace setVariable [_VarName,false,true];
};