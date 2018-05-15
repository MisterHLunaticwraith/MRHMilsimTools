#include "MRH_components.hpp"
_player = player GVAR(AdminSelectedPlayer);
[_player, _player] call ACE_medical_fnc_treatmentAdvanced_fullHeal;
systemchat format ["Le joueur %1 a été soigné.", name _player];