/*
Function name: MRH_fnc_MilsimTools_SoldierTab_attributePictures
Author: Mr H.
Description: "adds" given pictures (referenced by classnames) to player's data
Return value:none
Public:
Parameters:
0 - <OBJECT> receiver (player) 
1 - <ARRAY> of pictures classnames 
Example(s):
[player,["pic1","pic2"]]call MRH_fnc_MilsimTools_SoldierTab_attributePictures;
*/
#include "MRH_C_Path.hpp"
params ["_receiver","_picturesArray",["_sender",objNull]];
_playerPics = _receiver getVariable ["MRH_SoldierTab_ownedPics",[]];
{
_playerPics pushBackUnique _x;
}forEach _picturesArray;
_receiver SVAR(ownedPics,_playerPics,true);
if (isPlayer _receiver) then 
{
 _playerUid = getPlayerUID _receiver;
		[_playerUid,
	{
		["MRH_Data_Received",[localize "STR_MRH_ST_FC_PictureNotif"]] call BIS_fnc_showNotification;

	},[]] call MRH_fnc_MilsimTools_Core_RemoteFor;
	["MRH_Player_ReceivedPictures",[_receiver,_picturesArray,_sender],_receiver] call CBA_fnc_targetEvent;
};
if (_receiver isKindOf "MRH_HQ_Module_Base") then 
{
	["MRH_SideHQ_ReceivedPictures",[_receiver,_picturesArray,_sender],_receiver] call CBA_fnc_targetEvent;
};