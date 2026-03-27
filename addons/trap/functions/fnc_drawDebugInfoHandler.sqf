#include "script_component.hpp"

/* 
    * Author: CatalpaBow
	* Called from Draw3D event.
	* 
    * Arguments:
    * 0: trapInfoList <ARRAY>
    * 
    * Return Value:
	* None
    * 
	* Example:
	* addMissionEventHandler [
	*	"Draw3D", 
	*	btd_fnc_drawDebugInfoHandler,
	*	[_trapInfoList]
	* ];
	*
	* Public: No
*/

_trapInfoList = _thisArgs select 0;

if(not GVAR(isDebugMode))exitWith{};
{
	private _trapInfo = _x;
	private _titleText = "";
	private _buldingName = format ["BuildingClass: '%1'",typeOf (_trapInfo get "doorBuilding")];
	private _doorAnimName = format ["DoorAnimationName: '%1'",_trapInfo get "doorObject"];
	private _color = [1,1,1,1];
	private _pos = _trapInfo get "position";
	
	private _dist = positionCameraToWorld [0,0,0] distance _pos;
	private _dynamicOffset = 0.05 + (_dist * 0.02);
	private _camPos = positionCameraToWorld [0,0,0];
	private _camDownDir = (positionCameraToWorld [0,-1,0]) vectorDiff _camPos;
	private _dynamicOffsetVec = _camDownDir vectorMultiply _dynamicOffset;


	dbg_state = [_trapInfo] call FUNC(trapState);
	switch ([_trapInfo] call FUNC(trapState))do {
		case "NotSpawn":{
			_titleText = "NotSpawn";
			_color = [1,1,0,1];
		};
		
		case "DoorNotDeceted":{
			_titleText = "Door not deceted";
			_color = [1,0,0,1];
		};

		case "Used":{
			_titleText = "Used";
			_color = [0.05,0.05,0.05,1];
		};

		case "Active":{
			_titleText = "Active";
			_color = [0,1,0,1];
		};
	};
	drawIcon3D [
		"\A3\ui_f\data\map\markers\military\dot_ca.paa",
		_color,
		_pos,
		1,
		1,
		0,
		_titleText,
		1,
		0.04
	];
	
	/* 
	 * Note: I want to render a line to visualize which building a door belongs to once it's identified as trapped, but since DrawLine doesn't render on top of everything, it gets occluded by obstacles.
	private _buildingPos = getPos (_trapInfo get "doorBuilding");
	drawLine3D[_pos,_buildingPos,_color,30];
	 */

	if(_dist > 100)then{
		continue;
	};
	drawIcon3D [
		"",
		_color,
		_pos vectorAdd (_dynamicOffsetVec vectorMultiply 1),
		1,
		1,
		0,
		_buldingName,
		1,
		0.04
	];
	drawIcon3D [
		"",
		_color,
		_pos vectorAdd (_dynamicOffsetVec vectorMultiply 2),
		1,
		1,
		0,
		_doorAnimName,
		1,
		0.04
	];
	
	
}forEach (_trapInfoList);
