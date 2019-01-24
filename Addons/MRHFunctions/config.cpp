class CfgPatches {
	class MRHFunctions{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};

//////=========cfgFunctions========
class CfgFunctions
{
	#include "\MRHFunctions\functions\cfgfunctions.hpp"
};
////=============fincfgFunctions

/////=========cfgSounds==========
class CfgSounds
{
	#include "\MRHFunctions\sounds\cfgsounds.hpp"
};
////=============fincfgSounds=====

class cfgWeapons
{
	#include "\MRHFunctions\models\hackphone\hackphone.hpp"
};
////=====================FinDesCFG=================================================



///==========composants des menusCORE====

/////////////////======Ressources MRHHACKPHONE
#include "\MRHFunctions\dialogsHPP\definesHACKPHONE.hpp"
#include "\MRHFunctions\dialogsHPP\dialogsHACKPHONE.hpp"
/////////////////======Fin Ressources MRHRoster
#include "\MRHFunctions\dialogsHPP\dialogsMRHconv.hpp"
///==========FINcomposants des menusCORE====


class cfgVehicles
{
	class Man;
	class CAManBase: Man 
	{
		 class ACE_Actions 
		 {
				class MRH_Conversation_MainConvAction
				{
					displayName = $STR_MRH_FC_CFGTALKACTIONPOINT;
					icon = "";
					distance = 2;
					selection = "head";  
						
				};  
   		 };
	};
};