local lm = require 'luamake'

lm:exe '29-debugdraw' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
    },
    defines = 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/29-debugdraw/debugdraw.cpp',
    },
}
