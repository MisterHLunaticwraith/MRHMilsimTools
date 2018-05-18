/*
Function name: MRH_fnc_UserSelectedDLC
Author: Mr H.
Description: filters the list according with the mod selected by the player
Return value: none
Public:no
Parameters:none
Example(s):
call MRH_fnc_Spawner_UserSelectedDLC;
*/

params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2101);
_MRHvalue = _ctrlcombo lbData _selected;
_array = [];
_array pushBack _MRHvalue;

player setVariable ["userSelectedDLC", _array];
call MRH_fnc_Spawner_RefreshMainList;
call MRH_fnc_Spawner_FillFactionCombo;

