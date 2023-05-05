local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '16-shadowmaps' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_black.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_esm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_esm_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_esm_linear.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_esm_linear_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_esm_linear_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_esm_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_hard.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_hard_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_hard_linear.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_hard_linear_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_hard_linear_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_hard_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_pcf.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_pcf_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_pcf_linear.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_pcf_linear_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_pcf_linear_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_pcf_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_vsm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_vsm_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_vsm_linear.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_vsm_linear_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_vsm_linear_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_lighting_vsm_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_color_texture.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_hblur.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_hblur_vsm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_packdepth.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_packdepth_linear.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_packdepth_vsm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_packdepth_vsm_linear.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_texture.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_unpackdepth.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_unpackdepth_vsm.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_vblur.sc',
        shaderc.compile 'examples/16-shadowmaps/fs_shadowmaps_vblur_vsm.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_color.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_color_lighting.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_color_lighting_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_color_lighting_linear.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_color_lighting_linear_csm.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_color_lighting_linear_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_color_lighting_omni.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_color_texture.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_depth.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_hblur.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_packdepth.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_packdepth_linear.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_texture.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_texture_lighting.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_unpackdepth.sc',
        shaderc.compile 'examples/16-shadowmaps/vs_shadowmaps_vblur.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
        geometryc.compile 'examples/assets/meshes/tree.obj',
        texturec.compile 'examples/runtime/textures/fieldstone-rgba.dds',
        texturec.compile 'examples/runtime/textures/figure-rgba.dds',
        texturec.compile 'examples/runtime/textures/flare.dds',
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
        'examples/16-shadowmaps/shadowmaps.cpp',
    },
}
