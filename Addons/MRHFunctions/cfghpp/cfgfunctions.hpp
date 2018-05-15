class TGV
{
		class TGVVideoFunctions // category
	{
	tag = "TGV";
	file = "\MRHFunctions\Functions\TGVVideo";
		class SplashVideoSkippable		//class myfunction
		{};
		class SplashVideoUnSkippable //class myfunction
		{};

	};		
};
class MRH // Defines the "owner"
{
	class InitFunctions // category
	{
	tag = "MRH";
	/*
		class TEMPLATE //class myfunction
		{
		
		file = "\\MRHFunctions\init.sqf";
		preInit = 1; 
		postInit=1;
		};
	*/

	
	
	};
	/*
	class TemplateFunctions // category
	{
	tag = "MRH";
	/*
		class Roster... //class myfunction
		{
		
		file = "Functions\MRHRoster\fn_.sqf";
	
		};
	};	
	*/

	
	class TimerFunctions // category
	{
	tag = "MRH";
	file = "\MRHFunctions\Functions\MRHTimer";
		class TimerStart		//class myfunction
		{};
		class PauseTimer //class myfunction
		{};
	    class PausedTimerTime //class myfunction
		{};
		class TimerRestart //class myfunction
		{};
		class KillTimer //class myfunction
		{};
	};	
		class ElevatorFunctions // category
	{
	tag = "MRH";
	file = "\MRHFunctions\Functions\MRHElevator";
		class Elevator		//class myfunction
		{};
		
	};
		class HackPhoneFunctions // category
	{
	tag = "MRH";
	file = "\MRHFunctions\Functions\MRHHackPhone";
		class DownloadFile		//class myfunction
		{};
		class Hack
		{};
		
	};
		class Utilities 
	{
	tag = "MRH";
	file = "\MRHFunctions\Functions\MRHUtilities";
		class SplashScreen		
		{};
		class AllAlivePlayers
		{};
		class AllAlivePlayersInVehicle
		{};
		class SitOnChair
		{};
		class SearchObject
		{};
		class RefillBox
		{};
		class AmmoCrate
		{};
		class giveNVGsBack
		{};
		class giveRadiosBack
		{};
		class removeAcreRadios
		{};
		class removeNVGs
		{};
		class staticLineChute
		{};
		class VipSurrender
		{};
		class simpleAceMessage
		{};
		class travelTimeEta
		{};
	

	};
	};
		
		