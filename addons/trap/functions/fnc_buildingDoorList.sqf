#include "script_component.hpp"

/* 
    * Author: CatalpaBow
    * Returns a list of doors and their positions within the building.
    *
    * Arguments:
    * 0: building object <OBJECT>
    *
    * Return Value:
    * doorAnimPosMap <HASHMAP>
    * 	key: doorAnimationName <STRING>
    * 	value:doorPosition <PositionAGL>
    * 
    * Example:
    * [_building] call btd_fnc_buildingDoorList
    *
    * Public: No
*/

params["_building"];

// OPTIMIZE: Cache found doorAnimation names in building object.
_doorAnimNames = (animationNames _building) select { 
    private _animName = _x;
    private _isFound = false;
    private _includeList = parseSimpleArray GVAR(doorAnimationIncludeList); 
    private _excludeList = parseSimpleArray GVAR(doorAnimationExcludeList);
    
    {
        private _isInclude = _animName find _x >= 0;
        private _isExcluded = false;
        {
            if (_animName find _x >= 0) then {
                _isExcluded = true;
                break;
            };
        }forEach _excludeList;


        if(_isInclude and {not _isExcluded})then{
            _isFound = true;
            break;
        };
    }forEach _includeList; 

    _isFound;
};
_doorPositions = _doorAnimNames apply {
    _building modelToWorld (_building selectionPosition _x)
};
_doorAnimPosMap = _doorAnimNames createHashMapFromArray _doorPositions;
_doorAnimPosMap;
