add_rules("mode.debug", "mode.release")

includes "xmake/3DS"

if is_arch( "3ds" ) then 
    set_plat( "3ds" )
end

target("demo")
    set_targetdir "bin"
    set_objectdir "build/obj"
    
    set_kind("binary")
    add_files("source/main.cpp")
    add_rules( "3ds" )
target_end()