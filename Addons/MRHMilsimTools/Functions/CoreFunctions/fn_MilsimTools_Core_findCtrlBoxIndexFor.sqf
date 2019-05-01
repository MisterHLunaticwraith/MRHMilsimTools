/*
Function name:MRH_fnc_MilsimTools_Core_findCtrlBoxIndexFor
Author: Mr H.
Description: Returns RscListBox or RscCombo index number for provided data
Return value: <NUMBER> index of the provided data in the provided control (combo or listbox)
Public: No
Parameters:
0- <CONTROL> control lisbox or combo to look in
1- <STRING> data to searchfor
Example(s):
[(findDisplay 1234 (displayCtrl 100)),"My_Data"]call MRH_fnc_MilsimTools_Core_findCtrlBoxIndexFor; //returns index of my data
*/
#include "MRH_C_Path.hpp"
params["_ctrl","_data"];
disableSerialization;


_index = 0;
for '_i' from 0 to ((lbSize _ctrl)-1) do {
if ((_ctrl lbdata _i) == _data ) then {_index = _i};
};
_index
