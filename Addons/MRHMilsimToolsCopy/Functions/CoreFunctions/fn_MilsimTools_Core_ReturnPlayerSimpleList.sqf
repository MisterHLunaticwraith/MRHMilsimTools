/*
Function name: MRH_fnc_MilsimTools_Core_ReturnPlayerSimpleList
Author: Mr H.
Description: Returns a list of players in standard arma fashion, (only player objects) for lists stored in the registry
Return value: <ARRAY> of player objects, empty array if 
Public: Yes
Parameters:
0- "STRING" Registry to watch can be "ALIVE" or "DEAD"
Example(s):
_allDeadPlayers = ["DEAD"] call MRH_fnc_MilsimTools_Core_ReturnPlayerSimpleList;
or
_allAlivePlayers = ["ALIVE"] call MRH_fnc_MilsimTools_Core_ReturnPlayerSimpleList;
*/

#include "MRH_C_Path.hpp"
params ["_selectType"];
_message = format ["MRH_fnc_MilsimTools_Core_ReturnPlayerSimpleList - Error parameter %1 is not a string or incorect string , parameter can be either 'ALIVE' or 'DEAD'", str _selectType];

if (typeName _selectType != "STRING") ExitWith 
	{

	systemChat _message;
	Diag_Log _message;
	[]
	};

if ((_selectType != "ALIVE") && (_selectType != "DEAD")) ExitWith 
	{

	systemChat _message;
	Diag_Log _message;
	[]
	};

_return = [];
_toConvert = [];

switch (true) do 
{
	case (_selectType == "ALIVE"):
		{
		_allAliveArray = PLAYERREGISTRY_ALIVE;
			{
			_toConvert pushBackUnique (_x select 0);
			} forEach _allAliveArray;
		};
	case (_selectType == "DEAD"):
		{
	    _allDeadArray = PLAYERREGISTRY_CURDEAD;
			{
			_toConvert pushBackUnique (_x select 0);
			} forEach _allDeadArray;
		};
};

{
	private ["_player"];
	_player = [_x] FUNC(FindPlayerByUID);
	_return pushBackUnique [_player];

} forEach _toConvert;
_return