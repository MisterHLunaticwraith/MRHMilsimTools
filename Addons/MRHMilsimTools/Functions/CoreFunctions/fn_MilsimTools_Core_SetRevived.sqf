/*
Function name: MRH_fnc_MilsimTools_Core_SetRevived
Author: Mr H.
Description: Resets given player's "hasDied" variable and pings the server for table update
Return value: <BOOLEAN> - true when done
Public: Yes
Parameters:
0 - <OBJECT> Targeted player
Example(s):
[player] call MRH_fnc_MilsimTools_Core_SetRevived;
*/

params ["_target"];
//sets the hasdied variable
_target setVariable ["MRH_MilsimTools_Core_HasDied", false, true];
	
//Tells the server a player has died
MRH_MilsimTools_Core_PlayerRevived = true;
publicVariableServer "MRH_MilsimTools_Core_PlayerRevived";
true