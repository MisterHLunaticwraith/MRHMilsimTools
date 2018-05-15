params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2101);
_MRHvalue = _ctrlcombo lbData _selected;
_array = [];
_array pushBack _MRHvalue;

player setVariable ["userSelectedDLC", _array];
call MRH_fnc_RefreshMainList;
call MRH_fnc_FillFactionCombo;

