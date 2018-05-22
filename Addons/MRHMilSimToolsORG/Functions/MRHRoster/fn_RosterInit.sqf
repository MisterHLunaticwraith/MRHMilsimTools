
///////////===Recupére la description du rôle et l'assigne à chaque joueur====
call MRH_fnc_RosterRoleAssign;
//////////////////////////////////////Crée une entrée info dans le briefing

player createDiarySubject ["roster","Team Roster"];
player createDiaryRecord ["roster",["Roster ingame","Pour accéder au roster à n'importe quel moment faites CTRL +ALT + H
<br/><br/>
<img image='\MRHMilSimTools\media\img\preview.jpg' width='300' height='169'/>
<br/><br/>
<font size = '9'><font color = '#ff0000'>
Script par Mr H. <br/>
Ce script utilise des parties du code du script de roster de Skippy.<br/>
Ce script utilise des parties du code du script ORBAT Notes du framework F3<br/>
Vous avez le droit de modifier editer et distribuer ce script à condition de citer sa source.<br/>
© Mr H. 2017 </font>
"]];

/*
///////////////=====Détection de touche necessite CBA3
["MRHRosterKeybind", 
    "MRHRosterKey", 
    { call MRH_fnc_RosterScript; }, 
    [35, [false, true, true]] 
] call cba_fnc_registerKeybind;
//35=h
//19=r
*/
