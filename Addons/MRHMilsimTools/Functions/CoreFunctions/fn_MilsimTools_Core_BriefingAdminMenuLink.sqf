/*
Function name:MRH_fnc_MilsimTools_Core_BriefingAdminMenuLink
Author: Mr H.
Description: adds a briefing entry visible only to admins, the entry contains a link to launch admin menu
Return value:None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_Core_BriefingAdminMenuLink ;
*/

if (serverCommandAvailable "#kick") then 
{

	_briefing = "<br/>" 
	+ localize "STR_MRH_MS_BRIEFINGADDINFO" 
	+"<br/><font size='18'>"
	+ localize"STR_MRH_MS_BRIEFINGADDTITLE"
	+"</font><br/>"
	+"|-"
	+" <execute expression='call MRH_fnc_MilsimTools_Admin_OpenMenu;'>"
	+ localize "STR_MRH_MS_BRIEFINGADDTEXT"
	+"</execute><br/>";
	player createDiarySubject ["MRHACC","MRH Milsim Tools ADMIN"];
	player createDiaryRecord ["MRHACC", [localize"STR_MRH_MS_BRIEFINGADDTITLE",_briefing]];

};
