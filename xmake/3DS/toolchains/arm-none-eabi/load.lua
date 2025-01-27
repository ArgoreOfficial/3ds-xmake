function main(toolchain)
    local ARCH = { 
        "-march=armv6k", 
        "-mtune=mpcore", 
        "-mfloat-abi=hard", 
        "-mtp=soft" 
        }
    
    local CFLAGS = {
        "-g", 
        "-Wall", 
        "-O2", 
        "-mword-relocations", 
        "-ffunction-sections"
    }
    toolchain:add("cflags", CFLAGS)
    toolchain:add("cflags", ARCH)

    local CXXFLAGS = {
        "-MMD",
        "-MP",
        "-fno-rtti",
        "-fno-exceptions",
        "-std=gnu++11"
    }
    toolchain:add( "cxxflags", CFLAGS )
    toolchain:add( "cxxflags", CXXFLAGS )
    toolchain:add( "cxxflags", ARCH )
   
    local LDFLAGS = {
        "-specs=3dsx.specs", 
        "-g"
    }
    toolchain:add( "ldflags", LDFLAGS )
    toolchain:add( "ldflags", ARCH )
    
    toolchain:add( "defines", "__3DS__ " )

    toolchain:add( "sysincludedirs", "C:/devkitPro/libctru/include" )
    --toolchain:add( "sysincludedirs", "C:/devkitPro/devkitARM/include" )
    --toolchain:add( "sysincludedirs", "C:/devkitPro/devkitARM/arm-none-eabi/include" )
    --toolchain:add( "sysincludedirs", "C:/devkitPro/devkitARM/arm-none-eabi/include/c++/14.2.0/arm-none-eabi" )
    --toolchain:add( "sysincludedirs", "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.2.0/include" )

    toolchain:add( "linkdirs", "C:/devkitPro/libctru/lib" )
    toolchain:add( "syslinks", "ctru", "m" )
end