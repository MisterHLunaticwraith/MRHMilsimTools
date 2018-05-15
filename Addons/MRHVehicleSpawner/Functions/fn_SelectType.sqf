
params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2100);
_MRHvalue = _ctrlcombo lbData _selected;
player setVariable ["MRH_SpawnerUSERSELECTEDVEHICLETYPE", _MRHvalue];
call MRH_fnc_FilterAll;
call MRH_fnc_RefreshMainList;