///===video du haut vers interieur du joueur
_pos1= player modelToWorld [0,-50, 50];
_pos2= player modelToWorld [0.3,0.3, 1.6];
_introcam = "camera" camCreate  _pos1;
_playercam = "camera" camCreate _pos2;


///////////cam1/cam2/ cible /dur/foc1/foc2/attach/ x/y/ z /effet   /trans/durtrans
prise1 = [_introcam, _playercam, _playercam,5, 1, 1 ,false, 0, 0, 0,"blur","blur",4] call MRH_fn_JIPTeleportCam;
waitUntil {scriptDone prise1}; 


////======destruction de la camera ne pas editer 
_cam = "camera" camCreate (position player);
camDestroy _cam;
player cameraEffect ["terminate","back"];

camDestroy _introcam;
camDestroy _playercam;