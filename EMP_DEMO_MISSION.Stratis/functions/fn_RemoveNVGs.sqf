/*
	Author: MR. H.
	Description: removes the NVGs on player. Based upon Mr. H. MRH_fnc_removeNVGs function in MRHMilsimTools
	Return value:None
	Public: Yes
	Parameters:
	0 - <OBJECT> - Unit to remove NVGs from.
	Example(s):
	[player] call Kast_fnc_removeNVGs;
*/

params ["_unit"];

_assignedItems = assigneditems _unit;
_items = items _unit;
_toSave = [];
_toSaveAssigned = [];
{
if (_x in _items) then {_unit removeItem _x; _toSave pushBack _x;};
if (_x in _assignedItems) then {_unit unlinkItem _x; _toSaveAssigned pushBackUnique _x;};

} forEach allNVGsArray;