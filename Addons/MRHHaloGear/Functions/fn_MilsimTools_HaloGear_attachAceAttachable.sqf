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
if !((objectParent player) isKindOf "ParachuteBase") exitWith {};
_attached = ((player getVariable ["ace_attach_attached",[[objNull,""]]]) select 0) select 1;
if (_attached == "") exitWith {};
_toAttach = getText (configfile >> "CfgWeapons" >> _attached >> "ACE_attachable");
if (_toAttach == "") then {_toAttach = _attached};

_IRG = _toAttach createVehicle (position vehicle player); 
_IRG attachto [vehicle player, [-0.2,0,0.6]];

[
    {isNull (objectParent player)}, 
    {params ["_attachment"]; deleteVehicle _attachment}, 
    [_IRG]
] call CBA_fnc_waitUntilAndExecute;