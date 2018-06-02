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
//add configfile punishments
_cfg = configfile;
_allPunishments = [(_cfg >> "cfgMRHPunishments")]call BIS_fnc_getCfgSubClasses;

{
_text = gettext (_cfg >> "cfgMRHPunishments">>_x>>"displayname");
_pic = gettext (_cfg >> "cfgMRHPunishments">>_x>>"picture");
_value = _x;
_index = _punishmentCombo lbadd _text;
lbSetData [2102, _index, _value];
//lbSetPictureColor [2102, _index, [0,0,0,1]];
lbSetPicture [2102, _index, _pic];
} forEach _allPunishments;

// add missionconfigfile punishments
//add configfile punishments
_cfgM = missionconfigfile;
_allPunishmentsMission = [(_cfgM >> "cfgMRHPunishments")]call BIS_fnc_getCfgSubClasses;
if !(_allPunishmentsMission isEqualTo [])then {
	{
	_text2 = gettext (_cfgM >> "cfgMRHPunishments">>_x>>"displayname");
	_pic2 = gettext (_cfgM >> "cfgMRHPunishments">>_x>>"picture");
	_value2 = _x;
	_index2 = _punishmentCombo lbadd _text2;
	lbSetData [2102, _index2, _value2];
	//lbSetPictureColor [2102, _index, [0,0,0,1]];
	lbSetPicture [2102, _index2, _pic2];
	} forEach _allPunishmentsMission;
};
_punishmentCombo lbSetCurSel 0;