switch (RosterStyle) do {
case 0: {_handle=createdialog "MRHRosterTablet";};
case 1: {_handle=createdialog "MRHRoster";};

};


[2,true,true] call MRH_fnc_RosterCore;
call MRH_fnc_RosterPIP;

call MRH_fnc_RosterID;

call MRH_fnc_RosterOrbatNotes;












