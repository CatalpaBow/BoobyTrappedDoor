#include "script_component.hpp"

/* 
    * Author: CatalpaBow
	* Finds the door for trap placement.
	* 
    * Arguments:
    * 0: trapInfoList <ARRAY>
    * 
    * Return Value:
	* doorData <ARRAY>
	* 	0: building <OBJECT>
	*	1: door(animaitonName) <STRING>
    * 
    * Example 
    * [_trap] call btd_trap_fnc_findDoorFromTrap; 
    *
    * Public: No
*/

params["_trap"];

private _building = nearestBuilding _trap;
private _door = [_building,_trap,5] call FUNC(searchNearestDoor);

private _doorData = [];
_doorData pushBack _building;
_doorData pushBack _door;

_doorData;
