/*
this #include file will do some basic prossessing for every function called from a logic. The method is inspired by @achilles mod and all credit for the idea goes to the achilles team authors
*/

//get logic
_logic = param [0,objNull,[objNull]];

//exit if logic is not local
if (!local _logic) exitWith {};

//prevent logic from executing twice
if (_logic getVariable ["MRH_milsimtools_logicWasActivated", false]) exitWith {};
_logic setVariable ["MRH_milsimtools_logicWasActivated", true];