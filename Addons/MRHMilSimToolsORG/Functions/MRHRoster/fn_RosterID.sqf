
_leader = leader player;
_roleleader = roledescription _leader;
_groupe = _roleleader splitString "@|" select 1;
_coms = _roleleader splitString "@|" select 2;
_rank = rankID player;
_strRank = "";
switch (_rank) do {
				case 0:{
					_strRank = "simple soldat ";
				};
				case 1:{
					_strRank = "Caporal ";
				};
				case 2:{
					_strRank = "Sergent ";
				};
				case 3:{
					_strRank = "Lieutenant ";
				};
				case 4:{
					_strRank = "Capitaine ";
				};
				case 5:{
					_strRank = "Major ";
				};
				case 6:{
					_strRank = "Colonel ";
				};
				default{
					_strRank = "simple soldat ";
				};
			};
			
_resrole = player getVariable "displayname";
_result =  [
"<t size='0.7'><t color='#24425e'>",
"Vous êtes " , 
"le ", 
_strRank , 
profileName ,
"<br/>" ,
"Votre rôle est ",
_resrole,
"<br/>" , 
"Votre groupe est " , 
_groupe ,
"<br/>" ,
"Votre channel radio intrasquad est " ,
 _coms,
 " </t>"] joinString "";
 copytoclipboard  str _result;






_txt = parseText _result;
((findDisplay 777) displayCtrl 1300) ctrlSetStructuredText _txt;


switch (_rank) do {
				case 0:{
					((findDisplay 777) displayCtrl 1206) ctrlSetText "\MRHMilSimTools\GUI\grades\private.paa";
				};
				case 1:{
					((findDisplay 777) displayCtrl 1206) ctrlSetText "\MRHMilSimTools\GUI\grades\caporal.paa";
				};
				case 2:{
					((findDisplay 777) displayCtrl 1206) ctrlSetText "\MRHMilSimTools\GUI\grades\sergent.paa";
				};
				case 3:{
					((findDisplay 777) displayCtrl 1206) ctrlSetText "\MRHMilSimTools\GUI\grades\lieutenant.paa";
				};
				case 4:{
					((findDisplay 777) displayCtrl 1206) ctrlSetText "\MRHMilSimTools\GUI\grades\capitaine.paa";
				};
				case 5:{
					((findDisplay 777) displayCtrl 1206) ctrlSetText "\MRHMilSimTools\GUI\grades\major.paa";
				};
				case 6:{
					((findDisplay 777) displayCtrl 1206) ctrlSetText "\MRHMilSimTools\GUI\grades\colonel.paa";
				};
				default{
					((findDisplay 777) displayCtrl 1206) ctrlSetText "\MRHMilSimTools\GUI\grades\private.paa";
				};
			};
