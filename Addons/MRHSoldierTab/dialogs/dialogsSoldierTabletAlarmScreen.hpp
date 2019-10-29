

class ChronoTextZone: RscStructuredTextMRHSoldierTab
{
	idc = 7701;
	CBB;
	FS;
	MVT;
	text = "";
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.143 * safezoneH;
};
class TimerTextZone: RscStructuredTextMRHSoldierTab
{
	idc = 7702;
	CBB;
	FS;
	MVT;
	text = "";
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.355781 * safezoneW;
	h = 0.088 * safezoneH;
};
class AlarmTextZone: RscStructuredTextMRHSoldierTab
{
	idc = 7703;
	CBB;
	FS;
	MVT;
	text = "";
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.355781 * safezoneW;
	h = 0.088 * safezoneH;
};
class ChronoStart: RscButtonMRHSoldierTab
{
	idc = 7704;
	CBB;
	FS;
	TXT_ST;
	MVT;
	action = "call MRH_fnc_MilsimTools_SoldierTab_StopWatch;";
	x = 0.505156 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class ChronoStop: RscButtonMRHSoldierTab
{
	idc = 7705;
	CBB;
	FS;
	TXT_SP;
	MVT;
	action = "MRH_player setVariable ['MRH_SoldierTab_StopwatchRunning',false];";
	x = 0.556719 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class ChronoReset: RscButtonMRHSoldierTab
{
	idc = 7706;
	CBB;
	FS;
	TEXT_RST;
	MVT;
	action = "call MRH_fnc_MilsimTools_SoldierTab_StopWatchReset;";
	x = 0.608281 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class ChronoElapsed: RscStructuredTextMRHSoldierTab
{
	idc = 7707;
	CBB;
	FS;
	text = "";
	MVT;
	x = 0.505156 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.066 * safezoneH;
};
class TimerHinput: RscEditMRHSoldierTab
{
	idc = 7708;
	CB;
	FS;
	EDT_HH;
	MVT;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class TimerMInput: RscEditMRHSoldierTab
{
	idc = 7709;
	CB;
	FS;
	EDT_MM;
	MVT;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class TimerMtext: RscStructuredTextMRHSoldierTab
{
	idc = 7710;
	CBT;
	FS;
	TXT_MM;
	MVT;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class TimerHText: RscStructuredTextMRHSoldierTab
{
	idc = 7711;
	CBT;
	FS;
	TXT_HH;
	MVT;
	x = 0.340156 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class TimerSInput: RscEditMRHSoldierTab
{
	idc = 7712;
	CB;
	FS;
	EDT_SS;
	MVT;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class TimerStext: RscStructuredTextMRHSoldierTab
{
	idc = 7713;
	CBT;
	FS;
	TXT_SS;
	MVT;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class TimerStart: RscButtonMRHSoldierTab
{
	idc = 7714;
	CBB;
	FS;
	TXT_ST;
	MVT;
	action = "call MRH_fnc_MilsimTools_SoldierTab_StartTimer;";
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class AlarmHinput: RscEditMRHSoldierTab
{
	idc = 7715;
	CB;
	FS;
	EDT_HH;
	MVT;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class AlarmHtext: RscStructuredTextMRHSoldierTab
{
	idc = 7716;
	CBT;
	FS;
	TXT_HH;
	MVT;
	x = 0.340156 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class AlarmMinput: RscEditMRHSoldierTab
{
	idc = 7717;
	CB;
	FS;
	EDT_MM;
	MVT;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class AlarmMtext: RscStructuredTextMRHSoldierTab
{
	idc = 7718;
	CBT;
	FS;
	TXT_MM;
	MVT;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class AlarmSinput: RscEditMRHSoldierTab
{
	idc = 7719;
	CB;
	FS;
	EDT_SS;
	MVT;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class AlarmStext: RscStructuredTextMRHSoldierTab
{
	idc = 7720;
	CBT;
	FS;
	TXT_SS;
	MVT;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class AlarmSTart: RscButtonMRHSoldierTab
{
	idc = 7721;
	CBB;
	FS;
	TXT_ST;
	MVT;
	action = "call MRH_fnc_MilsimTools_SoldierTab_SetAlarm;";
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class TimerCancel: RscButtonMRHSoldierTab
{
	idc = 7722;
	CBB;
	FS;
	TXT_SP;
	MVT;
	action = "MRH_player setVariable ['MRH_SoldierTab_timerIsRunning',false];";
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class AlarmCancel: RscButtonMRHSoldierTab
{
	idc = 7723;
	CBB;
	FS;
	TXT_SP;
	MVT;
	action = "call MRH_fnc_MilsimTools_SoldierTab_TerminateAlarm;";
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
