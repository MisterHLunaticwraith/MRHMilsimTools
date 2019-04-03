/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
*/

//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"

[
    {
			#include "MRH_C_Path.hpp"	
		_display = findDisplay 220119;

		#define CTRLF(ARG) ((_display) displayCtrl ARG)

		_VARNAME = CTRLF(1001);
		_TITLE = CTRLF(1400);
		_TEXT = CTRLF(1401);
		_TREE = CTRLF(9902);
		[	
			[
				ctrlText _VARNAME,ctrlText _TITLE,ctrlText _TEXT	
			]
		] FUNC(dataCreatorFileTemporaryData);
		[[_TITLE]] FUNC(refreshDataPreviewer);


		_index = [ctrlText _VARNAME,220119,9902] FUNC(findTvTreeIndexFor);
		_TREE tvSetCurSel [_index];
    }, 
    [], 
    0.2
] call CBA_fnc_waitAndExecute;