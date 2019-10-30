/*
Jam Radios script for TFAR created by Asherion and Rebel, edited by Kasteelharry
Version 0.2.0
Original version available from: https://forums.bistudio.com/forums/topic/203810-release-radio-jamming-script-for-task-force-radio/

This script will jam radios for all players within a given radius of a jamming vehicle
Jamming is stronger nearer to the vehicle, while less strong at the edges of the radius
NOTE: It is recommended to call this script from initPlayerLocal.sqf if you want to run the script from mission start.

Changes made by Kasteelharry:
- Made the interference an exponential function and not a linear function 


Parameter(s):
0: ARRAY of object(s) (Required)- Entity(s) that will cause the radios to be jammed.
1: NUMBER (Optional)- Range of the jammer in Meters. Default is 1000.
2: NUMBER (Optional)- Strength of the jammer. Default is 50.
3: BOOL (Optional)- Enable Debug. Default is False.
Example: jamRadios = [[JAMMER],500] execVM "TFARjamRadios.sqf";
*/

if (!hasInterface) exitwith {};
waituntil {!isnull player};

//Define the variables along with their default values.
_jammers = param [0, [objNull], [[objNull]]];
_rad = param [1, 1000, [0]];
_strength = param [2, 50, [0]] - 1; // Minus one so that radio interference never goes below 1 near the edge of the radius (which is the default for TFAR).
_debug = param [3, false, [true]];

//compare distances between jammers and player to find nearest jammer and set it as _jammer
_jammerDist = {
	_jammer = objNull;
	_closestDist = 1000000;
	{
		if (_x distance player < _closestdist) then {
			_jammer = _x;
			_closestDist = _x distance player;
		};
	} foreach _jammers;
	_jammer;
};
_jammer = call _jammerDist;

// While the Jamming Vehicle is not destroyed, loop every 5 seconds
while {alive _jammer} do
{
    // Set variables
    _dist = player distance _jammer;
    _distPercent = _dist / _rad;
    _interference = 1;
	_sendInterference = 1;

    if (_dist < _rad) then {
		
		//Edited by Kasteelharry
		_interference = ((_distPercent*100) - _strength)^2 + 1; // Calculat the recieving interference, which has to be above 1 to have any effect.
		
		_sendInterference = 1/_interference; //Calculate the sending interference, which needs to be below 1 to have any effect.
    };
    // Set the TF receiving and sending distance multipliers
    player setVariable ["tf_receivingDistanceMultiplicator", _interference];
	player setVariable ["tf_sendingDistanceMultiplicator", _sendInterference];
	
    // Debug chat and marker.
	if (_debug) then {
		deletemarkerLocal "CIS_DebugMarker";
		deletemarkerLocal "CIS_DebugMarker2";
		//Area marker
		_debugMarker = createmarkerLocal ["CIS_DebugMarker", position _jammer];
		_debugMarker setMarkerShapeLocal "ELLIPSE";
		_debugMarker setMarkerSizeLocal [_rad, _rad];
		
		//Position Marker
		_debugMarker2 = createmarkerLocal ["CIS_DebugMarker2", position _jammer];
		_debugMarker2 setMarkerShapeLocal "ICON";
		_debugMarker2 setMarkerTypeLocal "mil_dot";
		_debugMarker2 setMarkerTextLocal format ["%1", _jammer];
		
		systemChat format ["Distance: %1, Percent: %2, Interference: %3, Send Interference: %4", _dist,  100 * _distPercent, _interference, _sendInterference];
		systemChat format ["Active Jammer: %1, Jammers: %2",_jammer, _jammers];
		
	};
    // Sleep 5 seconds before running again
    sleep 5.0;
	
	//Only run this if there are multiple jammers.
	if (count _jammers > 1) then {
		//Check if all of the jammers are still alive. If not, remove it from _jammers.
		{
			if (!alive _x AND count _jammers > 1) then {_jammers = _jammers - [_x]};
		} foreach _jammers;
	
		//Check for closest jammer
		_jammer = call _jammerDist;
	};
};

//Set TFR settings back to normal before exiting the script
player setVariable ["tf_receivingDistanceMultiplicator", 1];
player setVariable ["tf_sendingDistanceMultiplicator", 1];