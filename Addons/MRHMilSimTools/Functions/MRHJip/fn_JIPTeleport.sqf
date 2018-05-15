//teleport = [] execVM "MRHJipMenu\teleport.sqf";

_selectedplayer = _this select 0;

if (isnil "_selectedplayer") then {hint "Pas de joueur selectionné";} else {


closedialog 0;
[_selectedplayer] execVM "\MRHMilSimTools\Scripts\scr_teleportcams.sqf";


player setVariable ["hasDied", false, true];


};