/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
//script left to rune in schedule env for now
#include "MRH_C_Path.hpp"
_this spawn {
params [["_coef",1,[1]]];
if (_coef <0.1) exitWith {player setDamage 1};
_hypoHeight = ["MRH_MilsimTools_HaloGear_hypoxiaAltitude"] call cba_settings_fnc_get;	
#define EXITIF if (FUNC(hasProtectiveGear) || (((getPosASL player) select 2)< _hypoHeight)) exitWith {player setVariable ["MRH_hypoxia_StoppedSuffocating",true];}
EXITIF;
player setVariable ["MRH_hypoxia_StoppedSuffocating",false];

0 = ["RadialBlur", 1001, [0.5,0.5, 0.5, 0.5],_coef] spawn 
{ 
 params ["_name", "_priority", "_effect", "_coef"]; 
  _handle = ppEffectCreate [_name, _priority];  
 _handle ppEffectEnable true; 
 _handle ppEffectForceInNVG true;
 _handle ppEffectAdjust _effect; 
 _handle ppEffectCommit (50*_coef); 
 waitUntil {player getVariable ["MRH_hypoxia_StoppedSuffocating",false]}; 
 _handle ppEffectEnable false; 
 ppEffectDestroy _handle; 
};

0 = ["DynamicBlur", 100, [0.5],_coef] spawn
{
	params ["_name", "_priority", "_effect", "_coef"];

		_handle = ppEffectCreate [_name, _priority];
	_handle ppEffectEnable true;
    _handle ppEffectForceInNVG true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit (50* _coef);
waitUntil {player getVariable ["MRH_hypoxia_StoppedSuffocating",false]}; 
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};

0 = ["ColorCorrections", 1500, [0, 0.4, 0, [0, 0, 0, 0], [1, 1, 1, 0], [1, 1, 1, 0]],_coef] spawn
{
	params ["_name", "_priority", "_effect", "_coef"];
	_handle = ppEffectCreate [_name, _priority];
	_handle ppEffectEnable true;
    _handle ppEffectForceInNVG true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit (50* _coef);

waitUntil {player getVariable ["MRH_hypoxia_StoppedSuffocating",false]}; 
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};
enableCamShake true;

EXITIF;
addCamShake [1, 2, 1];
playSound "MRH_Suffocating_1";
sleep (10 *_coef);
 
EXITIF;
[player, "body", 0.1, objNull, "unknown" , 0.1, objNull] call ace_medical_fnc_handleDamage;
addCamShake [3, 4, 3];
playSound "MRH_Suffocating_2";
sleep (15* _coef);
EXITIF;
[player, "body", 0.1, objNull, "unknown" , 0.1, objNull] call ace_medical_fnc_handleDamage;
addCamShake [5, 10, 3];
playSound "MRH_Suffocating_3";
sleep (10*_coef);
EXITIF;
[player, "body", 0.1, objNull, "unknown" , 0.1, objNull] call ace_medical_fnc_handleDamage;
addCamShake [2, 5, 3];
playSound "MRH_Suffocating_4";
sleep (10*_coef);
EXITIF;
[player, "body", 0.1, objNull, "unknown" , 0.1, objNull] call ace_medical_fnc_handleDamage;
addCamShake [5, 5, 5];
playSound "MRH_Suffocating_5";
sleep (5*_coef);
EXITIF;
[player, "body", 0.1, objNull, "unknown" , 0.1, objNull] call ace_medical_fnc_handleDamage;

player setVariable ["MRH_hypoxia_StoppedSuffocating",true];

[player,true,(70*_coef),false] call ace_medical_fnc_setUnconscious;
sleep (70*_coef);
EXITIF;
_coef = _coef - 0.1;
[_coef] FUNC(hypoxiaEffects);
};