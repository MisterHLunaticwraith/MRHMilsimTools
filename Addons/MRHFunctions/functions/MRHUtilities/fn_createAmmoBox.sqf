/*
Function name:MRH_fnc_createAmmoBox;
Author: Mr H.
Description:
will create an ammo box and fill it with magazines corresponding to the magazines currently used by the players of the given side. So content is dependant on what weapons they currently are equipped with (including side weapons and launchers). All parameters are optional
Return value: <OBJECT> - created box
Public: Yes
Parameters:
PLEASE NOTE: if calling on the server on a dedicated machine parameters 0,1 and 2 must be filled since the default values based on player object are not known by the server.
0 - <NUMBER> -optional, default 10: quantity added per magazine type
1- <SIDE> - optional default: side of the player on whose machine the function is called. Can be West / Blufor (Arma 3), East / Opfor (Arma 3), Resistance / Independent (Arma 3), Civilian, sideLogic, Friendly, Enemy or Unknown.
2 - <ARRAY> -optionnal, default: position of the player on whose machine the function is called. - position AGL
3 -<STRING> -optional, classname of a container object, default "B_supplyCrate_F". Object will be emptied of its default config contents first. Can be a vehicle
Example(s):
_box = call MRH_fnc_createAmmoBox;
or
_box = [20] call MRH_fnc_createAmmoBox;
or
_box = [150,West,player modelToWorld [0,10,0],"B_Truck_01_ammo_F"] call MRH_fnc_createAmmoBox;
*/
#include "MRH_C_Path.hpp"
params [["_Ammount",10],["_side",side player],["_position",position player],["_type","B_supplyCrate_F"]];
_box =[_Ammount,_side,_position,_type] EFUNC(FireSupport,createAmmoBox);
_box