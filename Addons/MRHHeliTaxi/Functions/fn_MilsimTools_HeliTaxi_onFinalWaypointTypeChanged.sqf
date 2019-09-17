/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_onFinalWaypointTypeChanged;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_onFinalWaypointTypeChanged;
*/
#include "MRH_C_Path.hpp"
#include "dialogRefsSetCourse.hpp"
#include "waypointTypesDesc.hpp"

params ["_ctrl","_index"];
_data = _ctrl lbData _index;

_picture = "";
_text = "";
switch (true) do {
	case (_data == "MRH_heli") :{_picture = "\MRHHeliTaxi\Paa\heli_large.paa"; _text = _dropTroups;};
	case (_data == "MRH_wait") :{_picture = "\MRHHeliTaxi\Paa\wait_large.paa"; _text = _landAndWait;};
	case (_data == "MRH_loiter") :{_picture = "\MRHHeliTaxi\Paa\loiter_large.paa"; _text = _loiter;};
	case (_data == "MRH_rope") :{_picture = "\MRHHeliTaxi\Paa\fastrope_large.paa"; _text = _fastrope;};
	case (_data == "MRH_pause") :{_picture = "\MRHHeliTaxi\Paa\pause_large.paa"; _text = _hover;};
};
_wpTypePic ctrlSetText _picture;
_wpDescText ctrlSetStructuredText parseText _text;