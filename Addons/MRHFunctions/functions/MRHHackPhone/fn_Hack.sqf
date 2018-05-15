params ["_HackTime", "_SourceObject", "_HackName"];
_SourceObject setVariable ["progressdone", 0];
_sourceobject setVariable ["speedyinterrupt", 0];//avoir si on garde
_SourceObject setVariable ["HackTime", _HackTime];
_SourceObject setVariable ["HackName", _HackName];
[_SourceObject] execVM "\MRHFunctions\scripts\scr_HackAddAceAction.sqf";
