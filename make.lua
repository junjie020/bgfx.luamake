local lm = require "luamake"
local fs = require "bee.filesystem"

lm.BgfxDir = lm:path "./bgfx/"
lm.BxDir = lm:path "./bx/"
lm.BimgDir = lm:path "./bimg/"

lm.mode = "debug"
lm.cxx = "c++17"

lm.warnings = {
    "error",
    "on"
}

lm.defines = "BX_CONFIG_DEBUG=" .. (lm.mode == "debug" and 1 or 0)

lm.msvc = {
    defines = "_CRT_SECURE_NO_WARNINGS",
    includes = lm.BxDir / "include/compat/msvc",
}

lm.mingw = {
    includes = lm.BxDir / "include/compat/mingw",
}

lm.macos = {
    includes = lm.BxDir / "include/compat/osx",
}

lm.ios = {
    includes = lm.BxDir / "include/compat/ios",
    flags = {
        "-fembed-bitcode",
        "-Wno-unused-function"
    }
}

lm.clang = {
    flags = {
        "-Wno-tautological-constant-compare"
    }
}

require "core.bx"
require "core.bimg"
require "core.bgfx"

if lm.os == "ios" then
    return
end

if lm.os == "windows" then
    lm:source_set "bgfx-support-utf8" {
        sources = "utf8/utf8.rc"
    }
end

require "tools.shaderc"
require "tools.texturec"
require "tools.texturev"

require "examples.common"

local examples = {}
for file in fs.pairs "examples" do
    local name = file:stem():string()
    local id = name:match "^(%d%d)-"
    if id then
        examples[id] = name
    end
end

if lm.runtest then
    local test = lm.runtest
    if test == "on" then
        test = "00"
    end
    test = examples[test] or test

    require("examples."..test)
    lm:build ("run-"..test) {
        "$luamake", "lua", "runtest.lua", "$bin/"..test, lm.BgfxDir / "examples/runtime",
        deps = test,
    }
    lm:default {
        "run-"..test
    }
else
    for _, test in pairs(examples) do
        require("examples."..test)
    end
end
