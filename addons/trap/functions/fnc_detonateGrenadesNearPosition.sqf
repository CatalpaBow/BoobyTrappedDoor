#include "script_component.hpp"

/*
	* Author: CatalpaBow
	* Detonate grenades near the specified position.
	*
	* Arguments:
	* 0: Position <OBJECT or PositionAGL or Position2D>
	* 1: Range of detection to search for grenades <NUMBER>
	* 
	* Return Value:
	* None
	*
	* Example:
	* [_pos,2] call btd_fnc_detonateGrenadesNearPosition
	*
	* Public: No
*/

params ["_pos","_rad"];

{
	if (_x isKindOf "Grenade") then {
		triggerAmmo _x;
		break;
	};
} forEach nearestObjects [_pos, [], _rad];
