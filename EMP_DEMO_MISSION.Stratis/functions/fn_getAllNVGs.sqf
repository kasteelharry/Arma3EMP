/*
	Author: Mr. H.
	Description: Put's all the NVG's in a list to be removed later. Based upon Mr. H. MRH_fnc_removeNVGs function in MRHMilsimTools
	Return value:None
	Public: Yes
	Parameters:
*/


//Gets all the objects from cfgWeapon 
_allWeaponsConfigs = "true" configClasses (configFile >> "cfgWeapons");
_allWeaponsConfigNames = _allWeaponsConfigs apply {configName _x};

//Hardcoded the apex NVGs due to them not being found...
allNVGsArray = ["NVGoggles_tna_F"];
{
_disp = getnumber (configfile >> "CfgWeapons" >> _x >> "scope");
_macro = gettext (configfile >> "CfgWeapons" >> _x >> "_generalMacro");
if (isNil "_macro") then {_macro = "";};
if ((_disp == 2) && (_macro == "NVGoggles")) then 
{
allNVGsArray pushBackUnique _x; 

};
} forEach _allWeaponsConfigNames;