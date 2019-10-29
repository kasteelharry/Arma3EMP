// by ALIAS

[obj_name,emp_range,visible_emp,affect_perception,damage_unit] execvm "AL_emp\emp_starter.sqf";

obj_name			- string, name of the object used as source for EMP
emp_range			- number, radius in meters of area affected by EMP
visible_emp			- boolean, if true the EMP will be visible
affect_perception	- boolean, if is true players vision will be affected for a half a minute or so
damage_unit			- number, if is higher than zero will be applied as damage on all units in range

============ EXAMPLE
[emp_me,500,true,true,0.1] execvm "AL_emp\emp_starter.sqf";