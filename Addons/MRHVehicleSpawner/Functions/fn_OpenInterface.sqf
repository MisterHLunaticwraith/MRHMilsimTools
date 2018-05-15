///creates the dialog
createdialog "MRHSpawner";
/////////////////////
disableserialization;
//////////sets defaultpic
_pic = "\MRHVehicleSpawner\Paa\welcome.paa";
((findDisplay 2121) displayCtrl 1201) ctrlSetText _pic;
_icon = "\MRHVehicleSpawner\Paa\mrhmodsLOGO.paa";
((findDisplay 2121) displayCtrl 1203) ctrlSetText _icon;




[] Spawn {
disableserialization;
call MRH_fnc_RefreshMainList;
_sourceObject = player getVariable "SourceObjectSpawner";///ici
_Type = _sourceObject getVariable "TypeToSpawn"; 
waitUntil {!isNil "_Type"};
disableserialization;
///// DEFINES CATEGORY CHOICES
_ctrlcombo = ((findDisplay 2121) displayCtrl 2100);

switch (true) do {
case (_Type == "All") : {
_allTypes = _ctrlcombo lbadd "All";
lbSetData [2100, _allTypes, "All"]; 
_Helis = _ctrlcombo lbadd "Hélicoptères";
lbSetData [2100, _Helis, "Helis"]; 
_Planes = _ctrlcombo lbadd "Avions";
lbSetData [2100, _Planes, "Planes"];
_Drones = _ctrlcombo lbadd "Drones";
lbSetData [2100, _Drones, "Drones"];
_Cars = _ctrlcombo lbadd "Voitures";
lbSetData [2100, _Cars, "Cars"]; 
_Trucks = _ctrlcombo lbadd "Camions";
lbSetData [2100, _Trucks, "Trucks"];
_APCs= _ctrlcombo lbadd "APCs";
lbSetData [2100, _APCs, "APCs"];
_MRAPs = _ctrlcombo lbadd "MRAPs";
lbSetData [2100, _MRAPs, "MRAPs"];
_Tanks = _ctrlcombo lbadd "Tanks";
lbSetData [2100, _Tanks, "Tanks"];
};

case (_Type == "Air") : {
_allTypes = _ctrlcombo lbadd "All";
lbSetData [2100, _allTypes, "All"];
_Helis = _ctrlcombo lbadd "Hélicoptères";
lbSetData [2100, _Helis, "Helis"]; 
_Planes = _ctrlcombo lbadd "Avions";
lbSetData [2100, _Planes, "Planes"];
_Drones = _ctrlcombo lbadd "Drones";
lbSetData [2100, _Drones, "Drones"];
};

case (_Type == "Land") : {
_allTypes = _ctrlcombo lbadd "All";
lbSetData [2100, _allTypes, "All"];
_Cars = _ctrlcombo lbadd "Voitures";
lbSetData [2100, _Cars, "Cars"]; 
_Trucks = _ctrlcombo lbadd "Camions";
lbSetData [2100, _Trucks, "Trucks"];
_APCs= _ctrlcombo lbadd "APCs";
lbSetData [2100, _APCs, "APCs"];
_MRAPs = _ctrlcombo lbadd "MRAPs";
lbSetData [2100, _MRAPs, "MRAPs"];
_Tanks = _ctrlcombo lbadd "Tanks";
lbSetData [2100, _Tanks, "Tanks"];
};
};





///EndSpawnBelow
};