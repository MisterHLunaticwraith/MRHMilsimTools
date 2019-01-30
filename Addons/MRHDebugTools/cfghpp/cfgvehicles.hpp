	#include "MRH_C_Path.hpp"
class Man;
class CAManBase: Man 
{

	class ACE_SelfActions 
	{
		class MRH_DebugTools_Base_Action
		{
			
				displayName = "Debug Tools";
				condition = "";
				exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
				statement = "";
				icon = "";
				

				class MRH_DT_DrawTriggers
				{
					displayName = "Draw triggers";
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(drawAllTriggers);
					icon = "";
				};

				class MRH_DT_UnDrawTriggers
				{
					displayName = "Stop drawing triggers";
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(undrawAllTriggers);
					icon = "";
				};

				class MRH_DT_DrawSelections
				{
					displayName = "Draw selections for cursor target";
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(selectionPositionsDrawAction);
					icon = "";
				};

				class MRH_DT_UnDrawSeelections
				{
					displayName = "Undraw all selections positions";
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(undrawSelectionPositions);
					icon = "";
				};

				class MRH_DT_DrawModelToWorld
				{
					displayName = "Draw modelToWorld guides for cursor target";
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(modelToWorldDrawAction);
					icon = "";
				};

				class MRH_DT_UndrawAllMDT
				{
					displayName = "Undraw all model to world positions";
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(undrawAllModelToWorldPositions);
					icon = "";
				};
				


			
	
		}	

	}

};