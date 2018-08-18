_toggled = player getVariable ["MRH_MilsimTools_ZeusInv_ToggleState",false];
if (_toggled) then 
{
player setVariable ["MRH_MilsimTools_ZeusInv_ToggleState",false];
player setVariable ["MRH_MilsimTools_ZeusInv_on",false];

}
else
{
player setVariable ["MRH_MilsimTools_ZeusInv_ToggleState",true];
call MRH_fnc_MilsimTools_Core_InvCurator;
};