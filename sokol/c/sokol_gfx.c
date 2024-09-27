#if defined(IMPL)
#define SOKOL_GFX_IMPL
#define SOKOL_GP_IMPL
#endif
#include "sokol_defines.h"
#include "sokol_gfx.h"

/* sokol_gp depends directly on the _implementation_ of sokol_gfx, so it's being lumped in with the gfx lib */
#include "sokol_gp.h"
