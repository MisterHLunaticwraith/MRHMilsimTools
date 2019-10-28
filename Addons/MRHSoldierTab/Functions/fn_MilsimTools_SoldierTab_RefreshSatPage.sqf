/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_;
*/
#include "MRH_C_Path.hpp"
FUNC(AllCtrlsHide);
_pageSpecificCtrls = [1211,1212];
{
ctrlShow [_x,true];
}ForEach _pageSpecificCtrls;

private _ctrlSatFeed= FDIS(1211);
private _ctrlMarkings = FDIS(1212);
if !([MRH_player]CFUNC(isConnectedToAntenna)) exitWith {
	_ctrlSatFeed ctrlSetText "\MRHSatellite\Paa\satNoAntenna.paa";
	_ctrlMarkings ctrlShow false;
};
private _satAvail = missionNamespace getVariable ["MRHSatFirstInitCheck",false];
if (_satAvail) then {
	_ctrlSatFeed ctrlSetText "#(argb,512,512,1)r2t(rttMRHSatelliteFeed,1.0)";
	_ctrlMarkings ctrlSetText "\MRHSatellite\Paa\screenMarks.paa";
}
else
{
	_ctrlSatFeed ctrlSetText "\MRHSatellite\Paa\offline.paa";
	[
    	{(missionNamespace getVariable ["MRHSatFirstInitCheck",false])}, 
    	{
			params ["_ctrlSatFeed","_ctrlMarkings"];
			if !(ctrlShown _ctrlSatFeed) exitWith {};
			_ctrlSatFeed ctrlSetText "#(argb,512,512,1)r2t(rttMRHSatelliteFeed,1.0)";
			_ctrlMarkings ctrlSetText "\MRHSatellite\Paa\screenMarks.paa";

		}, 
    	[_ctrlSatFeed,_ctrlMarkings]
	] call CBA_fnc_waitUntilAndExecute;
};