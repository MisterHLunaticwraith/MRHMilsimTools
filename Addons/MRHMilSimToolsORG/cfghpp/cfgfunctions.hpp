class MRH // Defines the "owner"
{
	class InitFunctions // category
	{
	tag = "MRH";
	/*
		class TEMPLATE //class myfunction
		{
		
		file = "\MRHMilSimTools\\MRHCustomInsignias\initplayerlocal.sqf";
		preInit = 1; 
		postInit=1;
		};
	*/
			class RosterInit //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHRoster\fn_RosterInit.sqf";
		//preInit = 1; 
		postInit=1;
		};
			class OnPlayerKilled //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\InitFunctions\fn_OnPlayerKilledInit.sqf";
		//preInit = 1; 
		postInit=1;
		};
			class InitAdminDeadCount //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\InitFunctions\fn_InitAdminDeadCount.sqf";
		//preInit = 1; 
		postInit=1;
		};
			class InitPlayerLocal //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\InitFunctions\fn_InitPlayerLocal.sqf";
		//preInit = 1; 
		postInit=1;
		};
			class BriefingAdmin //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\InitFunctions\fn_BriefingAdmin.sqf";
		preInit = 1; 
		postInit=1;
		};
	
	
	};
	class RosterFunctions // category
	{
	tag = "MRH";
	/*
		class Roster... //class myfunction
		{
		
		file = "Functions\MRHRoster\fn_.sqf";
	
		};
	*/
			class RosterID //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHRoster\fn_RosterID.sqf";
	
		};
		
			class RosterOrbatNotes //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHRoster\fn_RosterOrbatNotes.sqf";
	
		};
			class RosterPIP //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHRoster\fn_RosterPIP.sqf";
	
		};
			class RosterRoleAssign //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHRoster\fn_RosterRoleAssign.sqf";
	
		};
			class RosterCore //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHRoster\fn_RosterCore.sqf";
	
		};
			class RosterScript //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHRoster\fn_RosterScript.sqf";
	
		};
			class StartUpRoster //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHRoster\fn_StartUpRoster.sqf";
	
		};
				class debughint //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHRoster\fn_debughint.sqf";
	
		};
	};
		
		class ACCFunctions // category
	{
	tag = "MRH";
	/*
		class Roster... //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHACC\fn_.sqf";
	
		};
	*/
			class AdminDeadCount //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHACC\fn_AdminDeadCount.sqf";
	
		};
			class Allow //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHACC\fn_Allow.sqf";
	
		};
			class Execution //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHACC\fn_Execution.sqf";
	
		};
			class EndMission //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHACC\fn_EndMission.sqf";
	
		};
			class CoreFunctionACC //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHACC\fn_CoreFunctionACC.sqf";
	
		};
		
	};
		class JIPFunctions // category
	{
	tag = "MRH";

			class JIPCoreFunction //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHJip\fn_JIPCoreFunction.sqf";
	
		};
		
			class JIPGroupJoin //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHJip\fn_JIPGroupJoin.sqf";
	
		};
			class JIPTeleport //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHJip\fn_JIPTeleport.sqf";
	
		};
		
			class JIPTeleportCam //class myfunction
		{
		
		file = "\MRHMilSimTools\Functions\MRHJip\fn_JIPTeleportCam.sqf";
	
		};
		
	};

};