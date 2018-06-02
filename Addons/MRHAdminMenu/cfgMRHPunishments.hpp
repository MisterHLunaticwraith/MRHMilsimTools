//very important,don't forget to define the targeted player in you your code, the selected player is passed as a parameter so: _selectedPlayer = _this select 0;
//code is spawned so it will accept suspension
#include "MRH_components.hpp"
class cfgMRHPunishments
{
	/*
	class TEMPLATE
	{
		picture= "";
		displayName = "";
		notificationMessage = "";
		code = "_player = _this select 0;";
		
	};
	*/
		class MRH_PushUps
	{
		picture= PAAPATH(pushups.paa);
		displayName = $STR_MRH_ADM_PUNISH_PU;
		notificationMessage = $STR_MRH_ADM_NOT_PUNISHMENT;
		code = "_player = _this select 0;[[_player], { (_this select 0) playMove 'AmovPercMstpSnonWnonDnon_exercisePushup'}] RemoteExec ['Spawn',0, false];";
		
	};
	
		class MRH_Squats
	{
		picture= PAAPATH(squats.paa);
		displayName = $STR_MRH_ADM_PUNISH_SQ;
		notificationMessage = $STR_MRH_ADM_NOT_PUNISHMENT;
		code = "_player = _this select 0;[[_player], { (_this select 0) playMove 'AmovPercMstpSnonWnonDnon_exercisekneeBendA'; sleep 6; (_this select 0) playMove 'AmovPercMstpSnonWnonDnon_exercisekneeBendB';}] RemoteExec ['Spawn',0, false];";
		
	};
	
		class MRH_ChickenAdd
	{
		picture= PAAPATH(chicken.paa);
		displayName = $STR_MRH_ADM_PUNISH_ADDCHCK;
		notificationMessage = $STR_MRH_ADM_NOT_PUNISHMENT;
		code = "_player = _this select 0;if !((_player getVariable ['MRH_SpawnedChicken',[]]) isEqualTo []) ExitWith {};_expl1 = 'Cock_random_F' createVehicle position _player; _expl1 attachTo [_player, [-0.1, 0.1, 0.15], 'Head']; _expl1 setVectorDirAndUp [ [0.5, 0.5, 0], [-0.5, 0.5, 0] ]; _player setVariable ['MRH_SpawnedChicken',_expl1,true];";
		
	};
	
		class MRH_ChickenRemove
	{
		picture= PAAPATH(chicken.paa);
		displayName = $STR_MRH_ADM_PUNISH_RMVCHCK;
		notificationMessage = $STR_MRH_ADM_NOT_PUNISHMENTREMOVED;
		code = "_player = _this select 0;_chicken = _player getVariable 'MRH_SpawnedChicken'; deleteVehicle _chicken;_player setVariable ['MRH_SpawnedChicken',[],true];";
		
	};
		class MRH_Naked
	{
		picture= PAAPATH(naked.paa);
		displayName = $STR_MRH_ADM_PUNISH_NK;
		notificationMessage = $STR_MRH_ADM_NOT_PUNISHMENT;
		code = "_player = _this select 0;if !((_player getVariable ['MRH_PunishmentNakedLO',[]]) isEqualTo []) ExitWith {};_savedLO = getUnitLoadout _player; _player setVariable ['MRH_PunishmentNakedLO',_savedLO,true]; _player setUnitLoadout [[],[],[],[],[],[],'','',[],['','','','','','']];";
		
	};
	
			class MRH_UnNaked
	{
		picture= PAAPATH(naked.paa);
		displayName = $STR_MRH_ADM_PUNISH_UNNK;
		notificationMessage = $STR_MRH_ADM_NOT_PUNISHMENTREMOVED;
		code = "_player = _this select 0;_toRestore = _player getVariable 'MRH_PunishmentNakedLO'; _player setUnitLoadout _toRestore;_player setVariable ['MRH_PunishmentNakedLO',[],true];";
		
	};
};