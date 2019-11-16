/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_percentage",["_size",10]];
	if (_size>18)then {_size =18};
	private _size = "'"+ (str _size) + "'";
	private _emptyColor = "'#D0CCFE'";
	private _fullColor = "'#2bfa06'";
	private _over90Color = "'#ff0000'";
	if (_percentage >=90)then {_fullColor = _over90Color};
	private _bar = "";
	private _1 = "|";
	private _empty = 100-_percentage;
	private _fullBar = "";
	private _emptyBar = "";
	for "_i" from 0 to _percentage do {_fullBar = _fullBar + _1};
	for "_i" from 0 to _empty do {_emptyBar = _emptyBar + _1};
	private _text = "<br/><font color=" + _fullColor + "size="+_size+">"+ _fullBar +"</font>" + "<font color=" + _emptyColor + "size="+_size+">"+ _emptyBar +"</font>"+ " "+ "<font color=" + _fullColor + "size="+_size+">"+ (_percentage toFixed 1) +"%"+"</font><br/>";
	_text