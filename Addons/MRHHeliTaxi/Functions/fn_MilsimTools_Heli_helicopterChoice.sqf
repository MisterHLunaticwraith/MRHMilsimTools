 disableSerialization;
createDialog "MRHHeliChoice";

 


_settingsEntry = [player,"MRH_MilsimTools_BluForHelis","MRH_MilsimTools_BluForOpFor","MRH_MilsimTools_BluForInde","MRH_MilsimTools_BluForCivs"]call MRH_fnc_MilsimTools_Core_resultForSide;
_allHelis =[_settingsEntry] call MRH_fnc_MilsimTools_Heli_returnHeliListFromSettings;
_ctrlBox = ((findDisplay 160718) displayCtrl 2100);
{
_prettyName = gettext (configfile >> "CfgVehicles" >> _x >> "displayName");
_index = _ctrlBox lbAdd _prettyName;
_ctrlBox lbSetData [_index,_x];
//lbSetData [2100,_index,_x];

}forEach _allHelis;



_ctrlBox lbSetCurSel 0;

_ctrlButton = ((findDisplay 160718) displayCtrl 1600);

_ctrlButton buttonSetAction "
	_heli = lbdata [2100,(lbCurSel 2100)];
	
	player setVariable ['MRH_HeliTaxi_UserSelectedHeli',_heli];
	call MRH_fnc_MilsimTools_Heli_HeliTaxiCall; 
	closedialog 0;
	";
	
/*
//id/type/pos/texte

_playerlist = _display ctrlCreate ["RscListbox", 1500];

_playerlist ctrlSetPosition [-0.3,0.02,0.48793,0.744756];

_playerlist ctrlCommit 0.26;

_playerlist ctrlSetFontHeight 0.028;

_playerlist ctrlsetFont "PuristaLight";

_playerlist ctrlSetTextColor [1,1,1,1]; 
*/