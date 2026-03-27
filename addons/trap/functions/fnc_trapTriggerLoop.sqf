#include "script_component.hpp"

/* 
    * Author: CatalpaBow
    * Monitor trap conditions and activate trap when they are met.
    *
    * Arguments:
    * 0: _trapList <OBJECT>
    *
    * Return Value:
    * None
    * 
    * Example:
    * [_trapList] call btd_fnc_trapTriggerLoop
	*
	* Public: No
*/

params["_trapList"];

private _usedTrap = [];

while{true} do{
	{	
		private _usedTrap = [];
		_trapInfo = _x;
		_trap = _trapInfo get "trapObject";
		_building = _trapInfo get "doorBuilding";
		_door = _trapInfo get "doorObject";

		if(isNull _trap)then{
			_usedTrap append [_trap];
			continue;
		};
		
		_doorOpenness = _building animationPhase _door;
		_trapActiveThreshold = 0.1;
		if(_doorOpenness > _trapActiveThreshold) then { 
			_trap setDamage 1; // Detonate trap.
	
			if(_trap isKindOf "taro_tripwire_Ammo" and GVAR(instantaneousFuze))then{	
				[_trapInfo get "position" ,GVAR(instantaneousFuzeDelay)] call FUNC(forceDetonateTrapGrenade);
			};
		};
		
	} forEach _trapList;
	
	{
		private _i = _trapList find _x;
		_trapList deleteAt _i;
	} forEach _usedTrap;
	_usedTrap resize 0;
	
	sleep 0.2;

};
