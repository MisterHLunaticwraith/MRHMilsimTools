params ["_FileSize", "_SourceObject", "_FileName"];
_SourceObject setVariable ["progressdone", 0];
_sourceobject setVariable ["speedyinterrupt", 0];
_SourceObject setVariable ["FileSize", _FileSize];
_SourceObject setVariable ["FileName", _FileName];
[_SourceObject] execVM "\MRHFunctions\scripts\scr_DownLoadAddAceAction.sqf";
