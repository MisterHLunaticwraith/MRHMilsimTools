params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2102);
_MRHvalue = _ctrlcombo lbData _selected;
_array = [];
_array pushBack _MRHvalue;

player setVariable ["userSelectedFaction", _array];
call MRH_fnc_RefreshMainList;
