add_platformdirs("./platforms")
add_toolchaindirs("./toolchains")
add_moduledirs("./modules")

rule( "3ds" )
    on_config(function (target)
        if is_mode("release") then
            target:set("strip", "debug")
        end
    end)

    after_build(function(target)
        import("detect.sdks.find_devkitARM")
        local sdk = find_devkitARM()
        local DEVKITARM = sdk.sdkdir

        local namepath = target:targetdir() .. "/" .. target:basename()

        os.vrunv(DEVKITARM .."/bin/arm-none-eabi-gcc-nm", { 
            "-CSn", namepath .. ".elf"
            }, {stdout = namepath .. ".lst"} )

        os.vrunv("C:/devkitPro/tools/bin/3dsxtool", { 
            namepath .. ".elf",
            namepath .. ".3dsx",
            -- "--smdh=/d/dev/3ds/3ds.smdh"
            })
    end)
rule_end()