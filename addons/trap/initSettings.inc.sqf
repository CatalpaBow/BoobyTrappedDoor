[
    QGVAR(instantaneousFuze),
    "CHECKBOX",
    [LSTRING(InstantaneousFuze), LSTRING(InstantaneousFuze_Description)],
    [LSTRING(DisplayName),LSTRING(DefaultSetting)],
    true,
	1
] call CBA_fnc_addSetting;

[
    QGVAR(instantaneousFuzeDelay),
    "SLIDER",
    [LSTRING(InstantaneousFuzeDelay), LSTRING(InstantaneousFuzeDelay_Description)],
    [LSTRING(DisplayName),LSTRING(DefaultSetting)],
    [0,4,0.5,0],
	1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnRate),
    "SLIDER",
    [LSTRING(SpawnRate), LSTRING(SpawnRate_Description)],
    [LSTRING(DisplayName),LSTRING(DefaultSetting)],
    [0,1,1,0,true],
	1
] call CBA_fnc_addSetting;

[
    QGVAR(doorAnimationIncludeList),
    "EDITBOX",
    [LSTRING(DoorAnimationIncludeList),LSTRING(DoorAnimationIncludeList_Description)],
    [LSTRING(DisplayName),LSTRING(DoorDetection)],
    '["door","dvere"]',
    1

] call CBA_fnc_addSetting;

[
    QGVAR(doorAnimationExcludeList),
    "EDITBOX",
    [LSTRING(DoorAnimationExcludeList),LSTRING(DoorAnimationExcludeList_Description)],
    [LSTRING(DisplayName),LSTRING(DoorDetection)],
    '["locked"]',
    1

] call CBA_fnc_addSetting;
[
    QGVAR(isDrawDebugInfo),
    "CHECKBOX",
    [LSTRING(ShowErroredTrap), LSTRING(ShowErroredTrap_Description)],
    [LSTRING(DisplayName),LSTRING(Debug)],
    false,
	false
] call CBA_fnc_addSetting;



