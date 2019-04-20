	#include "MRH_C_Path.hpp"
class rhsusf_M1083A1P2_B_fmtv_usarmy;

class rhsusf_M1085A1P2_B_Medical_fmtv_usarmy: rhsusf_M1083A1P2_B_fmtv_usarmy

{
	class UserActions 
		{
			
			class open_tent
			{
				
				statement="this animateSource ['deploy_tent',1];[this] call MRH_fnc_MilsimTools_RHS_CBPS_populate;";
				

			};
			class close_tent: open_tent
			{

				statement="this animateSource ['deploy_tent',0];[this] call MRH_fnc_MilsimTools_RHS_CBPS_repack;";
				

			};
		};
		
	class attributes
	{
	

		class MRH_useCBPSSpecificComp
		{ 
			displayName = "Use specific composition for this CBPS"; 
			tooltip = "sometooltip"; 
			property = "mrh_CBPSuseSpeComp"; 
			control = "Checkbox";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = false;
			unique = 0; 
			validate = "none";
			condition = "object";
			typeName = "BOOL";
		};

		class MRH_CBPSSpecificCompSelected
		{ 
			displayName = "Select composition"; 
			tooltip = "sometooltip"; 
			property = "mrh_CBPSselectedCmp"; 
			control = "MRH_CBPS_Cmb";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "MRH_defaultCBPS_medical_simple";
			unique = 0; 
			validate = "none";
			condition = "object";
			typeName = "BOOL";
		};
	};
};