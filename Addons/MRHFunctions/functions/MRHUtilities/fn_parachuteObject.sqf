/*
Function name:MRH_fnc_parachuteObject
Author: Mr H.
Description:
Parachutes an object (either present in the mission or created by the script) on given position.
Return value: true
Public: Yes
Parameters:
0-<OBJECT> present in the mission or <STRING> classname of the object to parachute. If object is provided mission object will be parachuted, if class name is provided object of the given classname will be createDialog
1 - <ARRAY> position AGLS, don't forget to put height (z in [x,y,z]), if a height below a 100m is provided the function will change it to a default 300m
2- <BOOLEAN> Optional. Attach a green smoke grenade to the object (when it is below a 100m), default, true.
3 -<BOOLEAN> Optional. Attach an IR grenade to the object (when it is below a 100m), default, true.
Example(s):
[myCrate,position player] call MRH_fnc_parachuteObject;
or 
["B_supplyCrate_F",player modelToWorld [0,100,400],true,false] call MRH_fnc_parachuteObject;
*/
params ["_classname","_dropPos",["_attachSmoke",true],["_attachIR",true]];

_correctedDroPos = [];
if ((_dropPos select 2)< 100) then {_correctedDroPos = [(_dropPos select 0), (_dropPos select 1),300];} else {_correctedDroPos = _dropPos;};

[_classname,_correctedDroPos,_attachSmoke,_attachIR] spawn MRH_fnc_MilsimTools_FireSupport_parachuteObject;
true