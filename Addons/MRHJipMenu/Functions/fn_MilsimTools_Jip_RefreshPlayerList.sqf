/*
Function name: MRH_fnc_MilsimTools_Jip_RefreshPlayerList
Author: Mr H.
Description: Refreshes the list of players in the selected group
Return value: None
Public: No
Parameters: None
Example(s):
call MRH_fnc_MilsimTools_Jip_RefreshPlayerList;
*/
#include "MRH_C_Path.hpp"




disableSerialization;
// defines the list
_ctrlLIST = ((findDisplay 210382) displayCtrl 1500);
lbClear _ctrlLIST;

// create necessary variables
_selectedGrpStrg = lbData [ 2100, (lbCurSel 2100)];
_selectedGrp = grpNull;

// convert string to group variables
{
	if (str _x == _selectedGrpStrg) then {_selectedGrp = _x};
} forEach allGroups;

//sorts units according to mod settings
_unitsSelectedGrp = units _selectedGrp;

_adminsettingIncAI = ["MRH_MilsimTools_Jip_MenuIncludeAI"] call cba_settings_fnc_get;
_unitsWithoutAIs = [];
if !(_adminsettingIncAI) then 
{
  {
  if (isPlayer _x) then {_unitsWithoutAIs pushBackUnique _x}; 
  } forEach _unitsSelectedGrp;
  _unitsSelectedGrp = _unitsWithoutAIs;
};


//fills the list 
{
	Private ["_Dead","_inVeh","_vehFull"];
	_Dead = _x getVariable ["MRH_MilsimTools_Core_HasDied",false];
	_inVeh = false;
	_vehFull = false;
	if (vehicle _x != _x) then {_inVeh = true;};
	if (_inveh) then 
	{
		_vehFull = ([vehicle _x] CFUNC(ReturnEmptyCargoSlots)) select 0;
	};
	
	_text = format ["%1, %2",((_x getVariable "MRH_MilsimTools_Core_PlayerIntel") select 1),name _x];   //_text2 = format ["%1", _x];
	_index = _ctrlLIST  lbAdd  _text;
	lbSetData [1500,_index,str _x];
	lbSetPictureColor [1500, _index, [0,0,0,0]];
	if (_Dead) then 
		{
		lbSetPicture [1500, _index, GUIPATH(dead.paa)];
		}
	else 
		{
		lbSetPicture [1500, _index, GUIPATH(alive.paa)];
		};
	lbSetData [1500, _index, str _x]; 
	
	if (_inveh) then 
	{
		if (_vehFull) then 
		{
			lbSetPictureRight [1500, _index, GUIPATH(invehiclered.paa)];
			
		}
		else
		{
			lbSetPictureRight [1500, _index, GUIPATH(invehiclewhite.paa)];
		};
 
 	
	};
	_isInStr = [ localize "STR_MRH_JIP_ISNTON",localize "STR_MRH_JIP_ISON"] select _inveh;
	_vehIsFullStr = [localize "STR_MRH_JIP_ROOMLEFT",localize "STR_MRH_JIP_VEHFULL"] select _vehFull;
	_vehIntelStr = [" ",_vehIsFullStr ] select _inveh;
	_isDeadStr = localize "STR_MRH_JIP_ISDEAD";
	_isInVehFinalStr = _isInStr +" " + _vehIntelStr;
	_finalStr = [_isInVehFinalStr,_isDeadStr] select _dead;
	_tooltip =  (localize "STR_MRH_JIP_PLAYERCAPITALIZED") + " "+ name _x +" "+ _finalStr;
	lbSetTooltip [1500, _index, _tooltip];

} forEach _unitsSelectedGrp;