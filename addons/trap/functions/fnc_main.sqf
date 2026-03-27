#include "script_component.hpp"

/*
	* Author: CatalpaBow
	* The entry point of booby trap system.
	* This function is called from XEH_postInit.
	* 
	* Arguments:
	* None
	* 
	* Return Value:
	* None
	*
	* Example:
	* [] call btd_trap_fnc_main;
	* 
	* Public: No
*/

GVAR(trapInfoList) = GVAR(registeredTrapList) apply {[_x,GVAR(spawnRate)] call FUNC(createTrapInfo)};
private _activeTrapList = [];
{
	private _trapInfo = _x;
	private _trapObject = _trapInfo get "trapObject";

	if(_trapInfo get "doorObject" == "")then{
		deleteVehicle _trapObject;
		GVAR(erroredTrapList) pushBack _trapInfo;
	};

	if(not (_trapInfo get "isSpawn"))then{
		deleteVehicle _trapObject;
	};

	if(isNull _trapObject)then{	
		continue;
	};
	_activeTrapList pushBack _trapInfo;

}forEach GVAR(trapInfoList);

[_activeTrapList] spawn FUNC(trapTriggerLoop);

addMissionEventHandler [
	"Draw3D", 
	FUNC(drawDebugInfoHandler),
	[GVAR(trapInfoList)]
];
