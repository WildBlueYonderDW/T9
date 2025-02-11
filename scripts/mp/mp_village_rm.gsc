#using script_44b0b8420eabacad;
#using scripts\core_common\compass;
#using scripts\core_common\flag_shared;
#using scripts\core_common\load_shared;
#using scripts\core_common\util_shared;

#namespace mp_village_rm;

// Namespace mp_village_rm/level_init
// Params 1, eflags: 0x20
// Checksum 0x4a4bbcdf, Offset: 0x148
// Size: 0xb4
function event_handler[level_init] main(*eventstruct) {
    level.levelkothdisable = [];
    level.levelkothdisable[level.levelkothdisable.size] = spawn("trigger_radius", (-843, -1039, 120), 0, 50, 100);
    function_24198689();
    load::main();
    compass::setupminimap("");
    level thread function_29584e41();
}

// Namespace mp_village_rm/mp_village_rm
// Params 0, eflags: 0x0
// Checksum 0xaec6f3a0, Offset: 0x208
// Size: 0x8c
function function_24198689() {
    var_780f74b5 = [];
    var_780f74b5[var_780f74b5.size] = "mp_spawn_point";
    var_780f74b5[var_780f74b5.size] = "mp_spawn_point_axis";
    var_780f74b5[var_780f74b5.size] = "mp_spawn_point_allies";
    spawning::move_spawn_point(var_780f74b5, (1251, -1009, 8), (1287, -955, 68), (0, 105, 0));
}

// Namespace mp_village_rm/mp_village_rm
// Params 0, eflags: 0x0
// Checksum 0x33557350, Offset: 0x2a0
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

