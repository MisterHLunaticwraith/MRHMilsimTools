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
#include "MRH_C_Path.hpp"
params ["_gogglesClass"];

_playRebreather = ["MRH_MilsimTools_HaloGear_playRebreatherSounds"] call cba_settings_fnc_get;
_forcedplayItems = ["MRH_HaloMask","MRH_HaloMaskNoESS"];
if (!_playRebreather && !(goggles player in _forcedplayItems)) exitWith {_message = format ["MRH_MilsimTools_HaloGear Rebreather - playsounds deactivated for item class %1",_gogglesClass];TRACE(_message)};
_index = ["1","2","3","4","5","6","7"];
_isGoggles = false;
if (_gogglesClass == goggles player) then {_isGoggles = true};
if (!_isGoggles &&(_gogglesClass != headgear player)) exitWith {TRACE("MRH_MilsimTools_HaloGear - Object is neither facewear nor goggles nos sounds played")};
_conditionIsGoggles ={((goggles player) == _gogglesClass)};
_conditionIsHeadGear = {((headGear player) == _gogglesClass)};

_condition = _conditionIsHeadGear;
if (_isGoggles) then {_condition = _conditionIsGoggles};

[_condition,_gogglesClass,_index] spawn 
{
	params ["_condition","_gogglesClass","_index"];
	while  _condition do {_soundIndex = selectRandom _index;_soundName = "MRH_BreathingMuffled_" + _soundIndex; playsound _soundName; uisleep random [6,8,10];};
};
