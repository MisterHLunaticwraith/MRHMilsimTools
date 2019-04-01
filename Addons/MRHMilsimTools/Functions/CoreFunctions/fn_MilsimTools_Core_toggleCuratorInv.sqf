_toggled = uiNamespace getVariable ["MRH_MilsimTools_ZeusInv_ToggleState",false];
if (_toggled) then 
{
uiNamespace setVariable ["MRH_MilsimTools_ZeusInv_ToggleState",false];
uiNamespace setVariable ["MRH_MilsimTools_ZeusInv_on",false];

}
else
{
uiNamespace setVariable ["MRH_MilsimTools_ZeusInv_ToggleState",true];
call MRH_fnc_MilsimTools_Core_InvCurator;
};