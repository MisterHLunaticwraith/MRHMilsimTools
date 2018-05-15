_percentage = publicPlayerKilled/publicAllPlayers*100;
if (serverCommandAvailable "#kick") then {
hint format ["%1 pourcents des joueurs sont morts.",_percentage];

if (_percentage >= AdminCasualtiesCap) then {call MRH_fnc_CoreFunctionACC;};


};