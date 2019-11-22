
//----parents
class Man;
class LandVehicle;
class Air;
class Ship;
//---parents ends
class CAManBase: Man 
{
	class ACE_SelfActions 
	{

		class MRH_vehActions {
			displayName = $STR_MRH_core_satComSystem;
			condition = "!(isNull (objectParent MRH_player))";
			exceptions[] = {"notOnMap", "isNotInside","isNotSitting"};
			statement = "";
			icon = "\MRHMarkers\paa\icoantenna.paa";

			class MRH_connectToSatCom
			{
				displayName = $STR_MRH_core_connectToVehSat;
				condition = "([MRH_player] call MRH_fnc_MilsimTools_Core_canConnectToVehSatCom)&& !([MRH_player] call MRH_fnc_MilsimTools_Core_isConnectedToAntenna)";
				exceptions[] = {"notOnMap", "isNotInside","isNotSitting"};
				statement = "[(vehicle MRH_player),MRH_player] call MRH_fnc_MilsimTools_MiscItems_handleAntennaConnection";
				icon = "\MRHMarkers\paa\iconconnect.paa";
				
			};
		};
	};
};
/*
class B_Truck_01_transport_F;
class B_Truck_01_mover_F : B_Truck_01_transport_F
{
	#include "satcomExternalMacro.hpp"
	mrh_satcom = 1;
};
*/


class Car: LandVehicle 
{
	#include "satcomExternalMacro.hpp"
};
	
class Helicopter: Air 
{
	#include "satcomExternalMacro.hpp"
};
class Plane: Air 
{
	#include "satcomExternalMacro.hpp"
};
		
class Ship_F: Ship 
{
	#include "satcomExternalMacro.hpp"
};
class Tank: LandVehicle 
{
	#include "satcomExternalMacro.hpp"
};