/*
Function name: MRH_fnc_MilsimTools_SoldierTab_attributeData
Author: Mr H.
Description: "adds" given data (referenced by classnames) to player's data
Return value:none
Public:
Parameters:
0 - <OBJECT> receiver (player) 
1 - <ARRAY> of data classnames 
Example(s):
[player,["dataEntry1","dataEntry2"]]call MRH_fnc_MilsimTools_SoldierTab_attributeData;
*/
#include "MRH_C_Path.hpp"
params ["_receiver","_DataToAdd"];
_playerData = _receiver getVariable ["MRH_SoldierTab_ownedData",[]];
{
_playerData pushBackUnique _x;
}forEach _DataToAdd;
_receiver SVAR(ownedData,_playerData,true);

if (isPlayer _receiver) then 
{
 _playerUid = getPlayerUID _receiver;
		[_playerUid,
	{
		["MRH_Data_Received",[localize "STR_MRH_ST_FC_DataNotif"]] call BIS_fnc_showNotification;

	},[]] call MRH_fnc_MilsimTools_Core_RemoteFor;
};
