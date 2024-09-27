package blend

import "base:runtime"
import "core:fmt"
import "core:log"

import sapp "../../sokol/app"
import sg "../../sokol/gfx"
import sgp "../../sokol/gp"
import shelp "../../sokol/helpers"

State :: struct {
    ctx: runtime.Context,
}
state: State

_draw_3rects :: proc(brightness, alpha: f32) {
    sgp.set_color(brightness, 0, 0, alpha)
    sgp.draw_filled_rect(0, 0, 10, 10)
    sgp.set_color(0, brightness, 0, alpha)
    sgp.draw_filled_rect(0, 5, 10, 10)
    sgp.set_color(0, 0, brightness, alpha)
    sgp.draw_filled_rect(5, 2.5, 10, 10)
}

_draw_rects :: proc(ratio: f32) {
    sgp.project(0, 60 * ratio, 0, 60)
    sgp.set_color(1, 1, 1, 1)

    // none
    sgp.set_blend_mode(.NONE)
    sgp.push_transform()
    sgp.translate(10, 10)
    _draw_3rects(1, 1)
    sgp.pop_transform()

    // blend
    sgp.set_blend_mode(.BLEND)
    sgp.push_transform()
    sgp.translate(30, 10)
    _draw_3rects(1, 0.5)
    sgp.pop_transform()

    // add
    sgp.set_blend_mode(.ADD)
    sgp.push_transform()
    sgp.translate(50, 10)
    _draw_3rects(1, 1)
    sgp.pop_transform()

    // mod
    sgp.set_blend_mode(.MOD)
    sgp.push_transform()
    sgp.translate(10, 30)
    _draw_3rects(1, 1)
    sgp.pop_transform()

    // mul
    sgp.set_blend_mode(.MUL)
    sgp.push_transform()
    sgp.translate(30, 30)
    _draw_3rects(1, 1)
    sgp.pop_transform()
}

_draw_checkboard :: proc(width, height: i32) {
    sgp.set_color(0.2, 0.2, 0.2, 1.0)
    sgp.clear()
    sgp.set_color(0.4, 0.4, 0.4, 1.0)

    for y in 0..<(height/32 + 1) {
        for x in 0..<(width/32 + 1) {
            if (x + y) % 2 == 0 {
                sgp.draw_filled_rect(cast(f32)x * 32, cast(f32)y * 32, 32, 32)
            }
        }
    }

    sgp.reset_color()
}


init :: proc "c" () {
    context = state.ctx

    sg.setup(sg.Desc{
        environment = shelp.glue_environment(),
        logger = transmute(sg.Logger)shelp.logger(&state.ctx),
    })
    assert(sg.isvalid(), "Failed to creat Sokol GFX context :(")

    sgp.setup(sgp.Desc{})
    assert(sgp.is_valid(), fmt.tprintf("Failed to create Sokol GP context: "))
}

frame :: proc "c" () {
    context = state.ctx

    width := sapp.width()
    height := sapp.height()
    sgp.begin(width, height)

    _draw_checkboard(width, height)
    _draw_rects(sapp.widthf() / sapp.heightf())

    pass := sg.Pass{ swapchain = shelp.glue_swapchain() }
    sg.begin_pass(pass)
    sgp.flush()
    sgp.end()

    sg.end_pass()
    sg.commit()
}

cleanup :: proc "c" () {
    context = state.ctx

    sgp.shutdown()
    sg.shutdown()
}

main :: proc() {
    context.logger = log.create_console_logger()
    state.ctx = context

    sapp.run(sapp.Desc{
        init_cb = init,
        frame_cb = frame,
        cleanup_cb = cleanup,
        window_title = "Blend (Sokol GP Odin)",
        width = 1400,
        height = 800,
        logger = transmute(sapp.Logger)shelp.logger(&state.ctx),
    })
}
