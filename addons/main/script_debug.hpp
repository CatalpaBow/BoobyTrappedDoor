/**
Fast Recompiling via function
**/
//#define DISABLE_COMPILE_CACHE
// To Use: [] call btd_PREP_RECOMPILE;

#ifdef DISABLE_COMPILE_CACHE
    #define LINKFUNC(x) {_this call FUNC(x)}
    #define PREP_RECOMPILE_START    if (isNil "BTD_PREP_RECOMPILE") then {BTD_RECOMPILES = []; BTD_PREP_RECOMPILE = {{call _x} forEach BTD_RECOMPILES;}}; private _recomp = {
    #define PREP_RECOMPILE_END      }; call _recomp; BTD_RECOMPILES pushBack _recomp;
#else
    #define LINKFUNC(x) FUNC(x)
    #define PREP_RECOMPILE_START ; /* disabled */
    #define PREP_RECOMPILE_END ; /* disabled */
#endif
