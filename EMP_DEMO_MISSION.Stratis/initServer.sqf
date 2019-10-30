/*
	initServer.sqf lines of code 
	By @kasteelharry
*/

///////////////////////////////////
///								///
///		EDITABLE VARIABLE 		///
///								///
///////////////////////////////////

_EMPvariables = _jammervariables = EMP; //Needs to contain the variable name of the object spawned in game
_EMP_Range = _jammerRadius = 1000; //Range of the EMP blast and jamming afterwards
_jammerStrength = 100; //Strength of the jammer, max is 100

///////////////////////////////////
///								///
///			DO NOT EDIT 		///
///								///
///////////////////////////////////
missionNamespace setVariable ["EMP", _EMPvariables, true];
missionNamespace setVariable ["EMP_Range", _EMP_Range, true];
missionNamespace setVariable ["Jammers", _jammerNames, true];
missionNamespace setVariable ["JammerRadius", _jammerRadius, true];
missionNamespace setVariable ["JammerStrength", _JammerStrength, true];