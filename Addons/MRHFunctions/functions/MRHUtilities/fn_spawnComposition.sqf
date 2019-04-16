/*
Function name:MRH_fnc_spawnComposition
Author: Mr H.
Description: Searches for provided composition variable,or cfg entry string, in which case it searches in  both missionConfigFile and configFile for composition cfg. Then spawns the composition relatively in position and direction to pivot object, returns an <ARRAY> with all composition objects (store it somewhere to delete comp later).

If objects are ACE3 medical facility/repair facility or MRH special ammocrate or MRH satellite sat screen /sat control console they will retain these properties when spawned

/!\ function is higly ressource demanding and might cause a temporary lag depending on composition size.

Return value: <ARRAY> of composition <OBJECT>
Public: Yes

Parameters:
0-<OBJECT> - Existing pivot object relative to which composition will be spawned 
1 -<STRING> or <ARRAY> if <ARRAY> ==> composition stored as an array in a variable or copied from clipboard as an array. If <STRING> composition in cfg file, will be searched in both description.ext or an addon.

Example(s):
_myCompObjects = [someObject,TAG_my_pretty_comp] call MRH_fnc_spawnComposition; //where TAG_my_pretty_comp is an <ARRAY> (or a variable pointing to one)

or

_myCompObjects = [someObject,"TAG_my_pretty_comp"] call MRH_fnc_spawnComposition; //where "TAG_my_pretty_comp" is  a classed defined in config
*/
#include "MRH_C_Path.hpp"
_this CFUNC(compGetAndSpawnComp);