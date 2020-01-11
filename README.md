# Arma 3 Electromagnetic Pulse (EMP) multiplayer port

A modified version of the Arma 3 EMP script by Aliascartoons on [Armaholic](http://www.armaholic.com/page.php?id=34293). Edited by Kasteelharry for useage in multiplayer and to be used in combination with the TFAR jamming script by Rebel12340 on [Armaholic](http://www.armaholic.com/page.php?id=32660). This script has been developed for the missions held by the Arma 3 Unit [Zeus Operations](Zeusops.com) each weekend on their servers.

## Features

1. An Electromagnetic Pulse that disables/removes all electronic devices and disables all vehicles.
2. No radios due to a TFAR radio jammer after running it.
3. Players can't place markers on the map after EMP detonation.

## Disclaimer

The following scripts have been tested in a dedicated enviroment with succesful results. However the author of this repository is not responsible for any damages due to the usage of the script. If any issues are discovered, please open a new issue.

## Installation guide

1. Clone or download the repository and place all the files and folders in your mission folder.
2. Copy contents of any already existing files over to the correct files.
3. In the editor give the object that serves as the EMP source the variable name ***EMP***.
   - If the object already has a variable name, change it in the [initServer.sqf](EMP_DEMO_MISSION.Stratis/initServer.sqf) or set the variable "EMP" as shown in usage.
4. Set the range and strength of the EMP and Jammers in the [initServer.sqf](EMP_DEMO_MISSION.Stratis/initServer.sqf) file.
5. Set the groups that can draw/place markers on map after the EMP blast in the [initServer.sqf](EMP_DEMO_MISSION.Stratis/initServer.sqf) file.

## Usage

- In your mission place down the object that will function as your EMP/jammer and give it a variable name.
- Run the following line of code global:

```sqf
[EMP, EMP_Range, true, true, 0] execvm "AL_emp\emp_starter.sqf";
```

- where ```EMP``` is the variable name you have given to the object in the editor and ```EMP_Range``` the range of the EMP blast.
  - The variables are changeable in initServer.sqf
    - Or with the following code where ```_EMP_Range``` is the range you want and ```_EMPvariables``` is the variable name of the EMP:

```sqf
//Sets the variable from where to run the EMP
missionNamespace setVariable ["EMP", _EMPvariables, true];
//Sets the range of it
missionNamespace setVariable ["EMP_Range", _EMP_Range, true];
```

- To stop the TFAR Jamming script delete the object that you used as the origin of the blast.
- Use the following line of code to let all the players draw on the map again:

```sqf
//Stops the loop where markers are being in deleted
missionNamespace setVariable ["DisableMapRestrictor", true, true];
```

## Other useful info

If you want to change the types of things/entities that are affected by the blast, you can change them in [config_obj.sqf](EMP_DEMO_MISSION.Stratis/AL_emp/config_obj.sqf).

## Known Bugs

## Contact

For any questions about this project feel free to send me an [email.](mailto:g.samuel.cooper@gmail.com?[GitHub]%20Arma%20EMP%20Script)
