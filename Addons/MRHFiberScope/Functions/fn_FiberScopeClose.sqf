/*
Function name: MRH_fnc_FiberScopeClose
Author: Mr H.
Description: Closes everything related to the fiberscope
Return value: None
Public:No
Parameters:None
Example(s):
call MRH_fnc_FiberScopeClose;
*/

_display = uiNamespace getVariable "MRHFiberscope";
_display closedisplay 2;
_cam = player getVariable "MRH_FiberScopeCam";
camDestroy _cam;
player cameraEffect ["terminate","back"];
player switchMove "";
player enableSimulation true;