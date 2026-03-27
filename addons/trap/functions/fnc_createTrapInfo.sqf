#include "script_component.hpp"

/* 
    * Author: CatalpaBow
    * Factory method to create TrapInfo HashMap.
    *
    * Arguments:
    * 0: trapObject <OBJECT>
    * 1: spawnRate <NUMBER> Precondition [0 <= x < =1]
    * 
	* Return Value:
    * trapInfo <HASHMAP>
    * 	id:<NUMBER>
    *	trapObject:<OBJECT>
	*	position:<PositionAGLS>
    *   doorBuilding:<OBJECT>
	*	doorObject:<STRING>
	*	isSpawn:<BOOL>
	* 
	* Example:
	* [_trapObject,0.8] call btd_fnc_createTrapInfo
	* 
	* Public: No
*/

params["_trapObject","_spawnRate"];

GVAR(trapInfoIDCounter) = GVAR(trapInfoIDCounter) + 1;
private _newID = GVAR(trapInfoIDCounter);
private _doorDataArray = [_trapObject] call FUNC(findDoorFromTrap);
private _doorBuilding = _doorDataArray select 0;
private _doorObject = _doorDataArray select 1;
private _isSpawn = random 1 < _spawnRate;

private _trapInfo = createHashMap;
_trapInfo set ["id",_newID];
_trapInfo set ["trapObject",_trapObject];
_trapInfo set ["position",getPos _trapObject];
_trapInfo set ["doorBuilding",_doorBuilding];
_trapInfo set ["doorObject",_doorObject];
_trapInfo set ["isSpawn",_isSpawn];

_trapInfo;
