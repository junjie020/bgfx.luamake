local lm = require 'luamake'
local texturec = require 'examples.texturec'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '47-pixelformats' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        texturec.compile 'examples/runtime/textures/pf_alpha_test.dds',
        texturec.compile 'examples/runtime/textures/pf_uv_filtering_test.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_10x10.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_10x5.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_10x6.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_10x8.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_12x10.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_12x12.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_4x4.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_5x4.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_5x5.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_6x5.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_6x6.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_8x5.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_8x6.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_astc_8x8.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_atc.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_atce.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_atci.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_bc1.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_bc2.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_bc3.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_bc7.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_etc1.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_etc2.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc12.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc14.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc22.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc24.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_rgba8.dds',
    },
    defines = lm.os ~= 'android' and 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/47-pixelformats/pixelformats.cpp',
    },
}
