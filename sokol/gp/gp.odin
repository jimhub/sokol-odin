package sokol_gp_odin
import sg "../gfx"

import "core:c"

SOKOL_DEBUG :: #config(SOKOL_DEBUG, ODIN_DEBUG)

DEBUG :: #config(SOKOL_GL_DEBUG, SOKOL_DEBUG)
USE_GL :: #config(SOKOL_USE_GL, false)
USE_DLL :: #config(SOKOL_DLL, false)



/* sokol_gp depends directly on the _implementation_ of sokol_gfx, so it's been lumped in with the gfx lib */

when ODIN_OS == .Windows {
    when USE_DLL {
        when USE_GL {
            when DEBUG { foreign import sokol_gfx_clib { "../sokol_dll_windows_x64_gl_debug.lib" } }
            else       { foreign import sokol_gfx_clib { "../sokol_dll_windows_x64_gl_release.lib" } }
        } else {
            when DEBUG { foreign import sokol_gfx_clib { "../sokol_dll_windows_x64_d3d11_debug.lib" } }
            else       { foreign import sokol_gfx_clib { "../sokol_dll_windows_x64_d3d11_release.lib" } }
        }
    } else {
        when USE_GL {
            when DEBUG { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_windows_x64_gl_debug.lib" } }
            else       { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_windows_x64_gl_release.lib" } }
        } else {
            when DEBUG { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_windows_x64_d3d11_debug.lib" } }
            else       { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_windows_x64_d3d11_release.lib" } }
        }
    }
} else when ODIN_OS == .Darwin {
    when USE_DLL {
             when  USE_GL && ODIN_ARCH == .arm64 &&  DEBUG { foreign import sokol_gfx_clib { "../dylib/sokol_dylib_macos_arm64_gl_debug.dylib" } }
        else when  USE_GL && ODIN_ARCH == .arm64 && !DEBUG { foreign import sokol_gfx_clib { "../dylib/sokol_dylib_macos_arm64_gl_release.dylib" } }
        else when  USE_GL && ODIN_ARCH == .amd64 &&  DEBUG { foreign import sokol_gfx_clib { "../dylib/sokol_dylib_macos_x64_gl_debug.dylib" } }
        else when  USE_GL && ODIN_ARCH == .amd64 && !DEBUG { foreign import sokol_gfx_clib { "../dylib/sokol_dylib_macos_x64_gl_release.dylib" } }
        else when !USE_GL && ODIN_ARCH == .arm64 &&  DEBUG { foreign import sokol_gfx_clib { "../dylib/sokol_dylib_macos_arm64_metal_debug.dylib" } }
        else when !USE_GL && ODIN_ARCH == .arm64 && !DEBUG { foreign import sokol_gfx_clib { "../dylib/sokol_dylib_macos_arm64_metal_release.dylib" } }
        else when !USE_GL && ODIN_ARCH == .amd64 &&  DEBUG { foreign import sokol_gfx_clib { "../dylib/sokol_dylib_macos_x64_metal_debug.dylib" } }
        else when !USE_GL && ODIN_ARCH == .amd64 && !DEBUG { foreign import sokol_gfx_clib { "../dylib/sokol_dylib_macos_x64_metal_release.dylib" } }
    } else {
        when USE_GL {
            when ODIN_ARCH == .arm64 {
                when DEBUG { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_macos_arm64_gl_debug.a", "system:Cocoa.framework","system:QuartzCore.framework","system:OpenGL.framework" } }
                else       { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_macos_arm64_gl_release.a", "system:Cocoa.framework","system:QuartzCore.framework","system:OpenGL.framework" } }
            } else {
                when DEBUG { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_macos_x64_gl_debug.a", "system:Cocoa.framework","system:QuartzCore.framework","system:OpenGL.framework" } }
                else       { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_macos_x64_gl_release.a", "system:Cocoa.framework","system:QuartzCore.framework","system:OpenGL.framework" } }
            }
        } else {
            when ODIN_ARCH == .arm64 {
                when DEBUG { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_macos_arm64_metal_debug.a", "system:Cocoa.framework","system:QuartzCore.framework","system:Metal.framework","system:MetalKit.framework" } }
                else       { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_macos_arm64_metal_release.a", "system:Cocoa.framework","system:QuartzCore.framework","system:Metal.framework","system:MetalKit.framework" } }
            } else {
                when DEBUG { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_macos_x64_metal_debug.a", "system:Cocoa.framework","system:QuartzCore.framework","system:Metal.framework","system:MetalKit.framework" } }
                else       { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_macos_x64_metal_release.a", "system:Cocoa.framework","system:QuartzCore.framework","system:Metal.framework","system:MetalKit.framework" } }
            }
        }
    }
} else when ODIN_OS == .Linux {
    when DEBUG { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_linux_x64_gl_debug.a", "system:GL", "system:dl", "system:pthread" } }
    else       { foreign import sokol_gfx_clib { "../gfx/sokol_gfx_linux_x64_gl_release.a", "system:GL", "system:dl", "system:pthread" } }
} else {
    #panic("This OS is currently not supported")
}


Blend_Mode :: enum i32 {
    NONE = 0, /* No blending.
                               dstRGBA = srcRGBA */
    BLEND,    /* Alpha blending.
                               dstRGB = (srcRGB * srcA) + (dstRGB * (1-srcA))
                               dstA = srcA + (dstA * (1-srcA)) */
    ADD,      /* Color add.
                               dstRGB = (srcRGB * srcA) + dstRGB
                               dstA = dstA */
    MOD,      /* Color modulate.
                               dstRGB = srcRGB * dstRGB
                               dstA = dstA */
    MUL,      /* Color multiply.
                               dstRGB = (srcRGB * dstRGB) + (dstRGB * (1-srcA))
                               dstA = (srcA * dstA) + (dstA * (1-srcA)) */
    NUM
}

TextureSlots :: 4
UniformContentSlots :: 4

Color :: [4]c.float
Color_UB4 :: [4]c.uint8_t

Vec2 :: [2]c.float
Point :: Vec2

Line :: struct {
    a: Point,
    c: Point,
}

IRect :: struct {
    x: c.int,
    y: c.int,
    w: c.int,
    h: c.int,
}

ISize :: struct {
    w: c.int,
    h: c.int,
}

Mat2x3 :: [2][3]c.float

Rect :: struct {
    x: c.float,
    y: c.float,
    w: c.float,
    h: c.float,
}

TexturedRect :: struct {
    dst: Rect,
    src: Rect,
}

Triangle :: struct {
    a: Point,
    b: Point,
    c: Point,
}

Vertex :: struct {
    position: Vec2,
    texcoord: Vec2,
    color: Color_UB4,
}



Desc :: struct {
    max_vertices: c.uint32_t,
    max_commands: c.uint32_t,
    color_format: sg.Pixel_Format,
    depth_format: sg.Pixel_Format,
    sample_count: c.int,
}

Error :: enum i32 {
    NO_ERROR = 0,
    ERROR_SOKOL_INVALID,
    ERROR_VERTICES_FULL,
    ERROR_UNIFORMS_FULL,
    ERROR_COMMANDS_FULL,
    ERROR_VERTICES_OVERFLOW,
    ERROR_TRANSFORM_STACK_OVERFLOW,
    ERROR_TRANSFORM_STACK_UNDERFLOW,
    ERROR_STATE_STACK_OVERFLOW,
    ERROR_STATE_STACK_UNDERFLOW,
    ERROR_ALLOC_FAILED,
    ERROR_MAKE_VERTEX_BUFFER_FAILED,
    ERROR_MAKE_WHITE_IMAGE_FAILED,
    ERROR_MAKE_NEAREST_SAMPLER_FAILED,
    ERROR_MAKE_COMMON_SHADER_FAILED,
    ERROR_MAKE_COMMON_PIPELINE_FAILED,
}


Pipeline_Desc :: struct {
    shader: sg.Shader,                   /* Sokol shader. */
    primitive_type: sg.Primitive_Type,   /* Draw primitive type (triangles, lines, points, etc). Default is triangles. */
    blend_mode: Blend_Mode,           /* Color blend mode. Default is no blend. */
    color_format: sg.Pixel_Format,       /* Color format, defaults to the value used when creating Sokol GP context. */
    depth_format: sg.Pixel_Format,       /* Depth format, defaults to the value used when creating Sokol GP context. */
    sample_count: c.int,              /* Sample count, defaults to the value used when creating Sokol GP context. */
    has_vs_color: c.bool,             /* If true, the current color state will be passed as an attribute to the vertex shader. */
}

Textures_Uniform :: struct {
    count: c.uint32_t,
    images: [TextureSlots]sg.Image,
    samplers: [TextureSlots]sg.Sampler,
}

Uniform :: struct {
    size: c.uint32_t,
    content: [UniformContentSlots]c.float,
}

State :: struct {
    frame_size: ISize,
    viewport: IRect,
    scissor: IRect,
    proj: Mat2x3,
    transform: Mat2x3,
    mvp: Mat2x3,
    thickness: c.float,
    color: Color_UB4,
    textures: Textures_Uniform,
    uniform: Uniform,
    blend_mode: Blend_Mode,
    pipeline: sg.Pipeline,
    _base_vertex: c.uint32_t,
    _base_uniform: c.uint32_t,
    _base_command: c.uint32_t,
}

@(default_calling_convention="c", link_prefix="sgp_")
foreign sokol_gfx_clib
{
    /* Initialization and de-initialization. */
    setup :: proc(#by_ptr desc: Desc) ---
    shutdown :: proc() ---
    is_valid :: proc() -> c.bool ---

    /* Error handling. */
    get_last_error :: proc() -> Error ---
    get_error_message :: proc(error: Error) -> cstring ---

    /* Custom pipeline creation. */
    make_pipeline :: proc(#by_ptr desc: Pipeline_Desc) -> sg.Pipeline ---

    /* Draw command queue management. */
    begin :: proc(width, height: c.int) ---
    flush :: proc() ---
    end :: proc() ---

    /* 2D coordinate space projection */
    project :: proc(left, right, top, bottom: c.float) ---
    reset_project :: proc() ---

    /* 2D coordinate space transformation. */
    push_transform :: proc() ---
    pop_transform :: proc() ---
    reset_transform :: proc() ---
    translate :: proc(x, y: c.float) ---
    rotate :: proc(theta: c.float) ---
    rotate_at :: proc(theta, x, y: c.float) ---
    scale :: proc(sx, sy: c.float) ---
    scale_at :: proc(sx, sy, x, y: c.float) ---

    /* State change for custom pipelines. */
    set_pipeline :: proc(pipeline: sg.Pipeline) ---
    reset_pipeline :: proc() ---
    set_uniform :: proc(data: rawptr, size: c.uint32_t) ---
    reset_uniform :: proc() ---

    /* State change functions for the common pipelines. */
    set_blend_mode :: proc(blend_mode: Blend_Mode) ---
    reset_blend_mode :: proc() ---
    set_color :: proc(r, g, b, a: c.float) ---
    reset_color :: proc() ---
    set_image :: proc(channel: c.int, image: sg.Image) ---
    unset_image :: proc(channel: c.int) ---
    reset_image :: proc(channel: c.int) ---
    set_sampler :: proc(channel: c.int, sampler: sg.Sampler) ---
    reset_sampler :: proc(channel: c.int) ---

    /* State change functions for all pipelines. */
    viewport :: proc(x, y, w, h: c.int) ---
    reset_viewport :: proc() ---
    scissor :: proc(x, y, w, h: c.int) ---
    reset_scissor :: proc() ---
    reset_state :: proc() ---

    /* Drawing functions. */
    clear :: proc() ---
    draw :: proc(primitive_type: sg.Primitive_Type, vertices: [^]Vertex, count: c.uint32_t) ---
    draw_points :: proc(points: [^]Point, count: c.uint32_t) ---
    draw_point :: proc(x, y: c.float) ---
    draw_lines :: proc(lines: [^]Line, count: c.uint32_t) ---
    draw_line :: proc(ax, ay, bx, by: c.float) ---
    draw_lines_strip :: proc(points: [^]Point, count: c.uint32_t) ---
    draw_filled_triangles :: proc(triangles: [^]Triangle, count: c.uint32_t) ---
    draw_filled_trangle :: proc(ax, ay, bx, by, cx, cy: c.float) ---
    draw_filled_triangles_strip :: proc(points: [^]Point, count: c.uint32_t) ---
    draw_filled_rects :: proc(rects: [^]Rect, count: c.uint32_t) ---
    draw_filled_rect :: proc(x, y, w, h: c.float) ---
    draw_textured_rects :: proc(channel: c.int, rects: [^]TexturedRect, count: c.uint32_t) ---
    draw_textured_rect :: proc(channel: c.int, dest_rect: Rect, src_rect: Rect) ---

    /* Querying functions. */
    query_state :: proc() -> ^State ---
    query_desc :: proc() -> Desc ---
}
