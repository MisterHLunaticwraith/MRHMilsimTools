/*
Function name: MRH_fnc_MilsimTools_Admin_FillPunishmentsCombo
Author: Mr H.
Description: fills punishments combo
Return value: none
Public: no
Parameters:none
Example(s):
call MRH_fnc_MilsimTools_Admin_FillPunishmentsCombo;
*/
#include "MRH_C_Path.hpp"

_punishmentCombo = FDIS(2102);
lbclear 2102;

_cfg = configfile;
_allPunishments = [(_cfg >> "cfgMRHPunishments")]call BIS_fnc_getCfgSubClasses;
systemChat str _allPunishments;
{
_text = gettext (_cfg >> "cfgMRHPunishments">>_x>>"displayname");
_pic = gettext (_cfg >> "cfgMRHPunishments">>_x>>"picture");
_value = _x;
_index = _punishmentCombo lbadd _text;
lbSetData [2102, _index, _value];
//lbSetPictureColor [2102, _index, [0,0,0,1]];
lbSetPicture [2102, _index, _pic];
} forEach _allPunishments;


_punishmentCombo lbSetCurSel 0;