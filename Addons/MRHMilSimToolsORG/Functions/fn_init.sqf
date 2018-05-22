#include "\a3\editor_f\Data\Scripts\dikCodes.h"
////définit les touches pour appeler le rosetr (assigne ctrl alt h par défaut)//marchepaspardefaut
["MRHRMilSimTools", //addon
 "MRHRosterKey",["Ouvrir le team roster", "Configure la touche du Roster"], //id et prettyname
 
{_this call MRH_fnc_RosterScript}, //downcode
{},//upcode 
[DIK_H, [false, true, true]]

//defaut
] call CBA_fnc_addKeybind;

//////ajoute l'option du choix des pertes
["AdminCasualtiesCap", "SLIDER",   ["Cap du nombre de pertes des joueurs",   "Définit le pourcentage de pertes seuil, l'admin reçoit un message si ce pourcentage est dépassé, dfaut 60"], "MRHRMilSimTools", [0, 100, 60, 0]] call cba_settings_fnc_init;

////optionchoixde l'apparence
["RosterStyle", "LIST",     ["Apparence du roster",     "Selectionner l'apparence du Roster"], "MRHRMilSimTools", [[1,0], ["Papier","Tablette"], 1]] call cba_settings_fnc_init;





























