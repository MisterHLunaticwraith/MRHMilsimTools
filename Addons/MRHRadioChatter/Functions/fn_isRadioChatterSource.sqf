/*
Function name:MRH_fnc_isRadioChatterSource
Author: Mr H.
Description: Turns an object into a radio chatter source, it plays random radio chatter sounds and can be turned on and off with ace 3 interaction.
Return value:None
Public:Yes
Parameters:
0-<OBJECT> - Object to turn into a radio object
1 -<STRING> - Radio station to play, by default the mod includes an US radio chatter station, but you can create your own: visit https://mrhmilsimtools-arma3-mod.wikia.com/wiki/Radio_chatter_framework for a more complete guide.
Example(s):
[this,"US"] call  MRH_fnc_isRadioChatterSource;
or 
[this,"YourRadioStationClassname"] call  MRH_fnc_isRadioChatterSource;
*/
#include "MRH_C_Path.hpp"
params ["_sourceObject","_faction"];
_sourceObject setVariable ["MRH_RadioChatter_Faction",_faction,true];
[_sourceObject, _faction] FUNC(RadioChatter);
[_sourceObject,"OFF"] FUNC(RadioAceAction);