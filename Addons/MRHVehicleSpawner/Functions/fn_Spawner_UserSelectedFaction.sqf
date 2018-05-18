/*
Function name: MRH_fnc_UserSelectedFaction
Author: Mr H.
Description: Filters the list according to the dlc selected by the player
Return value: none
Public: no
Parameters:none
Example(s):
call MRH_fnc_UserSelectedFaction;
*/

params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2102);
_MRHvalue = _ctrlcombo lbData _selected;
_array = [];
_array pushBack _MRHvalue;

player setVariable ["userSelectedFaction", _array];
call MRH_fnc_Spawner_RefreshMainList;
