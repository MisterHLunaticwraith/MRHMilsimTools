/*
Function name: MRH_fnc_MilsimTools_Core_SetCtrlSize
Author: Mr H.
Description: Resizes given control's height according to the size of the text it contains
Return value: none
Public: no
Parameters:
0 - <NUMBER> displayIDC
1- <NUMBER> controlIDC 
Example(s):
[260518,1105] call MRH_fnc_MilsimTools_Core_SetCtrlSize;
*/
params ["_displayIDC","_ctrlIDC"];
_control =((findDisplay _displayIDC) displayCtrl _ctrlIDC);
_myControlPos = ctrlPosition _control;
_ctrlh = ctrlTextHeight _control;
_xpos = _myControlPos select 0;
_ypos = _myControlPos select 1;
_width = _myControlPos select 2;
_control ctrlSetPosition [_xpos,_ypos  ,_width ,_ctrlh];
_control ctrlCommit 0;