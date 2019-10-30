/* 
	Filename @DrawMapRestrictor.sqf
	Author @kasteelharry
	Licensed under GNU Affero General Public License v3.0

	Copyright @kasteelharry
	All rights reserved 

	This script checks all the map markers and delete every userplaced marker that isn't placed by a player in a group that is defined in the initServer.sqf
	For this to run you need to have Direct Play ID's stored in a global variable with the players name.
	Can be created by @MapRestrictorIDGet.sqf 
*/


fn_setMapWhitelist = { 
	_WGroup = (missionNamespace getVariable "WhitelistedGroup");
	_id = [];
	{

		
    	if (groupId (group _x) in _WGroup) then //check if the player is in the predefined group array
		{
			
			_id pushBack (missionNameSpace getVariable (name _x));

		};
	} foreach allPlayers;
	
	missionNamespace setVariable ["WhiteListedIDs", _id, true];

};


fn_DeleteBlacklistMarkers = {
	{
		
		_del = _x;
		_a = toArray _x;
		_a resize 15;
		if (toString _a == "_USER_DEFINED #") then //makes sure that the marker is userplaced
		{
			_y = _del splitString "#/ "; //splits the values so the ID can be compared
			
			_selectedMarkerid = _y select 1 ;

			
			if ((_selectedMarkerid in (missionNamespace getVariable "WhiteListedIDs")) isEqualTo false)then //if ID is not in the markers name then delete it.
			{
				deleteMarker _del;
			};
		};
	} forEach allMapMarkers;
};



//Loop that loops in the background and keeps checking if the script can start deleting.
//Enabled with 'missionNamespace setVariable ["DisableMapRestrictor", false, true];'
while {true} do{
  
	if ((missionNamespace getVariable "DisableMapRestrictor") isEqualTo false) then 
	{
    //runs the functions and sleeps as to not overload the server/client
		call fn_setMapWhitelist;
		call fn_DeleteBlacklistMarkers;
	};
	sleep 2;

};
