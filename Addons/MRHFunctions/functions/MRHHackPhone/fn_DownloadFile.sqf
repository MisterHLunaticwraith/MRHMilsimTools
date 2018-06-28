/*
Function name:MRH_fnc_DownloadFile;
Author: Mr H.
Description: This function allows you to turn any object into a file source for download
Return value: None
Public: Yes
Parameters:
0-<NUMBER> size of the file in Mo as an actual effect on how long the download will take
1- <OBJECT> - object to add the action to
2 - <STRING> - "FileName" when the download is complete a public variable (value = true) will be created. Can be anything but must be a single word and must not contain spaces
3- <CODE> -Optional - Code to execute upon completion of the download, canSuspend = true, must be stated between {}, source object (parameter 1) is passed to the code and can be retrieved.
Example(s):
[10,this,"testfile"] call MRH_fnc_DownloadFile;
or
[20,this,"file1",{player setDamage 0,5; hint 'You received a small electrical shock'}] call MRH_fnc_DownloadFile; //will hurt the player after download is completed
or 
[5,this,"someFileName",{deleteVehicle (_this select 0)}] call MRH_fnc_DownloadFile; // will delete the object used as a source upon completion
or
[30,this,"whateverYouWant",{[player,["dataEntry1","dataEntry2"]]call MRH_fnc_MilsimTools_SoldierTab_attributeData;}] call MRH_fnc_DownloadFile; //will add data to the player's pda.
*/
#include "MRH_C_Path.hpp"
params ["_FileSize", "_SourceObject", "_FileName",["_code",{}]];

_SourceObject SVAR(progressdone,0,false);
_sourceobject SVAR(speedyinterrupt,0,false);
_SourceObject SVAR(FileSize,_FileSize,false);
_SourceObject SVAR(FileName, _FileName,false);
_SourceObject SVAR(CodeToRun,_code,false);
[_SourceObject] FUNC(DownLoadAddAceAction);
