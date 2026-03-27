#include "script_component.hpp"

/*
	* Author: CatalpaBow
	*
	* Searches for the door of the building specified by the first argument that is closest to the object specified by the second argument.
	* 
	* Arguments:
	* 0: building object <OBJECT>
	* 1: object used as the reference point for the search. <OBJECT>
	* 
	* Return Value:
	* Door animation name <STRING> 
	* if not found return empty string ""
	*
	* Example:
	* [_building,_object] call btd_trap_fnc_searchNearestDoor;
	* 
	* Public: No
*/

params["_building","_object","_searchRange"];

private _doorList = [_building] call FUNC(buildingDoorList);

_nearestDoor = "";
_minDist = 999;
{
	_doorName = _x;
	_doorPos = _y;
	_dist = _object distance _doorPos;

	if (_dist < _minDist) then {
		_minDist = _dist;
		_nearestDoor = _doorName;
	};
} forEach _doorList;

INFO(str(_minDist));
if(_minDist > _searchRange)then{
	_nearestDoor = "";
};
_nearestDoor;
