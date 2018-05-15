
////////======initialise la variable hasdied pour le menu jip
player setVariable ["hasDied", false, true];

//=====initialise le JIP si le joueur spawne plus de deux minutes après le lancement
if (time >120) exitWith {call MRH_fnc_JIPCoreFunction;
};
