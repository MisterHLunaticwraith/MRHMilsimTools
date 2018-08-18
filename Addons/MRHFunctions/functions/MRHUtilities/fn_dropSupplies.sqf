/*
Function name:MRH_fnc_dropSupplies
Author: Mr H.
Description: Creates a plane and paradrops supplies on provides position.
Please note: if the plane is well, a plane it will fly at a 400m height while a heli will fly at 150m, also when the dropped object reaches 100m an IR strobe and a green smoke grenade will be attached to it to make for easier recovery.
Return value: true
Public: Yes
Parameters:
0 -<STRING> classname of plane to spawn
1 -<ARRAY> position where to drop the supplies
2 -<STRING> or <OBJECT> if string: classname of object to create, if object, object present in the missionConfigFile
3 -<SIDE> - Side of the created plane can be West / Blufor (Arma 3), East / Opfor (Arma 3), Resistance / Independent (Arma 3), Civilian, sideLogic, Friendly, Enemy or Unknown.
4- <NUMBER> optional, distance (in meters) from the dropzone where the plane will be created, default is 3000m 
Example(s):
["C_Plane_Civil_01_F",position player,"C_Scooter_Transport_01_F",Civilian]call MRH_fnc_dropSupplies;// receive a cool water scooter by cesna
or
["B_Heli_Transport_03_F",position player,myCrate,side player,1000] call MRH_fnc_dropSupplies;// a chinook will deliver object myCrate
*/
#include "MRH_C_Path.hpp"
params ["_plane","_dropZone","_supply","_side",["_startDisToDrop",3000]];
[_plane,_dropZone,_supply,_side,_startDisToDrop,objNull,false] spawn MRH_fnc_MilsimTools_FireSupport_dropSupplies;
true