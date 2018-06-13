	class Man;
    class CAManBase: Man 
	{
        class ACE_SelfActions 
		{
			class ACE_Equipment {

				class MRH_Ace_USE_SOLDIERPDA
				{
					displayName = $STR_MRH_ST_ACE_EQUIPOPENPDA;
					condition = "'MRH_SoldierTab' in items player";
					exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_SoldierTab_OpenTablet;";
					icon = "\MRHSoldierTab\models\Tablet\tableticon.paa";
					
				};
			};

		};
	};