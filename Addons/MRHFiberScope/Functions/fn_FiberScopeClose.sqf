_display = uiNamespace getVariable "MRHFiberscope";
_display closedisplay 2;
_cam = player getVariable "MRH_FiberScopeCam";
camDestroy _cam;
player cameraEffect ["terminate","back"];
player switchMove "";