/*
Function name: MRH_fnc_SelectType
Author: Mr H.
Description: gets the selected value from player  and refreshes the list//I know now there are better ways to do this, might change it in the future
Return value: None
Public:No
Parameters: None
Example(s):
call MRH_fnc_Spawner_SelectType;
*/

params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2100);
_MRHvalue = _ctrlcombo lbData _selected;
player setVariable ["MRH_SpawnerUSERSELECTEDVEHICLETYPE", _MRHvalue];
call MRH_fnc_Spawner_FilterAll;
call MRH_fnc_Spawner_RefreshMainList;