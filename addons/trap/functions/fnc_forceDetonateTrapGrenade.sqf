#include "script_component.hpp"

/*
	* Author: CatalpaBow
	* Detonate the grenade after the delay time has passed.
	*
	* Arguments:
	* 0: trap object <OBJECT>
	* 1: delay time of detonation <NUMBER>
	*
	* Return Value:
	* None
	*
	* Example:
	* [_trap,0.5] call btd_trap_fnc_forceDetonateTrapGrenade;
	*
	* Public: No
*/

params ["_trap","_delayTime"];

_this spawn {
	params["_trapPos","_delayTime"];
	sleep _delayTime; 
	[_trapPos,2] call FUNC(detonateGrenadesNearPosition);
};
