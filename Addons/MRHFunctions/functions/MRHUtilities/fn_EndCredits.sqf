/*
Function name:MRH_fnc_EndCredits;
Author: Mr H.
Description: plays movie like end credits with player names
Return value: None
Public: Yes
Parameters:
0 -<NUMBER> speed (default 20)
1 - <STRING> mission title
2- <STRING> mission maker's name
3- <STRING> special thanks
4- <STRING> extra text
5- <STRING> year
Example(s):
[20,"MRH Milsim Tools demo","[TGV] Mr H.","Special thanks go here.<br/>Accepts structured text","Extratext comes here<br/> accepts structured text","Made in 2018"] call MRH_fnc_EndCredits;
*/
#include "MRH_C_Path.hpp"
params [["_speed",20],["_title",missionName],["_makername",""],["_thanks",""],["_extratext",""],["_year",""]];

[_speed,_title,_makername,_thanks,_extratext,_year] spawn {
	params ["_speed","_title","_makername","_thanks","_extratext","_year"];
	_strprecredit ="<t font = 'PuristaMedium'>" + (localize "STR_MRH_FC_EC_ITWASTEXT") + "<br/>" + _title +"<br/>" + (localize "STR_MRH_FC_EC_AMISSIONBY")+ "<br/>" + _makername +"<br/>" +"<br/>"+ (localize "STR_MRH_FC_EC_SPECIALTHKS")+ "<br/>" + "<br/>"  + _thanks +"<br/>" + "<br/>" + _extratext + "<br/>" + (localize "STR_MRH_FC_EC_STARRING")+" <br/>" + "</t>";

	_strpostcredit ="<t font = 'PuristaMedium'>" + "<br/><br/>" + "© " + _makername + "<br/>" + _year + "</t>" + "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>";
	//_strFinal = _strprecredit + _strFinal + _strpostcredit;
	_allgroups = call MRH_fnc_MilsimTools_Core_ListGroupsWithPlayers;
	_rosterText = [_allgroups,false] call MRH_fnc_MilsimTools_Core_GenerateRosterText;
	//copytoclipboard _test;
	MRH_Credits_part1 = [_strprecredit,-1,-1,_speed ,-1, -1] spawn BIS_fnc_dynamicText;
	waituntil {scriptdone MRH_Credits_part1};
	sleep 1;
	MRH_Credits_part2 = ["<t font = 'PuristaMedium'><t size = '1'><t color = '#ffffff'>" + _rosterText + "</t>",-1, -1,_speed ,-1, -1] spawn BIS_fnc_dynamicText;
	waituntil {scriptdone MRH_Credits_part2};
	MRH_Credits_part3 = [_strpostcredit,-1,-1,_speed ,-1, -1] spawn BIS_fnc_dynamicText;
	waituntil {scriptdone MRH_Credits_part3};

	//[_strFinal,-1,-1,_duree ,-1] spawn BIS_fnc_dynamicText; // trouver le cap et réécrire la fonction
	/*
		Number: X coordinates (optional)

		Number: Y coordinates (optional)

		Number: Duration (Optional)

		Number: FadeIn time (Optional)

		Number: Delta Y, Text will move up or down depending on value (Optional)

		Number: Resource layer (Optional)
	*/
};