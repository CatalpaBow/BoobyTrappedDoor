#include "script_component.hpp"

/*
	* Author: CatalpaBow
	*
	* Function to register a booby trap attached to a door.
	* Place the example code into the initialization field of a trap object
	* positioned near the door in the Eden Editor to register it.
	*
	* Arguments:
	* 0: trapObject <OBJECT>
	*
	* Return Value:
	* None
	*
	* Example:
	* [this] call btd_trap_fnc_registerTrap
	*
	* Public: Yes
*/

params["_trapObj"];
GVAR(registeredTrapList) append [_trapObj];
