#using scripts\core_common\compass;
#using scripts\core_common\flag_shared;
#using scripts\core_common\load_shared;
#using scripts\core_common\util_shared;

#namespace mp_apocalypse;

// Namespace mp_apocalypse/level_init
// Params 1, eflags: 0x20
// Checksum 0x4949ab02, Offset: 0x100
// Size: 0x144
function event_handler[level_init] main(*eventstruct) {
    level.levelkothdisable = [];
    level.levelkothdisable[level.levelkothdisable.size] = spawn("trigger_radius", (299, -687, -10), 0, 35, 150);
    load::main();
    compass::setupminimap("");
    level.var_3944682[#"allies"] = {#origin:(4000, -10000, 0), #angles:(0, -147, 0)};
    level.var_3944682[#"axis"] = {#origin:(4000, -10000, 0), #angles:(0, 33, 0)};
    level thread function_29584e41();
}

// Namespace mp_apocalypse/mp_apocalypse
// Params 0, eflags: 0x0
// Checksum 0x4f969117, Offset: 0x250
// Size: 0x170
function function_29584e41() {
    level flag::wait_till(#"item_world_reset");
    if (util::get_game_type() !== #"spy") {
        var_94c44cac = getdynentarray("spy_special_weapon_stash");
        var_de285f77 = getdynentarray("spy_ammo_stash");
        var_ffd6a2d3 = getdynentarray("spy_equipment_stash");
        var_3c1644b6 = arraycombine(var_94c44cac, var_de285f77);
        var_3c1644b6 = arraycombine(var_3c1644b6, var_ffd6a2d3);
        foreach (dynent in var_3c1644b6) {
            function_e2a06860(dynent, 3);
        }
    }
}

