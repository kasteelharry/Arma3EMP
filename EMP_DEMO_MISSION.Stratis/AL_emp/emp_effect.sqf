/* 
		Originial Author: ALIAS
		Edited by: Kasteelharry
*/

private ["_al_grenade","_shooter","_poz_g","_zgud","_obj_emp"];
_HitPartList = ["hit_optic_driver","hit_optic_periscope","hit_optic_tpd1k","hit_optic_1k13","hit_optic_tkn3","hitturret","hitgun","hitturretcom","hitguncom","hitturretnsvt","hitEngine","hitengine2","hitavionics","hitlaileron","hitraileron","hitlcrudder","hitrrudder","hitlcelevator","hitrelevator","#gear_f_lights", "HitEngine3 ", "HitHydraulics ", "HitHStabilizerR1", "HitHStabilizerL1","HitVStabilizer1", "HitBatteries", "HitLight", "HitPitotTube", "HitMissiles", "HitAvionics", "HitStaticPort"];
_delay_check = 0.01;

["earthquake_02"] remoteExec ["playsound"];


{
	for "_i" from 0 to (count _HitPartList - 1) do 
	{
		//grabs thing from list and destroys it on asset
		_part = _HitPartList # _i;
		//Destroys every object etc in list on every vehicle
		[_x, [_part, 1]] remoteExec ["setHitPointDamage", _x];
	};
	_x disableTIEquipment true;
	_x disableNVGEquipment true;
	[[_x],"AL_emp\tgt_sfx.sqf"] remoteExec ["execVM"];
	sleep _delay_check;
} forEach list_car_emp;


{
	_x setDamage 0.9; 
	[[_x],"AL_emp\sparky.sqf"] remoteExec ["execVM"];
	sleep _delay_check;
} forEach list_light_emp;
{
	_x setDamage 1;
	[[_x],"AL_emp\sparky.sqf"] remoteExec ["execVM"];
	sleep _delay_check;
} forEach static_turrets_emp;
//{_x disableTIEquipment true; _x disableNVGEquipment true; [[_x],"AL_emp\sparky.sqf"] remoteExec ["execVM"];sleep _delay_check} forEach static_turrets_emp;
["geiger"] remoteExec ["playsound"];
{
	//Will be changed into an easier to read block of code, making use of an array etc.
	[[_x],"AL_emp\tgt_sfx.sqf"] remoteExec ["execVM"];
	_x unassignItem "Toolkit";
	_x removeItem "ToolKit";
	removeGoggles _x;
	_x removeWeaponGlobal "Rangefinder";
	_x removeWeaponGlobal "Laserdesignator";
	_x removeItem "Rangefinder";
	_x unassignItem "ItemGPS";
	_x removeItem "ItemGPS";
	_x unassignItem "ItemRadio";
	_x removeItem "ItemRadio";
	_x removePrimaryWeaponItem "acc_pointer_IR"; 
	_removeNVG = [_x] call kast_fnc_RemoveNVGs;
	if (headgear _x in special_helmet_emp) then 
	{
		removeHeadgear _x
	};
	if (secondaryWeapon _x in special_launchers_emp) then 
	{
		_x removeWeaponGlobal (secondaryWeapon _x)
	};

	//Will be changed to do less damage the further you are away according to the laws of physics...
	if (emp_dam>0) then 
	{
		_x setDamage ((Damage _x) + emp_dam)
	};
	sleep _delay_check;
} forEach list_man_emp;