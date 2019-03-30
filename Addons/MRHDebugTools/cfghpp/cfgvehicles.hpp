	#include "MRH_C_Path.hpp"
class Man;
class CAManBase: Man 
{

	class ACE_SelfActions 
	{
		class MRH_DebugTools_Base_Action
		{
			
				displayName = $STR_MRH_MRHDebugTools_DBGTOOLSTITLE;
				condition = "";
				exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
				statement = "";
				icon = "";
				

				class MRH_DT_DrawTriggers
				{
					displayName = $STR_MRH_MRHDebugTools_DRAWTRIGGERS;
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(drawAllTriggers);
					icon = "";
				};

				class MRH_DT_UnDrawTriggers
				{
					displayName = $STR_MRH_MRHDebugTools_STOPDRAWTRIGGERS;
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(undrawAllTriggers);
					icon = "";
				};

				class MRH_DT_DrawSelections
				{
					displayName = $STR_MRH_MRHDebugTools_DRAWSELCURT;
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(selectionPositionsDrawAction);
					icon = "";
				};

				class MRH_DT_UnDrawSeelections
				{
					displayName = $STR_MRH_MRHDebugTools_UNDRAWALLSELSPOS;
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(undrawSelectionPositions);
					icon = "";
				};

				class MRH_DT_DrawModelToWorld
				{
					displayName = $STR_MRH_MRHDebugTools_DRAWMTWG;
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(modelToWorldDrawAction);
					icon = "";
				};

				class MRH_DT_UndrawAllMDT
				{
					displayName = $STR_MRH_MRHDebugTools_UNDRAWMTW;
					condition = QCFUNC(conditionsDebugAction);
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = QCFUNC(undrawAllModelToWorldPositions);
					icon = "";
				};
				


			
	
		}	

	}

};