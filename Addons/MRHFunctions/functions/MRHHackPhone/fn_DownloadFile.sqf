/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[10,this,"testfile"] call MRH_fnc_DownloadFile;
*/
#include "MRH_C_Path.hpp"
params ["_FileSize", "_SourceObject", "_FileName"];
_SourceObject SVAR(progressdone,0,false);
_sourceobject SVAR(speedyinterrupt,0,false);
_SourceObject SVAR(FileSize,_FileSize,false);
_SourceObject SVAR(FileName, _FileName,false);
[_SourceObject] FUNC(DownLoadAddAceAction);
