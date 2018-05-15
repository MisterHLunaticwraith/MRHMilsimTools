
if (serverCommandAvailable "#kick") then {

_briefing = "
<br/>Ce menu n'est visible que par l'administrateur.<br/>
<font size='18'>OUVRIR LE MENU DE GESTION DES PERTES</font><br/>
|- <execute expression="" 
call MRH_fnc_CoreFunctionACC;
hintsilent 'Menu ouvert';"">
Cliquer ici pour ouvrir le menu admin de gestion des pertes.</execute><br/>
";
player createDiarySubject ["MRHACC","MRH Milsim Tools ADMIN"];
player createDiaryRecord ["MRHACC", ["Menu de gestion des pertes",_briefing]];

};