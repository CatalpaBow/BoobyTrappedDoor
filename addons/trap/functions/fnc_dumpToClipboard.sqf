#include "script_component.hpp"
params[["_id",-1,[0]]];


if(_id == -1)then{
	copyToClipboard str(GVAR(trapInfoList));

} else {
	private _result = GVAR(trapInfoList) findIf {_x get "id" == _id};
	copyToClipboard str(GVAR(trapInfoList) select _result);
};
