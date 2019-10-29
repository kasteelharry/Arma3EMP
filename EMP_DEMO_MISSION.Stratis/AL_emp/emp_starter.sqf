/* 
		Originial Author: ALIAS
		Edited by: Kasteelharry
*/

if (!isServer) exitWith {};

_obj_emp	= _this select 0;
_rang_emp	= _this select 1;
_viz_eff	= _this select 2;
_player_viz = _this select 3;
_dam_unit	= _this select 4;

//if (!isNil {_obj_emp getVariable "is_ON"}) exitwith {};
_obj_emp setVariable ["is_ON",true,true];
missionNamespace setVariable ["empDetonated", true, true];
emp_dam =_dam_unit;
publicVariable "emp_dam";
if (_viz_eff or _player_viz) then 
{
	[[_obj_emp,_viz_eff,_player_viz],"AL_emp\viz_eff_emp.sqf"] remoteExec ["execVM"]
};
[_obj_emp,_rang_emp] execvm "AL_emp\config_obj.sqf";
waitUntil {!isNil "special_launchers_emp"};
waitUntil {!isNil "emp_dam"};
[] execvm "AL_emp\emp_effect.sqf";