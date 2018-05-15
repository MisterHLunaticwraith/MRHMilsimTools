/*
* This Function filters all vehicles according to settings
* generates "MRHSpawnerFinalVehiclesList"
*/
/// valeurs récupérées:
_sourceObject = player getVariable "SourceObjectSpawner";///ici
_Type = _sourceObject getVariable "TypeToSpawn"; 
waitUntil {!isNil "_Type"};
_allvehiclesArray = missionNamespace getVariable "SPAWNER_ALLConfigVehicles";

_resultingArray = [];

/////////////////////
switch (true) do {
case (_Type == "Air"): {{if (_x isKindOf "Helicopter_Base_F" or _x isKindOf "Plane_Base_F" ) then {_resultingArray pushBack _x; };} forEach _allvehiclesArray;};
case (_Type == "Land") : {{if (_x isKindOf "Car_F" or _x isKindOf "Tank_F") then {_resultingArray pushBack _x; };} forEach _allvehiclesArray;};
case (_Type == "All") : {_resultingArray = _allvehiclesArray};
};

_selectedType = player getVariable "MRH_SpawnerUSERSELECTEDVEHICLETYPE";
if !(isNil "_selectedType") then {
_selectedTypeARRAY = [];

switch (true) do {
case (_selectedType == "All") : {_selectedTypeARRAY = _resultingArray;};

case (_selectedType == "Helis") : {{_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory");if (_subcat != "EdSubcat_Drones" ) then {if (_x isKindOf "Helicopter_Base_F") then {_selectedTypeARRAY pushBack _x; };};} forEach _resultingArray;};

case (_selectedType == "Planes") : {{_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory");if (_subcat != "EdSubcat_Drones" ) then {if (_x isKindOf "Plane_Base_F") then {_selectedTypeARRAY pushBack _x; };};} forEach _resultingArray;};

case (_selectedType == "Drones") : {{_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory");if (_subcat == "EdSubcat_Drones" ) then {if (_x isKindOf "Helicopter_Base_F" or _x isKindOf "Plane_Base_F" or _x isKindOf "UAV" ) then {_selectedTypeARRAY pushBack _x; };};} forEach _resultingArray;};

case (_selectedType == "APCs") : {{_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory"); if (_subcat == "EdSubcat_APCs" ) then {_selectedTypeARRAY pushBack _x; };} forEach _resultingArray;};

case (_selectedType == "Cars") : {{_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory"); if (_subcat == "EdSubcat_Cars" ) then {_selectedTypeARRAY pushBack _x; };} forEach _resultingArray;};

case (_selectedType == "Tanks") : {{_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory"); if (_subcat == "EdSubcat_Tanks" ) then {_selectedTypeARRAY pushBack _x; };} forEach _resultingArray;};

case (_selectedType == "MRAPs") : {{_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory"); if (_subcat == "rhs_EdSubcat_mrap" ) then {_selectedTypeARRAY pushBack _x; };} forEach _resultingArray;};

case (_selectedType == "Trucks") : {{_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory"); if (_subcat == "rhs_EdSubcat_truck" ) then {_selectedTypeARRAY pushBack _x; };} forEach _resultingArray;};
//casetemplate//case (_selectedType == "") : {{if () then {_selectedTypeARRAY pushBack _x; };} forEach _resultingArray;};




////endswitch
};
/////endifselectedtype
_resultingArray = _selectedTypeARRAY;
};



///functionsresultsreturnbelow

_resultingArray;