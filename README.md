# Arma3EMPmultiplayer

A modified version of the Arma 3 EMP script by Aliascartoons on [Armaholic](http://www.armaholic.com/page.php?id=34293). Edited by Kasteelharry for useage in multiplayer and to be used in combination with a TFAR jamming script.

## Installation

1. Clone or download the repository and place all the files and folders in your mission folder.
2. Copy contents of any already existing files over to the correct files.

## Usage

- In your mission place down the object that will function as your EMP/jammer and give it a variable name.
- Run the following line of code:

```sqf
[variable,range,true,true] execvm "AL_emp\emp_starter.sqf";
```

- where variable is the variable name you have given to the object and range is the range of the emp blast.

- To stop the TFAR Jamming delete the object that was designated as the emp.

## Upcoming features

1) An TFAR jamming script that runs with the same variable as the emp.
2) A way to stop the jamming, etc after finding intel.

## Known Bugs

- Toolkits are not removed from the players inventories.
