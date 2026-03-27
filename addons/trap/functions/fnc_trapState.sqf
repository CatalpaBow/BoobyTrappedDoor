#include "script_component.hpp"
/*
	* Author: CatalpaBow
	* Retrun trap statement.
	* 
	* Arguments:
	* 0: trapInfo <HASHMAP(TrapInfo)>
	* 
	* Return Value:
	* statement <STRING> 
	*
	* Example:
	* [_traipInfo] call btd_trap_fnc_trapState;
	* 
	* Public: No
*/
params["_trapInfo"];

if(_trapInfo get "doorObject" == "")exitWith{
	"DoorNotDeceted";
};
if(not (_trapInfo get "isSpawn"))exitWith{
	"NotSpawn";
};
if(isNull (_trapInfo get "trapObject"))exitWith{
	"Used";
};
"Active";
