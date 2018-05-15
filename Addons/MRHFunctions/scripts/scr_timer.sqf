/* variable générées:
publicTimerOver ==> BOOL ==> true si le timer est over
*/


//if (checkrun) exitWith {};
checkrun = true;
//////pour que le script ne s'execute qu'une fois.

//récupération des params de la fonction
_publicTime = _this select 0;



//////////////////////
publicTimerOver = false;
while {publicTimerON && _publicTime>10} do {

_publicTime = _publicTime -1;
if (publicTimerPaused) exitWith {[_publicTime] call MRH_fnc_PausedTimerTime};
sleep 1;
_timestamp = _publicTime/3600;
_timedisplay = [_timestamp, "HH:MM:SS"] call BIS_fnc_timeToString;
["<t font = 'PuristaMedium'><t size = '1'>" + _timedisplay + "</t>",0.8,-0.05,1,0] spawn BIS_fnc_dynamicText; 
};
//10 dernieres secondes en rouge avec bip
while {publicTimerON && _publicTime<=10 && _publicTime>= 0} do {
_publicTime = _publicTime -1;
sleep 1;
_timestamp = _publicTime/3600;
_timedisplay = [_timestamp, "HH:MM:SS"] call BIS_fnc_timeToString;
["<t font = 'PuristaMedium'><t size = '1'><t color = '#FF0000'>" + _timedisplay + "</t>",-1,-1,1,0] spawn BIS_fnc_dynamicText;
playSound "biptimer";
};
checkrun = false;
if (_publicTime <= 0) exitWith {publicTimerOver = true; publicVariable "publicTimerOver";}; 





