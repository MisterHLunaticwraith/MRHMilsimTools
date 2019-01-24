/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_;

data to create is format: [_dataName, 0 STRING not shown, no spaces, used to ref the data
						   _treeBranchTitle, 1 STRING title (main section)
						   _treeBranchTitleText, 2 STRING text of main section
						   _subSections, 3 (OPTIONAL)
						   		[
							   ARRAY of ARRAY(s) of 2 STRINGS 
						   				where [ 
											   "string 1", select 0 is the title of the subsection
											   "string 2", select 1 is the text of the subsection

										   ]
								]

						   ]
eg: 
[	
	[
		"MyTag_DataName","My menu title","my menu text",[
															["myfirstsubTitle","myfirsubText"],["mysecondSubTitle","mysecondSubText"]
														]
	
	]
] MRH_fnc_MilsimTools_SoldierTab_createDataOnTheFly;
or
eg: 
[	
	[
		"MyTag_DataName","My menu title","my menu text"	
	]
] MRH_fnc_MilsimTools_SoldierTab_createDataOnTheFly;
*/
#include "MRH_C_Path.hpp"
params ["_dataToCreate"];

_entryName = _dataToCreate select 0;
_missionData = missionNamespace getVariable ["MRH_SoldierTab_missionData",[]];
_missionDataSubs = missionNamespace getVariable ["MRH_SoldierTab_missionDataSubs",[]];

_missionData pushBackUnique _entryName;
_missionDataSubs pushBackUnique _dataToCreate;
MNSVAR(missionData,_missionData,true);
MNSVAR(missionDataSubs,_missionDataSubs,true);