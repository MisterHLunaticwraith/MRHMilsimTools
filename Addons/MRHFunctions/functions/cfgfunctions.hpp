class MRH // Defines the "owner"
{
	class TimerFunctions // category
	{
	tag = "MRH";
	file = "\MRHFunctions\Functions\MRHTimer";
		#include "MRHTimer\TimerFunctions.hpp"
	};	
		class ElevatorFunctions // category
	{
	tag = "MRH";
	file = "\MRHFunctions\Functions\MRHElevator";
		#include "MRHElevator\ElevatorFunctions.hpp"
	};
		class HackPhoneFunctions // category
	{
	tag = "MRH";
	file = "\MRHFunctions\Functions\MRHHackPhone";
		#include "MRHHackPhone\HackPhoneFunctions.hpp"	
	};
		class Utilities 
	{
	tag = "MRH";
	file = "\MRHFunctions\Functions\MRHUtilities";
		#include "MRHUtilities\UtilitiesFunctions.hpp"
	};
};
		
		