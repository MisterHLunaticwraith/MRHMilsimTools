/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: returns a random position around provided position
Return value: position array [x,y,z (unchanged)] 
Public: No
Parameters:
0- <ARRAY> -Orginal position in position 3d
1 - <ARRAY> -Scattering factor -Optional (default [5,10,20]);
	where 0 --> min average distance
	      1 --> average distance
		  2 --> max average distance

Example(s):

_pos = [position player]call MRH_fnc_MilsimTools_Core_scatterPosition;// will return a position somexhere around player with a max radius of 20 m and a min radius of 5
or

_pos = [position player,[2,5,10]]call MRH_fnc_MilsimTools_Core_scatterPosition;// will return a position somexhere around player with a max radius of 10m and a min radius of 2
// to test the effects

for "_i" from 1 to 70 do
{
	"RoadCone_F" createVehicle ([position player,[2,5,10]]call MRH_fnc_MilsimTools_Core_scatterPosition);
};
*/
#include "MRH_C_Path.hpp"
params ["_orgPos",["_scatterRatio",[5,10,20]]];
_distance = random _scatterRatio;
_t = random [0,500,1000];
_x = (_orgPos select 0)+ _distance*(cos _t);
_y = (_orgPos select 1) + _distance*(sin _t);
_return = [_x,_y,(_orgPos select 2)];
_return