#using script_498cf7685befe7bf;
#using script_77f51076c7c89596;
#using script_e3ec3024527fc15;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\core_common\vehicleriders_shared;
#using scripts\cp_common\hms_util;
#using scripts\cp_common\objectives;
#using scripts\cp_common\skipto;

#namespace namespace_d0cd5fb4;

// Namespace namespace_d0cd5fb4/namespace_d0cd5fb4
// Params 1, eflags: 0x0
// Checksum 0xfab4ffe1, Offset: 0x2b0
// Size: 0x8c
function starting(*str_objective) {
    namespace_534279a::spawn_allies();
    level.var_77be18d2 = vehicle::simple_spawn_single("player_fav");
    level.var_7b278a4f = vehicle::simple_spawn_single("ally_fav_left");
    level.var_5d798cf2 = vehicle::simple_spawn_single("ally_fav_right");
    fav::init();
}

// Namespace namespace_d0cd5fb4/namespace_d0cd5fb4
// Params 2, eflags: 0x0
// Checksum 0xbf954a7c, Offset: 0x348
// Size: 0x184
function main(*str_objective, *var_50cc0d4f) {
    level spawner::simple_spawn("ally_breach_spawner");
    level waittill(#"hash_465d6bb5960c37f8");
    var_3e3877e9 = spawner::get_ai_group_ai("initial_ally_group");
    level array::run_all(var_3e3877e9, &deletedelay);
    level.var_7b278a4f val::set(#"hash_4d691b627200194f", "ignoreme", 1);
    level.var_7b278a4f vehicle::unload("all");
    level.var_5d798cf2 val::set(#"hash_5ba8a98bf94ed750", "ignoreme", 1);
    level.var_5d798cf2 vehicle::unload("all");
    level thread skipto::function_4e3ab877("wall_breach");
    level flag::set("flg_fav_exit_hint");
}

// Namespace namespace_d0cd5fb4/namespace_d0cd5fb4
// Params 4, eflags: 0x0
// Checksum 0x2b95c624, Offset: 0x4d8
// Size: 0x24
function cleanup(*str_objective, *var_50cc0d4f, *var_aa1a6455, *player) {
    
}

// Namespace namespace_d0cd5fb4/namespace_d0cd5fb4
// Params 0, eflags: 0x4
// Checksum 0xcb8eed7e, Offset: 0x508
// Size: 0xc4
function private function_28dee3ce() {
    level waittill(#"hash_3a698db448edb3a");
    var_76c72752 = getent("vol_courtyard_allies_left", "targetname");
    var_539b881 = getent("vol_courtyard_allied_start_left", "targetname");
    level.var_7b278a4f val::set(#"hash_4d691b627200194f", "ignoreme", 1);
    level.var_7b278a4f vehicle::unload("all");
}

// Namespace namespace_d0cd5fb4/namespace_d0cd5fb4
// Params 0, eflags: 0x4
// Checksum 0xa4a2306d, Offset: 0x5d8
// Size: 0x4e
function private function_1cac512e() {
    level flag::wait_till("flg_left_path_objective_completed");
    var_a902a17d = getent("vol_courtyard_allied_fallback_left", "targetname");
}

// Namespace namespace_d0cd5fb4/namespace_d0cd5fb4
// Params 0, eflags: 0x4
// Checksum 0x4c904d82, Offset: 0x630
// Size: 0xc4
function private function_cdd46403() {
    level waittill(#"hash_3f545ab5dd4237c9");
    var_f137a62d = getent("vol_courtyard_allies_right", "targetname");
    var_539b881 = getent("vol_courtyard_allied_start_right", "targetname");
    level.var_5d798cf2 val::set(#"hash_5ba8a98bf94ed750", "ignoreme", 1);
    level.var_5d798cf2 vehicle::unload("all");
}

// Namespace namespace_d0cd5fb4/namespace_d0cd5fb4
// Params 0, eflags: 0x0
// Checksum 0x26fa087b, Offset: 0x700
// Size: 0x164
function function_1a716be() {
    level.courtyard_enemies = spawner::simple_spawn("perimeter_initial_enemy");
    while (level.courtyard_enemies.size > 7) {
        function_1eaaceab(level.courtyard_enemies, 0);
        waitframe(1);
    }
    var_1ccdbdc3 = spawner::simple_spawn("perimeter_first_wave");
    foreach (guy in var_1ccdbdc3) {
        array::add(level.courtyard_enemies, guy);
    }
    while (level.courtyard_enemies.size > 11) {
        function_1eaaceab(level.courtyard_enemies, 0);
        waitframe(1);
    }
    level flag::set("flg_perimeter_end");
}

