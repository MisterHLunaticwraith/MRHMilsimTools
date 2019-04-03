/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"
params [["_type","Warning"]];



switch (_type) do {

case "Warning" : {      
					if (goggles player == "MRH_HaloMask") then {
						[] spawn {
							_AADTriggerAltitude = parseNumber(player getVariable ["MRH_HaloGear_AADOpening_alt",(["MRH_MilsimTools_HaloGear_AADDefaultOpeningAltitude"] call cba_settings_fnc_get)]);
						_display = uiNamespace getVariable 'ACE_Goggles_Display';
						_ctrl = _display ctrlCreate ["RscStructuredText", -1]; 
						_ctrl ctrlSetPosition [0.298906 * safezoneW + safezoneX,0.269 * safezoneH + safezoneY,0.397031 * safezoneW,0.066 * safezoneH]; 
						_ctrl ctrlCommit 0; 
						_ctrl ctrlSetStructuredText parsetext ("<t color='#ff0000'><t size='1.5'><t font='LucidaConsoleB'><t align='center'>"+ (localize "STR_MRH_MRHHaloGear_WarningAAD") + "</t>");
						//_ctrl ctrlSetStructuredText parsetext "<t color='#ff0000'><t size='1.5'><t font='LucidaConsoleB'><t align='center'>Warning self opening will trigger</t>";
						while {(((getPosASL player) select 2)> _AADTriggerAltitude)} do {_ctrl ctrlSetFade 0; _ctrl ctrlCommit 0.1;sleep 0.1; _ctrl ctrlSetFade 1; _ctrl ctrlCommit 0.1; sleep 0.1};
						ctrlDelete _ctrl
						};
					
					};
				[] spawn {for "_i" from 0 to 3 do {playSound "MRH_fiveBeeps";uisleep 1;};};
				};
case "SelfOp" : {
	if (goggles player == "MRH_HaloMask") then {
						
						_display = uiNamespace getVariable 'ACE_Goggles_Display';
						_ctrl = _display ctrlCreate ["RscStructuredText", -1]; 
						_ctrl ctrlSetPosition [0.298906 * safezoneW + safezoneX,0.269 * safezoneH + safezoneY,0.397031 * safezoneW,0.066 * safezoneH]; 
						_ctrl ctrlCommit 0; 
						_ctrl ctrlSetStructuredText parsetext ("<t color='#008000'><t size='1.5'><t font='LucidaConsoleB'><t align='center'>"+ (localize "STR_MRH_MRHHaloGear_AADTriggered")+"</t>");
						//_ctrl ctrlSetStructuredText parsetext "<t color='#008000'><t size='1.5'><t font='LucidaConsoleB'><t align='center'>Self opening triggered</t>";
						
						[
							{
								ctrlDelete (_this select 0)
							}, 
							[_ctrl], 
							5
						] call CBA_fnc_waitAndExecute;
						
						
					};
				PlaySound "MRH_beep";
				playSound "MRH_airBurst";
		};

};



