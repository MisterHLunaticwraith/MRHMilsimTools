/*
MRH_fnc_relativeBearing
Author Mr & Mrs H. (she did the maths!)
this function displays the bearing unit1 has to turn to to face unit2

*/
params ["_pos1", "_pos2"];

_Yjoueur = _pos1 select 1;
_xjoueur = _pos1 select 0;
_Ycible = _pos2 select 1;
_xcible = _pos2 select 0;
_ab = _Ycible - _Yjoueur;
_ac = _pos1 distance2D _pos2;
_angle = acos (_ab/_ac);
_angle2 = 360 - _angle;
//_xjoueur = (getPos _unit1) select 0;
_anglefinal = 0;
if (_xjoueur > _xcible)then { _anglefinal = _angle2} else {_anglefinal = _angle};
_anglefinal = [_anglefinal,0] call BIS_fnc_cutDecimals;
//returned:
_anglefinal