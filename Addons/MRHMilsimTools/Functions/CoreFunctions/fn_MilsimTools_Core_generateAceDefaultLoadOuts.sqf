/*
Function name:MRH_fnc_MilsimTools_Core_generateAceDefaultLoadOuts
Author: Mr H.
Description: Generates a ready to paste file to run from mission or addon's init that will set Ace default loadouts for the ace arsenal tab.
HOW TO: create your loadouts on different units placed in the editor, give each unit a variable name that corresponds to the loadout (it will be the loadout name). When you're done, run the function. Paste the results to your mission's init.sqf (or any other sqf filled executed from init.sqf).

The result file also contains a list of the objetcs to allow for the arsenal box if you want a limited arsenal as well as a how to. (see comments at the bottom of the generated file)

Alternatively for sexier loadout names you can set them in the roledescription field of the unit and call the function with true as a parameter (but it will only grab playable units)
Return value: file to paste from clipboard
Public: Yes
Parameters:
0- <BOOL> (optional) to use roledescription instead of variable name
Example(s):
call MRH_fnc_MilsimTools_Core_generateAceDefaultLoadOuts; //will use allunits and variable names
or
true call MRH_fnc_MilsimTools_Core_generateAceDefaultLoadOuts; // will grab only playable units and use role descriptions
*/
#include "MRH_C_Path.hpp"
params [["_useRoleDescription",false]];
_allUnits = allUnits;
if (_useRoleDescription) then {_allUnits = playableUnits};

_allLoadOuts =["[",endl,endl];
_arsenalItemsArray = [];

//---generates the objects for the arsenalVariable (Borrowed from ace 3 doc)
private _items = _allUnits apply {getUnitLoadout _x};
_items = str _items splitString "[]," joinString ",";
_items = parseSimpleArray ("[" + _items + "]");
_items = _items arrayIntersect _items select {_x isEqualType "" && {_x != ""}};

_getName = { 
	params ["_unit","_useRoleDescription"];
	_roleDescription = roleDescription _unit;
	if ((roleDescription _unit) isEqualTo "") then {_roleDescription = getText(configFile >> "CfgVehicles" >> typeOf(_unit) >> "displayName")};
	[str _unit,_roleDescription] select _useRoleDescription
	};

{
	private _name = [_x,_useRoleDescription] call _getName;
	private _toString =[endl,endl,"//-----",_name,"-----//",endl,"[","""",_name,"""",",",getUnitLoadOut _x,"]"];
	_toString append ([[",",endl,endl],[endl,endl]] select (_forEachIndex isEqualTo ((count _allUnits)-1)));
	_allLoadOuts append _toSTring; 
}forEach _allunits;
_allLoadOuts pushBackUnique "];";

_info1 = "/*";
_info2 = "//-----NOTE-------//";
_info3 = "If you want to create an arsenal that contains only items from the above loadouts paste the following code in its init:";
_info4 ="this spawn {waitUntil{!isNil 'ACE_ArsenalAllowedItems'};[_this,ACE_ArsenalAllowedItems,true] call ace_arsenal_fnc_initBox};";
_info5 ="*/";
_script = ["//-----------Load Outs-----------//",endl,endl,"_allLoadOuts = "];
_footer = [endl,endl,"//----------LoadOuts End----------//",endl,endl,"//-------add loadouts to ace default------",endl,"{[_x select 0,_x select 1] call ace_arsenal_fnc_addDefaultLoadout}forEach _allLoadOuts;",endl,endl,"ACE_ArsenalAllowedItems =",_items,";",endl,endl,_info1,endl,_info2,endl,_info3,endl,_info4,endl,_info5];

_script append _allLoadOuts;
_script append _footer;
copyToClipboard (_script joinstring "");
hint "export complete, paste results to file";