/*
Function name:MRH_fnc_Elevator
Author: Mr H.
Description: Adds ace 3 action to an object to serve as an elevator button, after a video cutscene the player is teleported to the location of the second object.
Return value: None
Public: Yes
Parameters:
0- <OBJECT> - Object that will serve as an access point / elevator switch.
1 - <OBJECT> - Object that will serve as an arrival point, use an invisible helipad or some floor garbage for example. Can be placed in a building and on upper floors.
Example(s):
[elevatorButton1,destinationObject] call MRH_fnc_Elevator;
*/
#include "MRH_C_Path.hpp"
params ["_object","_PointA"];

_object SVAR(passdestination,_PointA,false);

_statement = {
_object = _this select 0;
[_object] FUNC(ElevatorCore);

};

_action =
["lift", 
(localize "STR_MRH_EL_CallElev"),
 "\MRHFunctions\img\icons\lift.paa", 
 
_statement 


, 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 