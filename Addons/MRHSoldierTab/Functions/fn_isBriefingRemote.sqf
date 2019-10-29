/*
Function name: MRH_fnc_isBriefingRemote
Author: Mr H.
Description: Turns given object into a briefing controls console, can control multiple screens.
Return value: none
Public: yes
Parameters: 
0-<OBJECT> Object that will be the remote controller and receive ACE3 actions.
1-<ARRAY>of <OBJECTS> Screens that will receive the image (if one of the screens is of type "MRH_projectionScreenSmall","MRH_projectionScreenLarge" there will be an extra action to add an overlay.)
Example(s):
[this,[this,satScreen]]call MRH_fnc_isBriefingRemote;
*/
#include "MRH_C_Path.hpp"
_this FUNC(briefingScreenControlsHub);