/*
Function name:MRH_fnc_generateComposition
Author: Mr H.

Description: A mirror public version of core function, generates a composition in either sqf format or config format. The composition can either be stored in a sqf or in a config (addon or mission description.ext in class cfgMRHcompositions). It only grabs objects, not units or modules. ACE 3 medical/repair facility objects will retain their attributes when composition is spawned. MRH Satellite objects (satellite control console or satellite screen) will be spawned as such, so will MRH automatically generated ammo crates.

Return value: 
<ARRAY> composition in MRH comp format
<clip board export> in either sqf or cfg entry format (mrhComp[]=) to place in cfgMRHcompositions

Public: Yes

Parameters:
0- <OBJECT> pivot point relative to which the composition will be stored. Pivot will not be included in the composition.

1-<NUMBER> -Optional. Distance around the pivot to grab object,-1 to grab with infinite distance, default -1.

2-<BOOL> - Optional. If true, clip board export will be in cfg format

Example(s):

_mycomp = [player] call MRH_fnc_generateComposition; // will grab all mission objects relative to player orientation and position and return them in sqf <ARRAY>, copied to clipboard.

_mycomp = [player,50] call MRH_fnc_generateComposition; // will grab all mission objects relative to player orientation and position, within 50 m from the player and return them in sqf <ARRAY>, copied to clipboard.
//----
	in both above examples composition can be stored in sqf file (preferably called from/stored in init.sqf)
	eg.
	TAG_my_pretty_comp = <ARRAY> that was copied to clipboard;
//---

_mycomp = [player,-1,true] call MRH_fnc_generateComposition;
// will grab all mission objects relative to player orientation and position and return them in sqf <ARRAY>, copied to clipboard in cfg format with cfg entry mrhComp[]= to use in cfg file.
eg:

class cfgMRHcompositions
{
	class TAG_my_pretty_comp
	{
		mrhComp[]= {composition in cfg format};//this line is copied to clipboard
	};
}; 

*/
#include "MRH_C_Path.hpp"
_this CFUNC(cmpCreateComp);