package main
import sg "../../sokol/gfx"
import m "../math"
/*
    #version:1# (machine generated, don't edit!)

    Generated by sokol-shdc (https://github.com/floooh/sokol-tools)

    Cmdline:
        sokol-shdc -i examples/vertexpull/shader.glsl -o examples/vertexpull/shader.odin -l glsl430:metal_macos:hlsl5 -f sokol_odin

    Overview:
    =========
    Shader program: 'vertexpull':
        Get shader desc: vertexpull_shader_desc(sg.query_backend())
        Vertex Shader: vs
        Fragment Shader: fs
        Attributes:
    Bindings:
        Uniform block 'vs_params':
            Odin struct: Vs_Params
            Bind slot: UB_vs_params => 0
        Storage buffer 'ssbo':
            Odin struct: Sb_Vertex
            Bind slot: SBUF_ssbo => 0
            Readonly: true
*/
UB_vs_params :: 0
SBUF_ssbo :: 0
Vs_Params :: struct #align(16) {
    using _: struct #packed {
        mvp: m.mat4,
    },
}
Sb_Vertex :: struct #align(16) {
    using _: struct #packed {
        pos: [3]f32,
        _: [4]u8,
        color: [4]f32,
    },
}
/*
    #version 430

    struct sb_vertex
    {
        vec3 pos;
        vec4 color;
    };

    uniform vec4 vs_params[4];
    layout(binding = 0, std430) readonly buffer ssbo
    {
        sb_vertex vtx[];
    } _28;

    layout(location = 0) out vec4 color;

    void main()
    {
        gl_Position = mat4(vs_params[0], vs_params[1], vs_params[2], vs_params[3]) * vec4(_28.vtx[gl_VertexID].pos, 1.0);
        color = _28.vtx[gl_VertexID].color;
    }

*/
@(private="file")
vs_source_glsl430 := [388]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x34,0x33,0x30,0x0a,0x0a,0x73,0x74,
    0x72,0x75,0x63,0x74,0x20,0x73,0x62,0x5f,0x76,0x65,0x72,0x74,0x65,0x78,0x0a,0x7b,
    0x0a,0x20,0x20,0x20,0x20,0x76,0x65,0x63,0x33,0x20,0x70,0x6f,0x73,0x3b,0x0a,0x20,
    0x20,0x20,0x20,0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x7d,
    0x3b,0x0a,0x0a,0x75,0x6e,0x69,0x66,0x6f,0x72,0x6d,0x20,0x76,0x65,0x63,0x34,0x20,
    0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x5b,0x34,0x5d,0x3b,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x62,0x69,0x6e,0x64,0x69,0x6e,0x67,0x20,0x3d,0x20,0x30,
    0x2c,0x20,0x73,0x74,0x64,0x34,0x33,0x30,0x29,0x20,0x72,0x65,0x61,0x64,0x6f,0x6e,
    0x6c,0x79,0x20,0x62,0x75,0x66,0x66,0x65,0x72,0x20,0x73,0x73,0x62,0x6f,0x0a,0x7b,
    0x0a,0x20,0x20,0x20,0x20,0x73,0x62,0x5f,0x76,0x65,0x72,0x74,0x65,0x78,0x20,0x76,
    0x74,0x78,0x5b,0x5d,0x3b,0x0a,0x7d,0x20,0x5f,0x32,0x38,0x3b,0x0a,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,
    0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,
    0x7b,0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x20,0x3d,0x20,0x6d,0x61,0x74,0x34,0x28,0x76,0x73,0x5f,0x70,0x61,0x72,0x61,
    0x6d,0x73,0x5b,0x30,0x5d,0x2c,0x20,0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,
    0x5b,0x31,0x5d,0x2c,0x20,0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x5b,0x32,
    0x5d,0x2c,0x20,0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x5b,0x33,0x5d,0x29,
    0x20,0x2a,0x20,0x76,0x65,0x63,0x34,0x28,0x5f,0x32,0x38,0x2e,0x76,0x74,0x78,0x5b,
    0x67,0x6c,0x5f,0x56,0x65,0x72,0x74,0x65,0x78,0x49,0x44,0x5d,0x2e,0x70,0x6f,0x73,
    0x2c,0x20,0x31,0x2e,0x30,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x20,0x3d,0x20,0x5f,0x32,0x38,0x2e,0x76,0x74,0x78,0x5b,0x67,0x6c,0x5f,0x56,
    0x65,0x72,0x74,0x65,0x78,0x49,0x44,0x5d,0x2e,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,
    0x7d,0x0a,0x0a,0x00,
}
/*
    #version 430

    layout(location = 0) out vec4 frag_color;
    layout(location = 0) in vec4 color;

    void main()
    {
        frag_color = color;
    }

*/
@(private="file")
fs_source_glsl430 := [135]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x34,0x33,0x30,0x0a,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,
    0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x66,0x72,0x61,0x67,
    0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,
    0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x30,0x29,0x20,0x69,0x6e,0x20,
    0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x0a,0x76,0x6f,0x69,
    0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
}
/*
    struct sb_vertex
    {
        float3 pos;
        float4 color;
    };

    cbuffer vs_params : register(b0)
    {
        row_major float4x4 _19_mvp : packoffset(c0);
    };

    ByteAddressBuffer _28 : register(t16);

    static float4 gl_Position;
    static int gl_VertexIndex;
    static float4 color;

    struct SPIRV_Cross_Input
    {
        uint gl_VertexIndex : SV_VertexID;
    };

    struct SPIRV_Cross_Output
    {
        float4 color : TEXCOORD0;
        float4 gl_Position : SV_Position;
    };

    void vert_main()
    {
        gl_Position = mul(float4(asfloat(_28.Load3(gl_VertexIndex * 32 + 0)), 1.0f), _19_mvp);
        color = asfloat(_28.Load4(gl_VertexIndex * 32 + 16));
    }

    SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
    {
        gl_VertexIndex = int(stage_input.gl_VertexIndex);
        vert_main();
        SPIRV_Cross_Output stage_output;
        stage_output.gl_Position = gl_Position;
        stage_output.color = color;
        return stage_output;
    }
*/
@(private="file")
vs_source_hlsl5 := [871]u8 {
    0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x73,0x62,0x5f,0x76,0x65,0x72,0x74,0x65,0x78,
    0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,0x20,0x70,0x6f,
    0x73,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,
    0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x63,0x62,0x75,0x66,0x66,0x65,0x72,
    0x20,0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x20,0x3a,0x20,0x72,0x65,0x67,
    0x69,0x73,0x74,0x65,0x72,0x28,0x62,0x30,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,
    0x72,0x6f,0x77,0x5f,0x6d,0x61,0x6a,0x6f,0x72,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,
    0x78,0x34,0x20,0x5f,0x31,0x39,0x5f,0x6d,0x76,0x70,0x20,0x3a,0x20,0x70,0x61,0x63,
    0x6b,0x6f,0x66,0x66,0x73,0x65,0x74,0x28,0x63,0x30,0x29,0x3b,0x0a,0x7d,0x3b,0x0a,
    0x0a,0x42,0x79,0x74,0x65,0x41,0x64,0x64,0x72,0x65,0x73,0x73,0x42,0x75,0x66,0x66,
    0x65,0x72,0x20,0x5f,0x32,0x38,0x20,0x3a,0x20,0x72,0x65,0x67,0x69,0x73,0x74,0x65,
    0x72,0x28,0x74,0x31,0x36,0x29,0x3b,0x0a,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,
    0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,
    0x6f,0x6e,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x69,0x6e,0x74,0x20,0x67,
    0x6c,0x5f,0x56,0x65,0x72,0x74,0x65,0x78,0x49,0x6e,0x64,0x65,0x78,0x3b,0x0a,0x73,
    0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,
    0x6f,0x72,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,
    0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x0a,0x7b,0x0a,
    0x20,0x20,0x20,0x20,0x75,0x69,0x6e,0x74,0x20,0x67,0x6c,0x5f,0x56,0x65,0x72,0x74,
    0x65,0x78,0x49,0x6e,0x64,0x65,0x78,0x20,0x3a,0x20,0x53,0x56,0x5f,0x56,0x65,0x72,
    0x74,0x65,0x78,0x49,0x44,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,
    0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,
    0x74,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,
    0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,
    0x52,0x44,0x30,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,
    0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3a,0x20,0x53,0x56,
    0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x76,
    0x6f,0x69,0x64,0x20,0x76,0x65,0x72,0x74,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,
    0x7b,0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x20,0x3d,0x20,0x6d,0x75,0x6c,0x28,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,0x61,
    0x73,0x66,0x6c,0x6f,0x61,0x74,0x28,0x5f,0x32,0x38,0x2e,0x4c,0x6f,0x61,0x64,0x33,
    0x28,0x67,0x6c,0x5f,0x56,0x65,0x72,0x74,0x65,0x78,0x49,0x6e,0x64,0x65,0x78,0x20,
    0x2a,0x20,0x33,0x32,0x20,0x2b,0x20,0x30,0x29,0x29,0x2c,0x20,0x31,0x2e,0x30,0x66,
    0x29,0x2c,0x20,0x5f,0x31,0x39,0x5f,0x6d,0x76,0x70,0x29,0x3b,0x0a,0x20,0x20,0x20,
    0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x61,0x73,0x66,0x6c,0x6f,0x61,0x74,
    0x28,0x5f,0x32,0x38,0x2e,0x4c,0x6f,0x61,0x64,0x34,0x28,0x67,0x6c,0x5f,0x56,0x65,
    0x72,0x74,0x65,0x78,0x49,0x6e,0x64,0x65,0x78,0x20,0x2a,0x20,0x33,0x32,0x20,0x2b,
    0x20,0x31,0x36,0x29,0x29,0x3b,0x0a,0x7d,0x0a,0x0a,0x53,0x50,0x49,0x52,0x56,0x5f,
    0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x6d,0x61,0x69,
    0x6e,0x28,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,
    0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x29,
    0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,0x5f,0x56,0x65,0x72,0x74,0x65,0x78,
    0x49,0x6e,0x64,0x65,0x78,0x20,0x3d,0x20,0x69,0x6e,0x74,0x28,0x73,0x74,0x61,0x67,
    0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,0x67,0x6c,0x5f,0x56,0x65,0x72,0x74,0x65,
    0x78,0x49,0x6e,0x64,0x65,0x78,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x76,0x65,0x72,
    0x74,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x53,0x50,
    0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,
    0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x20,
    0x20,0x20,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,
    0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x67,0x6c,
    0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,
    0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x63,0x6f,0x6c,0x6f,
    0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,
    0x65,0x74,0x75,0x72,0x6e,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,
    0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x00,
}
/*
    static float4 frag_color;
    static float4 color;

    struct SPIRV_Cross_Input
    {
        float4 color : TEXCOORD0;
    };

    struct SPIRV_Cross_Output
    {
        float4 frag_color : SV_Target0;
    };

    void frag_main()
    {
        frag_color = color;
    }

    SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
    {
        color = stage_input.color;
        frag_main();
        SPIRV_Cross_Output stage_output;
        stage_output.frag_color = frag_color;
        return stage_output;
    }
*/
@(private="file")
fs_source_hlsl5 := [435]u8 {
    0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x66,0x72,
    0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x0a,
    0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,
    0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,0x54,0x45,
    0x58,0x43,0x4f,0x4f,0x52,0x44,0x30,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,
    0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,
    0x4f,0x75,0x74,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,
    0x61,0x74,0x34,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,
    0x20,0x53,0x56,0x5f,0x54,0x61,0x72,0x67,0x65,0x74,0x30,0x3b,0x0a,0x7d,0x3b,0x0a,
    0x0a,0x76,0x6f,0x69,0x64,0x20,0x66,0x72,0x61,0x67,0x5f,0x6d,0x61,0x69,0x6e,0x28,
    0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,
    0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x53,
    0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,
    0x74,0x20,0x6d,0x61,0x69,0x6e,0x28,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,
    0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,
    0x6e,0x70,0x75,0x74,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,
    0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,
    0x6d,0x61,0x69,0x6e,0x28,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x53,0x50,0x49,0x52,
    0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x73,
    0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x20,0x20,0x20,
    0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x66,0x72,
    0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x66,0x72,0x61,0x67,0x5f,
    0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,
    0x6e,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,
    0x7d,0x0a,0x00,
}
/*
    #include <metal_stdlib>
    #include <simd/simd.h>

    using namespace metal;

    struct vs_params
    {
        float4x4 mvp;
    };

    struct sb_vertex
    {
        float3 pos;
        float4 color;
    };

    struct ssbo
    {
        sb_vertex vtx[1];
    };

    struct main0_out
    {
        float4 color [[user(locn0)]];
        float4 gl_Position [[position]];
    };

    vertex main0_out main0(constant vs_params& _19 [[buffer(0)]], const device ssbo& _28 [[buffer(8)]], uint gl_VertexIndex [[vertex_id]])
    {
        main0_out out = {};
        out.gl_Position = _19.mvp * float4(_28.vtx[int(gl_VertexIndex)].pos, 1.0);
        out.color = _28.vtx[int(gl_VertexIndex)].color;
        return out;
    }

*/
@(private="file")
vs_source_metal_macos := [616]u8 {
    0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x3c,0x6d,0x65,0x74,0x61,0x6c,0x5f,
    0x73,0x74,0x64,0x6c,0x69,0x62,0x3e,0x0a,0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,
    0x20,0x3c,0x73,0x69,0x6d,0x64,0x2f,0x73,0x69,0x6d,0x64,0x2e,0x68,0x3e,0x0a,0x0a,
    0x75,0x73,0x69,0x6e,0x67,0x20,0x6e,0x61,0x6d,0x65,0x73,0x70,0x61,0x63,0x65,0x20,
    0x6d,0x65,0x74,0x61,0x6c,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x76,
    0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x78,0x34,0x20,0x6d,0x76,0x70,0x3b,0x0a,0x7d,0x3b,0x0a,
    0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x73,0x62,0x5f,0x76,0x65,0x72,0x74,0x65,
    0x78,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,0x20,0x70,
    0x6f,0x73,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,
    0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,
    0x20,0x73,0x73,0x62,0x6f,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x73,0x62,0x5f,0x76,
    0x65,0x72,0x74,0x65,0x78,0x20,0x76,0x74,0x78,0x5b,0x31,0x5d,0x3b,0x0a,0x7d,0x3b,
    0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,
    0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,
    0x63,0x6f,0x6c,0x6f,0x72,0x20,0x5b,0x5b,0x75,0x73,0x65,0x72,0x28,0x6c,0x6f,0x63,
    0x6e,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,
    0x34,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x5b,0x5b,
    0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,
    0x76,0x65,0x72,0x74,0x65,0x78,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,
    0x20,0x6d,0x61,0x69,0x6e,0x30,0x28,0x63,0x6f,0x6e,0x73,0x74,0x61,0x6e,0x74,0x20,
    0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x26,0x20,0x5f,0x31,0x39,0x20,0x5b,
    0x5b,0x62,0x75,0x66,0x66,0x65,0x72,0x28,0x30,0x29,0x5d,0x5d,0x2c,0x20,0x63,0x6f,
    0x6e,0x73,0x74,0x20,0x64,0x65,0x76,0x69,0x63,0x65,0x20,0x73,0x73,0x62,0x6f,0x26,
    0x20,0x5f,0x32,0x38,0x20,0x5b,0x5b,0x62,0x75,0x66,0x66,0x65,0x72,0x28,0x38,0x29,
    0x5d,0x5d,0x2c,0x20,0x75,0x69,0x6e,0x74,0x20,0x67,0x6c,0x5f,0x56,0x65,0x72,0x74,
    0x65,0x78,0x49,0x6e,0x64,0x65,0x78,0x20,0x5b,0x5b,0x76,0x65,0x72,0x74,0x65,0x78,
    0x5f,0x69,0x64,0x5d,0x5d,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x6d,0x61,0x69,
    0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6f,0x75,0x74,0x20,0x3d,0x20,0x7b,0x7d,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x5f,0x31,0x39,0x2e,0x6d,0x76,0x70,0x20,0x2a,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,0x5f,0x32,0x38,0x2e,0x76,0x74,0x78,0x5b,
    0x69,0x6e,0x74,0x28,0x67,0x6c,0x5f,0x56,0x65,0x72,0x74,0x65,0x78,0x49,0x6e,0x64,
    0x65,0x78,0x29,0x5d,0x2e,0x70,0x6f,0x73,0x2c,0x20,0x31,0x2e,0x30,0x29,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,
    0x5f,0x32,0x38,0x2e,0x76,0x74,0x78,0x5b,0x69,0x6e,0x74,0x28,0x67,0x6c,0x5f,0x56,
    0x65,0x72,0x74,0x65,0x78,0x49,0x6e,0x64,0x65,0x78,0x29,0x5d,0x2e,0x63,0x6f,0x6c,
    0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x6f,
    0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
}
/*
    #include <metal_stdlib>
    #include <simd/simd.h>

    using namespace metal;

    struct main0_out
    {
        float4 frag_color [[color(0)]];
    };

    struct main0_in
    {
        float4 color [[user(locn0)]];
    };

    fragment main0_out main0(main0_in in [[stage_in]])
    {
        main0_out out = {};
        out.frag_color = in.color;
        return out;
    }

*/
@(private="file")
fs_source_metal_macos := [315]u8 {
    0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x3c,0x6d,0x65,0x74,0x61,0x6c,0x5f,
    0x73,0x74,0x64,0x6c,0x69,0x62,0x3e,0x0a,0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,
    0x20,0x3c,0x73,0x69,0x6d,0x64,0x2f,0x73,0x69,0x6d,0x64,0x2e,0x68,0x3e,0x0a,0x0a,
    0x75,0x73,0x69,0x6e,0x67,0x20,0x6e,0x61,0x6d,0x65,0x73,0x70,0x61,0x63,0x65,0x20,
    0x6d,0x65,0x74,0x61,0x6c,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,
    0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,
    0x20,0x5b,0x5b,0x63,0x6f,0x6c,0x6f,0x72,0x28,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x7d,
    0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,
    0x69,0x6e,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,
    0x63,0x6f,0x6c,0x6f,0x72,0x20,0x5b,0x5b,0x75,0x73,0x65,0x72,0x28,0x6c,0x6f,0x63,
    0x6e,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x66,0x72,0x61,0x67,0x6d,
    0x65,0x6e,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6d,0x61,
    0x69,0x6e,0x30,0x28,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x69,0x6e,0x20,0x69,0x6e,0x20,
    0x5b,0x5b,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x5d,0x5d,0x29,0x0a,0x7b,0x0a,
    0x20,0x20,0x20,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6f,0x75,
    0x74,0x20,0x3d,0x20,0x7b,0x7d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,
    0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x69,0x6e,0x2e,
    0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,
    0x6e,0x20,0x6f,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
}
vertexpull_shader_desc :: proc (backend: sg.Backend) -> sg.Shader_Desc {
    desc: sg.Shader_Desc
    desc.label = "vertexpull_shader"
    #partial switch backend {
    case .GLCORE:
        desc.vertex_func.source = transmute(cstring)&vs_source_glsl430
        desc.vertex_func.entry = "main"
        desc.fragment_func.source = transmute(cstring)&fs_source_glsl430
        desc.fragment_func.entry = "main"
        desc.uniform_blocks[0].stage = .VERTEX
        desc.uniform_blocks[0].layout = .STD140
        desc.uniform_blocks[0].size = 64
        desc.uniform_blocks[0].glsl_uniforms[0].type = .FLOAT4
        desc.uniform_blocks[0].glsl_uniforms[0].array_count = 4
        desc.uniform_blocks[0].glsl_uniforms[0].glsl_name = "vs_params"
        desc.storage_buffers[0].stage = .VERTEX
        desc.storage_buffers[0].readonly = true
        desc.storage_buffers[0].glsl_binding_n = 0
    case .D3D11:
        desc.vertex_func.source = transmute(cstring)&vs_source_hlsl5
        desc.vertex_func.d3d11_target = "vs_5_0"
        desc.vertex_func.entry = "main"
        desc.fragment_func.source = transmute(cstring)&fs_source_hlsl5
        desc.fragment_func.d3d11_target = "ps_5_0"
        desc.fragment_func.entry = "main"
        desc.uniform_blocks[0].stage = .VERTEX
        desc.uniform_blocks[0].layout = .STD140
        desc.uniform_blocks[0].size = 64
        desc.uniform_blocks[0].hlsl_register_b_n = 0
        desc.storage_buffers[0].stage = .VERTEX
        desc.storage_buffers[0].readonly = true
        desc.storage_buffers[0].hlsl_register_t_n = 16
    case .METAL_MACOS:
        desc.vertex_func.source = transmute(cstring)&vs_source_metal_macos
        desc.vertex_func.entry = "main0"
        desc.fragment_func.source = transmute(cstring)&fs_source_metal_macos
        desc.fragment_func.entry = "main0"
        desc.uniform_blocks[0].stage = .VERTEX
        desc.uniform_blocks[0].layout = .STD140
        desc.uniform_blocks[0].size = 64
        desc.uniform_blocks[0].msl_buffer_n = 0
        desc.storage_buffers[0].stage = .VERTEX
        desc.storage_buffers[0].readonly = true
        desc.storage_buffers[0].msl_buffer_n = 8
    }
    return desc
}
