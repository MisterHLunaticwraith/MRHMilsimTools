#include "MRH_C_Path.hpp"
class MRH_Module_Base;
class MRH_RHS_CBPS_module : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_RHS_CBPS_module";
			displayName = "Deploy CBPS";
			curatorCanAttach = 1;
			function = QFUNC(deployCBPSModule);
			icon = PAAPATH(CBPS);
			portrait = PAAPATH(CBPS);
	};