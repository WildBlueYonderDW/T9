#using script_1351b3cdb6539f9b;
#using script_1478fbd17fe393cf;
#using script_2d443451ce681a;
#using script_32399001bdb550da;
#using script_3de86a21a0c8d47b;
#using script_52da18c20f45c56a;
#using script_61fee52bb750ac99;
#using scripts\core_common\ai_shared;
#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\cp\cp_nam_prisoner;
#using scripts\cp_common\bb;
#using scripts\cp_common\dialogue;
#using scripts\cp_common\objectives;
#using scripts\cp_common\skipto;
#using scripts\cp_common\spawn_manager;
#using scripts\cp_common\util;

#namespace namespace_d12540d8;

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0xd0bb1f4f, Offset: 0x1310
// Size: 0xc
function start(*str_objective) {
    
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 2, eflags: 0x0
// Checksum 0x660a6f25, Offset: 0x1328
// Size: 0x134
function main(str_objective, *var_50cc0d4f) {
    util::init_dvar("scr_napalm_strike_capture_model", 0);
    if (level.var_731c10af.var_42659717 == 0) {
        next_obj = "path_end_1";
    }
    if (level.var_731c10af.var_42659717 == 1) {
        next_obj = "path_end_2";
    }
    if (level.var_731c10af.var_42659717 == 2) {
        next_obj = "path_end_3";
    }
    if (level.var_731c10af.var_42659717 == 3) {
        next_obj = "path_end_4";
    }
    level thread cp_nam_prisoner::function_1f911b89(next_obj);
    flag = "sniper_overlook";
    level flag::wait_till(flag + "_complete");
    level skipto::function_4e3ab877(var_50cc0d4f, 0);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 4, eflags: 0x0
// Checksum 0x94a8c620, Offset: 0x1468
// Size: 0x8f4
function cleanup(*str_objective, *var_50cc0d4f, *var_aa1a6455, *player) {
    wait 1;
    vehicle_plane_group1 = getentarray("vehicle_plane_group1", "targetname");
    arrayremovevalue(vehicle_plane_group1, undefined);
    array::thread_all(vehicle_plane_group1, &namespace_d9b153b9::ent_cleanup);
    vehicle_plane_group2 = getentarray("vehicle_plane_group2", "targetname");
    arrayremovevalue(vehicle_plane_group2, undefined);
    array::thread_all(vehicle_plane_group2, &namespace_d9b153b9::ent_cleanup);
    vehicle_plane_group3 = getentarray("vehicle_plane_group3", "targetname");
    arrayremovevalue(vehicle_plane_group3, undefined);
    array::thread_all(vehicle_plane_group3, &namespace_d9b153b9::ent_cleanup);
    vehicle_plane_groupfar1 = getentarray("vehicle_plane_groupfar1", "targetname");
    arrayremovevalue(vehicle_plane_groupfar1, undefined);
    array::thread_all(vehicle_plane_groupfar1, &namespace_d9b153b9::ent_cleanup);
    vehicle_plane_groupfar1a = getentarray("vehicle_plane_groupfar1a", "targetname");
    arrayremovevalue(vehicle_plane_groupfar1a, undefined);
    array::thread_all(vehicle_plane_groupfar1a, &namespace_d9b153b9::ent_cleanup);
    vehicle_plane_groupfar1b = getentarray("vehicle_plane_groupfar1b", "targetname");
    arrayremovevalue(vehicle_plane_groupfar1b, undefined);
    array::thread_all(vehicle_plane_groupfar1b, &namespace_d9b153b9::ent_cleanup);
    sniper_heligroup1 = getentarray("sniper_heligroup1", "targetname");
    arrayremovevalue(sniper_heligroup1, undefined);
    array::thread_all(sniper_heligroup1, &namespace_d9b153b9::ent_cleanup);
    sniper_heligroup1a = getentarray("sniper_heligroup1a", "targetname");
    arrayremovevalue(sniper_heligroup1a, undefined);
    array::thread_all(sniper_heligroup1a, &namespace_d9b153b9::ent_cleanup);
    sniper_heligroupfar1 = getentarray("sniper_heligroupfar1", "targetname");
    arrayremovevalue(sniper_heligroupfar1, undefined);
    array::thread_all(sniper_heligroupfar1, &namespace_d9b153b9::ent_cleanup);
    sniper_heligroupfar1a = getentarray("sniper_heligroupfar1a", "targetname");
    arrayremovevalue(sniper_heligroupfar1a, undefined);
    array::thread_all(sniper_heligroupfar1a, &namespace_d9b153b9::ent_cleanup);
    sniper_heligroupfar1b = getentarray("sniper_heligroupfar1b", "targetname");
    arrayremovevalue(sniper_heligroupfar1b, undefined);
    array::thread_all(sniper_heligroupfar1b, &namespace_d9b153b9::ent_cleanup);
    sniper_heligroup2 = getentarray("sniper_heligroup2", "targetname");
    arrayremovevalue(sniper_heligroup2, undefined);
    array::thread_all(sniper_heligroup2, &namespace_d9b153b9::ent_cleanup);
    sniper_heligroup2a = getentarray("sniper_heligroup2a", "targetname");
    arrayremovevalue(sniper_heligroup2a, undefined);
    array::thread_all(sniper_heligroup2a, &namespace_d9b153b9::ent_cleanup);
    sniper_heligroup2b = getentarray("sniper_heligroup2b", "targetname");
    arrayremovevalue(sniper_heligroup2b, undefined);
    array::thread_all(sniper_heligroup2b, &namespace_d9b153b9::ent_cleanup);
    sniper1_battle1_enemies_right = getentarray("sniper1_battle1_enemies_right", "targetname");
    array::thread_all(sniper1_battle1_enemies_right, &namespace_d9b153b9::ent_cleanup);
    sniper1_battle1_allies1 = getentarray("sniper1_battle1_allies1", "targetname");
    array::thread_all(sniper1_battle1_allies1, &namespace_d9b153b9::ent_cleanup);
    sniper1_battle1_allies2 = getentarray("sniper1_battle1_allies2", "targetname");
    array::thread_all(sniper1_battle1_allies2, &namespace_d9b153b9::ent_cleanup);
    level flag::clear("flag_sniper_hut_non_destroy");
    level flag::clear("flag_sniper_hut_destroy");
    level flag::clear("flag_sniper_hut_non_destroy_2");
    level flag::clear("flag_sniper_hut_destroy_2");
    sniper_hut_destroy_brush_day = getentarray("sniper_hut_destroy_brush_day", "targetname");
    array::thread_all(sniper_hut_destroy_brush_day, &namespace_d9b153b9::ent_cleanup);
    sniper_hut_destroy_brush_night = getentarray("sniper_hut_destroy_brush_night", "targetname");
    array::thread_all(sniper_hut_destroy_brush_night, &namespace_d9b153b9::ent_cleanup);
    var_5a1ebfd9 = getentarray("sniper_hut_non_destory_brush", "targetname");
    array::thread_all(var_5a1ebfd9, &namespace_d9b153b9::ent_cleanup);
    var_5881b992 = getentarray("sniper_hut_destroy_brush", "targetname");
    array::thread_all(var_5881b992, &namespace_d9b153b9::ent_cleanup);
    sniper_overlook_triggers = getentarray("sniper_overlook_triggers", "script_noteworthy");
    array::thread_all(sniper_overlook_triggers, &namespace_d9b153b9::ent_cleanup);
    sniper_overlook_volumes = getentarray("sniper_overlook_volumes", "script_noteworthy");
    array::thread_all(sniper_overlook_volumes, &namespace_d9b153b9::ent_cleanup);
    door_struct = namespace_d9b153b9::door_setup("sniper_overlook_door_struct", 1, 1);
    door_struct thread namespace_d9b153b9::ent_cleanup();
    clip = getent("sniper_overlook_player_blocker_clip_for_turning_off_districts", "targetname");
    clip thread namespace_d9b153b9::ent_cleanup();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xeccef978, Offset: 0x1d68
// Size: 0x184
function function_c26b0bc0() {
    level flag::init("flag_sniper_player_shot");
    level flag::init("sniper_overlook_complete");
    level flag::init("sniper_overlook_exited");
    level flag::init("sniper_overlook_obj_on");
    level flag::init("flag_sniper_overlook_weapon");
    level flag::init("sniper_overlook1_flag_dead");
    level flag::init("flag_sniper_overlook_start_napalm");
    level flag::init("flag_sniper_napalm_strike_called_in");
    level flag::init("flag_sniper_hut_non_destroy");
    level flag::init("flag_sniper_hut_destroy");
    level flag::init("flag_sniper_napalm");
    level flag::init("flag_sniper_napalm_obj");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x9f9e3ec7, Offset: 0x1ef8
// Size: 0x94
function function_85393839() {
    wait 2;
    vol_binoculars_house_target = getent("vol_binoculars_house_target", "targetname");
    objectives::function_4eb5c04a("clear_objective", vol_binoculars_house_target.origin + (0, 0, 8));
    objectives::function_67f87f80("clear_objective", undefined, #"hash_4c04cd21fa55d4e2");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x10fbcc00, Offset: 0x1f98
// Size: 0x1d8
function sniper_overlook() {
    level endon(#"start_outro");
    var_c79d614f = "sniper_overlook";
    level flag::wait_till("flag_" + var_c79d614f);
    level.var_3f5c80c8 = "sniper_overlook";
    level.player clientfield::set_to_player("force_stream_weapons", 4);
    level thread savegame::checkpoint_save();
    var_2cf9fe23 = level.var_731c10af.var_42659717 + 1;
    str = "visit_" + var_2cf9fe23 + "_" + var_c79d614f;
    bb::function_cd497743(str, level.player);
    level thread function_58fc3ddf();
    level flag::set("flag_sniper_overlook_weapon");
    while (true) {
        level thread namespace_d9b153b9::function_a57f6629(var_c79d614f);
        level function_f92f5a29(var_c79d614f);
        if (level flag::get(var_c79d614f + "_complete")) {
            break;
        }
        wait 0.5;
        level flag::wait_till("flag_" + var_c79d614f);
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x1ea20aa, Offset: 0x2178
// Size: 0x7c
function function_58fc3ddf() {
    clip = getent("sniper_overlook_player_blocker_clip_for_turning_off_districts", "targetname");
    clip notsolid();
    level flag::wait_till("flag_sniper_overlook_district_cleanup");
    clip solid();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0xe543acff, Offset: 0x2200
// Size: 0x15c
function function_f92f5a29(var_c79d614f) {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(var_c79d614f + "_end");
    if (level.var_731c10af.paths[var_c79d614f].count == 0) {
        level thread function_16e5c253(var_c79d614f);
        level thread function_a4c55870(var_c79d614f);
    }
    level flag::wait_till(var_c79d614f + "_door_opened");
    objectives::complete("clear_objective");
    level notify(#"flag_sniper_napalm");
    function_4893cd62();
    namespace_d9b153b9::function_e106e062(var_c79d614f);
    level flag::set(var_c79d614f + "_complete");
    level flag::set(var_c79d614f + "_exited");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0xa94e578d, Offset: 0x2368
// Size: 0x220
function function_16e5c253(var_c79d614f) {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(var_c79d614f + "_complete");
    while (true) {
        level flag::wait_till(var_c79d614f + "_exited");
        level flag::clear("flag_" + var_c79d614f);
        level flag::clear("sniper1_overlook1_bundle1_flag_true");
        level flag::clear("sniper_overlook1_flag_dead");
        level flag::clear("sniper1_battle1_crewright_bundle1_flag_true");
        level flag::clear("sniper1_battle1_crewright_bundle1_flag_dead");
        level flag::clear("sniper1_battle1_crewcenter_bundle1_flag_true");
        level flag::clear("sniper1_battle1_crewcenter_bundle1_flag_dead");
        level flag::clear("sniper1_battle1_crewleft_bundle1_flag_true");
        level flag::clear("sniper1_battle1_crewleft_bundle1_flag_dead");
        level flag::clear("flag_sniper_napalm");
        thread function_91eed10c();
        wait 1;
        level flag::wait_till("flag_" + var_c79d614f);
        level flag::clear(var_c79d614f + "_exited");
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0x83b48cf6, Offset: 0x2590
// Size: 0xfc
function function_a4c55870(var_c79d614f) {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(#"hash_7ca9f0b4f83dae74");
    if (isdefined(level.var_731c10af.var_42659717) && level.var_731c10af.var_42659717 == 2) {
        level thread function_42d5d6a4();
    }
    level thread function_f46355f3();
    level thread function_4ffb7c33(var_c79d614f);
    level function_68b23c42();
    level function_a0b36023();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x54469f46, Offset: 0x2698
// Size: 0x94
function function_42d5d6a4() {
    level flag::wait_till("flag_sniper_overlook_second_position");
    level thread scene::play("scene_pri_sniper_overlook_observe", "shot 1");
    level flag::wait_till("flag_adler_sniper_overlook_disappear");
    level scene::play("scene_pri_sniper_overlook_observe", "shot 2");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xd54b1eb4, Offset: 0x2738
// Size: 0x374
function function_f46355f3() {
    level flag::set("flag_sniper_hut_non_destroy");
    level thread function_9a15793("model_sniper_hut_non_destroy");
    level flag::clear("flag_sniper_hut_destroy");
    level flag::set("flag_sniper_hut_non_destroy_2");
    level flag::clear("flag_sniper_hut_destroy_2");
    sniper_hut_destroy_brush_day = getentarray("sniper_hut_destroy_brush_day", "targetname");
    sniper_hut_destroy_brush_night = getentarray("sniper_hut_destroy_brush_night", "targetname");
    if (level.var_731c10af.var_e15e5b51.size == 1) {
        array::thread_all(sniper_hut_destroy_brush_day, &namespace_d9b153b9::ent_cleanup);
        level.var_d8a117f3 = sniper_hut_destroy_brush_night;
    } else {
        array::thread_all(sniper_hut_destroy_brush_night, &namespace_d9b153b9::ent_cleanup);
        level.var_d8a117f3 = sniper_hut_destroy_brush_day;
    }
    foreach (brush in level.var_d8a117f3) {
        if (isdefined(brush)) {
            brush hide();
        }
    }
    var_5a1ebfd9 = getentarray("sniper_hut_non_destory_brush", "targetname");
    foreach (brush in var_5a1ebfd9) {
        brush show();
    }
    var_5881b992 = getentarray("sniper_hut_destroy_brush", "targetname");
    foreach (brush in var_5881b992) {
        brush hide();
    }
    clientfield::set("dmg_models_and_vol_decals_napalm_strike", 0);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0x38e0a198, Offset: 0x2ab8
// Size: 0xc4
function function_4ffb7c33(var_c79d614f) {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(#"hash_7ca9f0b4f83dae74");
    level thread function_c95fce7(var_c79d614f);
    level flag::wait_till("flag_sniper_overlook_to_ridge");
    level thread function_85393839();
    level flag::clear("flag_sniper_overlook_weapon");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0xe097e5d3, Offset: 0x2b88
// Size: 0x194
function function_c95fce7(var_c79d614f) {
    if (level.var_baa7cf92 != "sniper_overlook" && level.var_731c10af.var_e15e5b51.size == 0) {
        thread namespace_b6fe1dbe::function_1e0e9b39(var_c79d614f);
        dialogue::radio("vox_cp_prsn_02700_adlr_whatthehellfaci_b8");
    } else if (level.var_baa7cf92 != "sniper_overlook" && (level.var_731c10af.var_e15e5b51.size == 1 || level.var_731c10af.var_e15e5b51.size == 2)) {
        thread namespace_b6fe1dbe::function_1e0e9b39(var_c79d614f);
        level util::dialog_gender_vo("vox_cp_prsn_05500_adlr_bellkeepsswitch_d3", "vox_cp_prsn_05500_adlr_bellkeepsswitch_46", "vox_cp_prsn_05500_adlr_bellkeepsswitch_24");
    } else {
        thread namespace_b6fe1dbe::function_34830cda(var_c79d614f);
    }
    level flag::wait_till("flag_sniper_overlook_to_ridge");
    thread dialogue::radio("vox_cp_prsn_08800_adlr_afewallieswerep_62");
    wait 3;
    namespace_d9b153b9::force_weapon_loadout(var_c79d614f);
    wait 0.5;
    dialogue::radio("vox_cp_prsn_37000_ams3_commandsayswene_b7");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x1444c16b, Offset: 0x2d28
// Size: 0x1bc
function function_68b23c42() {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(#"hash_7ca9f0b4f83dae74");
    thread function_3d400a3b();
    level.var_6839f92e = 0;
    spawner::add_spawn_function_group("sniper1_battle1", "script_aigroup", &function_cbd81e0c);
    level thread function_982d757f();
    level thread function_fca43e6f();
    level thread function_3f28442e();
    level thread function_35e19579();
    level thread function_e82495a1();
    level flag::wait_till("flag_sniper_overlook_to_ridge");
    level thread function_2cf62f78();
    level thread function_e2df3160();
    wait 30;
    level flag::wait_till_any_timeout(15, array("flag_sniper_overlook_start_napalm"));
    level flag::set("flag_sniper_overlook_start_napalm");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xb466feef, Offset: 0x2ef0
// Size: 0x44
function function_9d4c8e23() {
    var_d466316d = vehicle::simple_spawn_and_drive("sniper_tankgroup1");
    wait 30;
    var_d466316d[0] kill();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x5bbf6121, Offset: 0x2f40
// Size: 0x182
function function_982d757f() {
    level endon(#"flag_sniper_napalm");
    while (true) {
        wait 7;
        var_736f7cf8 = vehicle::simple_spawn_and_drive("sniper_heligroup1");
        foreach (heli in var_736f7cf8) {
            heli setrotorspeed(1);
        }
        wait 25;
        var_736f7cf8 = vehicle::simple_spawn_and_drive("sniper_heligroup1a");
        foreach (heli in var_736f7cf8) {
            heli setrotorspeed(1);
        }
        wait 30;
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x1cbb7f72, Offset: 0x30d0
// Size: 0x21c
function function_fca43e6f() {
    level endon(#"flag_sniper_napalm");
    while (true) {
        wait 20;
        var_736f7cf8 = vehicle::simple_spawn_and_drive("sniper_heligroup2");
        foreach (heli in var_736f7cf8) {
            heli setrotorspeed(1);
        }
        wait 15;
        var_736f7cf8 = vehicle::simple_spawn_and_drive("sniper_heligroup2a");
        foreach (heli in var_736f7cf8) {
            heli setrotorspeed(1);
        }
        wait 30;
        var_736f7cf8 = vehicle::simple_spawn_and_drive("sniper_heligroup2b");
        foreach (heli in var_736f7cf8) {
            heli setrotorspeed(1);
        }
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x721a09a0, Offset: 0x32f8
// Size: 0x222
function function_3f28442e() {
    level endon(#"flag_sniper_napalm");
    while (true) {
        wait 5;
        var_736f7cf8 = vehicle::simple_spawn_and_drive("sniper_heligroupfar1");
        foreach (heli in var_736f7cf8) {
            heli setrotorspeed(1);
        }
        wait 35;
        var_736f7cf8 = vehicle::simple_spawn_and_drive("sniper_heligroupfar1b");
        foreach (heli in var_736f7cf8) {
            heli setrotorspeed(1);
        }
        wait 25;
        var_736f7cf8 = vehicle::simple_spawn_and_drive("sniper_heligroupfar1a");
        foreach (heli in var_736f7cf8) {
            heli setrotorspeed(1);
        }
        wait 25;
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x3295c0df, Offset: 0x3528
// Size: 0x128
function function_35e19579() {
    level endon(#"flag_sniper_napalm");
    while (true) {
        wait 7;
        if (math::cointoss()) {
            var_736f7cf8 = vehicle::simple_spawn_and_drive("vehicle_plane_groupfar1");
        } else {
            var_736f7cf8 = vehicle::simple_spawn_and_drive("vehicle_plane_groupfar1b");
        }
        wait 5;
        if (math::cointoss()) {
            var_736f7cf8 = vehicle::simple_spawn_and_drive("vehicle_plane_groupfar1a");
        } else {
            var_736f7cf8 = vehicle::simple_spawn_and_drive("vehicle_plane_groupfar1b");
        }
        wait 25;
        if (math::cointoss()) {
            var_736f7cf8 = vehicle::simple_spawn_and_drive("vehicle_plane_groupfar1a");
        } else {
            var_736f7cf8 = vehicle::simple_spawn_and_drive("vehicle_plane_groupfar1");
        }
        wait 15;
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xe035a367, Offset: 0x3658
// Size: 0x34
function function_e82495a1() {
    level thread spawn_manager::enable("sniper1_battle1_manager_right1");
    thread function_e4eeedf8();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xe6ba9fbc, Offset: 0x3698
// Size: 0x66
function function_e4eeedf8() {
    var_ffe5ea78 = spawner::simple_spawn("sniper1_battle1_allies1", &function_1cbfb849);
    var_4fd3f0dc = spawner::simple_spawn("sniper1_battle1_allies2", &function_1cbfb849);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x597dec96, Offset: 0x3708
// Size: 0x84
function function_2cf62f78() {
    while (true) {
        if (level flag::get("flag_sniper_ridge_to_ground")) {
            if (level.var_6839f92e >= 4) {
                break;
            }
        } else if (level.var_6839f92e >= 8) {
            break;
        }
        waitframe(1);
    }
    level flag::set("flag_sniper_overlook_start_napalm");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x1f1816a8, Offset: 0x3798
// Size: 0x4c
function function_e2df3160() {
    level flag::wait_till("flag_sniper_overlook_start_napalm");
    level ai::function_a45f8c64("axis", undefined, "sniper1_battle1_volume_house", 1);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xc852c584, Offset: 0x37f0
// Size: 0x4e
function function_be10c43a() {
    if (isalive(level.player)) {
        self setpersonalthreatbias(level.player, -5000);
    }
    self.grenadeammo = 0;
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xbd1955d6, Offset: 0x3848
// Size: 0x2a
function function_1cbfb849() {
    self util::magic_bullet_shield();
    self.script_accuracy = 0.1;
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x20b33ed8, Offset: 0x3880
// Size: 0x9a
function function_cbd81e0c() {
    callback::on_death(&function_a1c082a5);
    waitframe(1);
    if (level flag::get("flag_sniper_overlook_start_napalm")) {
        self ai::set_goal("sniper1_battle1_volume_house", "targetname", 1);
    }
    if (level flag::get("sniper_overlook_stop_context_melee")) {
        self.var_c681e4c1 = 1;
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0x48a5d0c5, Offset: 0x3928
// Size: 0x44
function function_a1c082a5(params) {
    if (isdefined(params.attacker) && isplayer(params.attacker)) {
        level.var_6839f92e++;
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x826dd828, Offset: 0x3978
// Size: 0x164
function function_3d400a3b() {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(#"hash_5fba9f8fd9c7fc1e");
    level flag::wait_till("flag_sniper_overlook_to_ridge");
    childthread function_1ec20cd2();
    childthread namespace_d9b153b9::function_f6cbf7fd(&function_f1a99787, 1, 25);
    wait 5;
    dialogue::radio("vox_cp_prsn_37200_ams1_commandthisisbi_67");
    wait 1;
    dialogue::radio("vox_cp_prsn_37200_cmnd_bigduke4rogerdi_fe");
    level flag::wait_till("flag_sniper_overlook_start_napalm_call");
    dialogue::radio("vox_cp_prsn_37200_pilo_bigduke4thisisp_81");
    wait 3;
    if (!level flag::get("flag_sniper_napalm_strike_called_in")) {
        dialogue::radio("vox_cp_prsn_37200_ams1_bellmarkthetarg_58");
        level thread function_bc8b26be();
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x2b5c9639, Offset: 0x3ae8
// Size: 0xec
function function_bc8b26be() {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(#"flag_sniper_napalm_strike_called_in");
    level endon(#"hash_5fba9f8fd9c7fc1e");
    level endon(#"flag_sniper_napalm");
    wait 3;
    if (!level flag::get("flag_sniper_napalm_strike_called_in")) {
        dialogue::radio("vox_cp_prsn_37200_ams3_wakeupbellmarkt_4d");
    }
    wait 6;
    if (!level flag::get("flag_sniper_napalm_strike_called_in")) {
        dialogue::radio("vox_cp_prsn_37200_ams3_markitnow_1d");
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xf2fb4d1e, Offset: 0x3be0
// Size: 0x54
function function_f1a99787() {
    namespace_d9b153b9::function_f76551eb("vox_cp_prsn_14800_adlr_parkwhatthehell_9b", "vox_cp_prsn_14800_adlr_lazarwhatthehel_07", "vox_cp_prsn_14800_adlr_simswhatthehell_a9");
    namespace_d9b153b9::function_f76551eb("vox_cp_prsn_14800_park_giveittimesir_1f", "vox_cp_prsn_14800_lazr_justgiveitaminu_cf", "vox_cp_prsn_14800_sims_giveittime_85");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x782da443, Offset: 0x3c40
// Size: 0xf0
function function_1ec20cd2() {
    level endon(#"flag_sniper_napalm");
    while (true) {
        wait randomintrange(5, 15);
        if (math::cointoss()) {
            if (math::cointoss()) {
                dialogue::radio("vox_cp_prsn_37000_ams1_morecomingfromt_b1");
            } else {
                dialogue::radio("vox_cp_prsn_37000_ams3_keeppushing_c4");
            }
            continue;
        }
        if (math::cointoss()) {
            dialogue::radio("vox_cp_prsn_37000_ams1_snipersneartheh_70");
            continue;
        }
        dialogue::radio("vox_cp_prsn_37000_ams3_wherearetheyall_36");
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0xde7f719f, Offset: 0x3d38
// Size: 0x44
function function_f4f616bb(*str_objective) {
    level flag::set("flag_sniper_napalm");
    level thread function_f46355f3();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 2, eflags: 0x0
// Checksum 0xbc5a5db1, Offset: 0x3d88
// Size: 0x34
function function_5f076197(str_objective, *var_50cc0d4f) {
    var_50cc0d4f = "sniper_overlook";
    sniper_napalm();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 4, eflags: 0x0
// Checksum 0xf421a587, Offset: 0x3dc8
// Size: 0x24
function function_f3b9155f(*str_objective, *var_50cc0d4f, *var_aa1a6455, *player) {
    
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xc8fb513a, Offset: 0x3df8
// Size: 0x8c
function sniper_napalm() {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    var_c79d614f = "sniper_napalm";
    level flag::wait_till("flag_" + var_c79d614f);
    level.var_3f5c80c8 = "sniper_overlook";
    function_a0b36023();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x28b82af9, Offset: 0x3e90
// Size: 0x544
function function_a0b36023() {
    level flag::set("flag_sniper_overlook_start_napalm_call");
    if (!level flag::get("flag_sniper_ridge_to_ground")) {
        function_a183efa3();
    }
    level notify(#"flag_sniper_napalm");
    namespace_b6fe1dbe::music("23.0_napalm_ending", 5);
    thread function_77759392();
    level thread namespace_b6fe1dbe::function_117820e4();
    var_22c99863 = vehicle::simple_spawn_and_drive("vehicle_plane_group1");
    function_7fc618ff(var_22c99863);
    level thread namespace_b6fe1dbe::function_2a68e42f(var_22c99863[0]);
    var_22c99863[0] playrumblelooponentity("cp_nam_prisoner_heli_flyby");
    var_22c99863[0] thread function_6f77f823();
    wait 0.1;
    var_e7adee9e = [];
    var_518bf5e7 = vehicle::simple_spawn_and_drive("vehicle_plane_group2");
    function_7fc618ff(var_518bf5e7);
    level thread namespace_b6fe1dbe::function_189a4092(var_518bf5e7[0]);
    var_e7adee9e[0] = var_518bf5e7[0];
    var_518bf5e7[0] playrumblelooponentity("cp_nam_prisoner_heli_flyby");
    wait 0.25;
    level flag::set("sniper_overlook_stop_context_melee");
    var_e88bf7fc = getaiteamarray("axis");
    foreach (ai in var_e88bf7fc) {
        if (isalive(ai)) {
            ai.var_c681e4c1 = 1;
        }
    }
    if (level.player flag::get("in_action")) {
        level action_utility::function_396e2076();
    }
    var_fa20c70e = vehicle::simple_spawn_and_drive("vehicle_plane_group3");
    function_7fc618ff(var_fa20c70e);
    level thread namespace_b6fe1dbe::function_51b332c3(var_fa20c70e[0]);
    var_e7adee9e[1] = var_fa20c70e[0];
    var_fa20c70e[0] playrumblelooponentity("cp_nam_prisoner_heli_flyby");
    wait 5.5;
    thread function_da2b175e(var_e7adee9e);
    wait 1.65;
    level thread namespace_b6fe1dbe::function_278e4d10();
    level thread napalm_strike();
    wait 0.15;
    if (level.player flag::get("in_action")) {
        level action_utility::function_396e2076();
    } else {
        level.var_6a2ff10c = 1;
        level.player playgestureviewmodel("ges_t9_blind_reaction");
    }
    level.player playrumbleonentity("damage_heavy");
    level notify(#"hash_5fba9f8fd9c7fc1e");
    if (flag::get("flag_sniper_in_strike")) {
        thread namespace_d9b153b9::function_c66297e0("flag_sniper_in_strike", "struct_sniper_napalm");
    }
    function_258720af();
    wait 0.9;
    if (isdefined(level.var_6a2ff10c)) {
        level.player stopgestureviewmodel("ges_t9_blind_reaction");
    }
    thread function_a12d20d();
    flag::set("flag_sniper_napalm_obj");
    objectives::complete("clear_objective");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xaa7fea07, Offset: 0x43e0
// Size: 0x124
function napalm_strike() {
    thread function_f27c4eda();
    wait 0.15;
    var_43f2100f = getent("napalmCamShakeLoc", "targetname");
    screenshake(var_43f2100f.origin, 0.6, 0, 0.2, 2, 0.4, -0.8, 2100, 14, 0, 6, 0.6);
    wait 1.5;
    screenshake(var_43f2100f.origin, 0.8, 0, 0.3, 1.8, 0.3, 1, 2100, 13, 0, 6, 0.6);
    level flag::wait_till("sniper_overlook_door_opened");
    wait 1;
    thread function_f7f3eb6b();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xd72cba24, Offset: 0x4510
// Size: 0x104
function function_f27c4eda() {
    thread exploder::exploder("napalm_strike_explosion");
    thread exploder::exploder("napalm_strike_aftermath_hut");
    thread exploder::exploder("napalm_strike_aftermath_terrain");
    wait 1;
    level.player thread namespace_d9b153b9::function_4b72557e();
    wait 1.2;
    var_75f92fc = level.player getlightingstate();
    if (!isdefined(var_75f92fc) || var_75f92fc == 0) {
        thread exploder::exploder("lgt_napalm_fire_day");
    } else {
        thread exploder::exploder("lgt_napalm_fire_night");
    }
    wait 0.7;
    level.player thread namespace_d9b153b9::function_19540c8c();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x3ea44d, Offset: 0x4620
// Size: 0x4c
function function_f7f3eb6b() {
    thread exploder::exploder_stop("napalm_strike_explosion");
    thread exploder::exploder_stop("napalm_strike_aftermath_hut");
    thread exploder::exploder_stop("napalm_strike_aftermath_terrain");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xc0889a61, Offset: 0x4678
// Size: 0x288
function function_6f77f823() {
    wait 2.75;
    self playrumblelooponentity("cp_nam_prisoner_heli_flyby");
    weapon = getweapon(#"hash_4ff481a4f55ed901");
    var_46c257b5 = struct::get("struct_strafe_fire_path", "targetname");
    for (i = 1; i < 45; i++) {
        trace_start = self gettagorigin("tag_origin");
        var_9cd4bce5 = vectornormalize(var_46c257b5.origin - trace_start);
        trace_end = var_46c257b5.origin + var_9cd4bce5 * 500;
        trace = bullettrace(trace_start, trace_end, 0, self);
        var_70413e45 = (var_9cd4bce5 * -1 + trace[#"normal"]) * 0.5;
        var_6b0e4003 = vectortoangles(var_70413e45);
        trace_angles = vectortoangles(var_9cd4bce5 * -1);
        playfx("maps/cp_prisoner/fx9_bul_tracer_jet_strafe_rnr", trace[#"position"], anglestoforward(trace_angles), anglestoup(trace_angles));
        playfx("maps/cp_prisoner/fx9_bul_impact_dirt_strafe_rnr", trace[#"position"], anglestoforward(var_6b0e4003), anglestoup(var_6b0e4003));
        waitframe(1);
        var_46c257b5 = struct::get(var_46c257b5.target, "targetname");
        if (!isdefined(var_46c257b5)) {
            return;
        }
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0x88b3c2c8, Offset: 0x4908
// Size: 0x100
function function_da2b175e(var_e7adee9e) {
    var_7d5e572c = getdvarint(#"scr_napalm_strike_capture_model", 0);
    if (var_7d5e572c) {
        str_tag_name = "tag_body_animate";
    } else {
        str_tag_name = "tag_animate";
    }
    if (isdefined(var_e7adee9e[0].origin)) {
        playfxontag("maps/cp_prisoner/fx9_exp_napalm_canister01", var_e7adee9e[0], str_tag_name);
        wait 0.01;
        playfxontag("maps/cp_prisoner/fx9_exp_napalm_canister02", var_e7adee9e[0], str_tag_name);
        wait 0.001;
        playfxontag("maps/cp_prisoner/fx9_exp_napalm_canister03", var_e7adee9e[0], str_tag_name);
    }
    wait 0.76;
    if (isdefined(var_e7adee9e[1].origin)) {
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0x9c3b3681, Offset: 0x4a10
// Size: 0xc8
function function_7fc618ff(a_vehicles) {
    var_7d5e572c = getdvarint(#"scr_napalm_strike_capture_model", 0);
    if (var_7d5e572c) {
        foreach (e_vehicle in a_vehicles) {
            e_vehicle setmodel("veh_t9_mil_air_flogger_fly_napalm");
        }
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x1dac646a, Offset: 0x4ae0
// Size: 0x1dc
function function_a183efa3() {
    var_fa673a5a = level.player getweaponslist();
    level.w_current = level.player getcurrentweapon();
    grenade = getweapon(#"frag_grenade");
    var_1262a1ad = getweapon(#"gadget_health_regen");
    var_c41ecc2d = getweapon(#"null_offhand_primary");
    binoculars = getweapon("eq_binoculars");
    var_c3432005 = struct::get("struct_napalm_strike_call", "targetname");
    var_2fbdcecc = util::spawn_model("tag_origin", var_c3432005.origin, var_c3432005.angles);
    childthread function_f0ad2fa7(var_fa673a5a, binoculars, grenade, var_1262a1ad, var_c41ecc2d, var_2fbdcecc);
    childthread function_b610871f(var_2fbdcecc);
    var_2fbdcecc util::waittill_any_ents(var_2fbdcecc, "trigger", level, "flag_sniper_ridge_to_ground");
    function_70a9f84f();
    wait 0.25;
    thread function_aa8d26c2(var_fa673a5a, binoculars, grenade, var_1262a1ad, var_c41ecc2d);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0x23e9bf2a, Offset: 0x4cc8
// Size: 0x88
function function_b610871f(var_2fbdcecc) {
    if (level.var_4ae0af49 > 0) {
        wait 20 + level.var_4ae0af49;
    } else {
        wait 20;
        if (level.var_4ae0af49 > 0) {
            wait level.var_4ae0af49;
        }
    }
    level flag::set("flag_sniper_napalm_strike_called_in");
    var_2fbdcecc notify(#"trigger");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 6, eflags: 0x0
// Checksum 0x3413b47f, Offset: 0x4d58
// Size: 0x248
function function_f0ad2fa7(var_fa673a5a, binoculars, grenade, var_1262a1ad, var_c41ecc2d, var_2fbdcecc) {
    var_2fbdcecc endoncallback(&function_93e86638, #"trigger");
    level.var_4ae0af49 = 0;
    while (true) {
        level thread function_5ac12676();
        while (!level.player actionslotfourbuttonpressed()) {
            waitframe(1);
        }
        level flag::set("hold_context_melee");
        function_70a9f84f();
        level.w_current = level.player getcurrentweapon();
        level.player giveweapon(binoculars);
        level.player switchtoweapon(binoculars);
        level.var_4ae0af49 = 10;
        waitframe(1);
        level.player disableweaponcycling();
        wait 0.5;
        function_119dfa3(var_fa673a5a, binoculars, grenade, var_1262a1ad, var_c41ecc2d);
        childthread function_df641ff1(var_2fbdcecc);
        while (!level.player actionslotfourbuttonpressed()) {
            waitframe(1);
        }
        level.var_4ae0af49 = 0;
        level.player enableweaponcycling();
        level notify(#"hash_532b11970a5c4f3");
        thread function_aa8d26c2(var_fa673a5a, binoculars, grenade, var_1262a1ad, var_c41ecc2d);
        level flag::clear("hold_context_melee");
        wait 0.5;
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x4
// Checksum 0x4b8f5653, Offset: 0x4fa8
// Size: 0x3c
function private function_93e86638(*params) {
    function_70a9f84f();
    level flag::clear("hold_context_melee");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xb3e4292c, Offset: 0x4ff0
// Size: 0x34
function function_5ac12676() {
    level.player thread util::show_hint_text(#"hash_5cc39180504cb1c2", 0, undefined, -1);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x17bf3572, Offset: 0x5030
// Size: 0x1c
function function_70a9f84f() {
    level.player thread util::hide_hint_text();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 5, eflags: 0x0
// Checksum 0x5418a2ec, Offset: 0x5058
// Size: 0x158
function function_119dfa3(var_fa673a5a, *binoculars, grenade, var_1262a1ad, var_c41ecc2d) {
    if (isdefined(binoculars) && binoculars.size > 0) {
        foreach (w_player in binoculars) {
            var_c410d531 = 0;
            var_1170d6ba = 0;
            b_grenade = 0;
            if (w_player == grenade) {
                var_f8bec9ac = 1;
                b_grenade = 1;
            }
            if (w_player == var_1262a1ad) {
                var_c410d531 = 1;
            }
            if (w_player == var_c41ecc2d) {
                var_1170d6ba = 1;
            }
            if (!(b_grenade || var_c410d531 || var_1170d6ba)) {
                level.player takeweapon(w_player);
            }
        }
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 5, eflags: 0x0
// Checksum 0xe6ed9ab0, Offset: 0x51b8
// Size: 0x1d4
function function_aa8d26c2(var_fa673a5a, binoculars, grenade, var_1262a1ad, var_c41ecc2d) {
    level.player takeweapon(binoculars);
    level.player enableweaponcycling();
    var_9354f9af = level.player getweaponslist();
    if (isdefined(var_fa673a5a) && var_fa673a5a.size > 0) {
        foreach (w_player in var_fa673a5a) {
            var_c410d531 = 0;
            var_1170d6ba = 0;
            b_grenade = 0;
            if (w_player == grenade) {
                var_f8bec9ac = 1;
                b_grenade = 1;
            }
            if (w_player == var_1262a1ad) {
                var_c410d531 = 1;
            }
            if (w_player == var_c41ecc2d) {
                var_1170d6ba = 1;
            }
            if (!(b_grenade || var_c410d531 || var_1170d6ba)) {
                level.player giveweapon(w_player);
            }
        }
    }
    level.player switchtoweapon(level.w_current);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0x4b80395e, Offset: 0x5398
// Size: 0x2b8
function function_df641ff1(var_2fbdcecc) {
    level endon(#"hash_532b11970a5c4f3");
    vol_binoculars_house_target = getent("vol_binoculars_house_target", "targetname");
    level.var_a267c0bf = 0;
    level.var_e88d4a19 = 0;
    while (true) {
        if (!level.var_a267c0bf) {
            if (!isdefined(level.var_5a57e155)) {
                level.var_5a57e155 = 1;
                wait 2;
            }
            thread function_87efcf24();
        }
        waitframe(1);
        while (level.player adsbuttonpressed()) {
            timer = gettime() + 1000;
            while (level.player adsbuttonpressed() && gettime() < timer) {
                waitframe(1);
            }
            if (!level.player adsbuttonpressed()) {
                break;
            }
            if (level.var_a267c0bf && !level.player util::point_in_fov(vol_binoculars_house_target.origin, 0.86, 1)) {
                thread function_fea7e913();
            }
            waitframe(1);
            while (level.player util::point_in_fov(vol_binoculars_house_target.origin, 0.86, 1) && level.player adsbuttonpressed()) {
                if (!level.var_e88d4a19) {
                    thread function_73fb7422();
                    wait 0.5;
                }
                waitframe(1);
                if (level.player attackbuttonpressed()) {
                    level flag::set("flag_sniper_napalm_strike_called_in");
                    var_2fbdcecc notify(#"trigger");
                    return;
                }
                waitframe(1);
            }
            if (level.var_e88d4a19 || level.var_a267c0bf) {
                thread function_8e1cdc07();
            }
            waitframe(1);
        }
        waitframe(1);
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xcf7b9447, Offset: 0x5658
// Size: 0x5c
function function_87efcf24() {
    level endon(#"hash_c38c46ceddd13b7");
    level.var_a267c0bf = 1;
    level.player thread util::show_hint_text(#"hash_760432f2eb2d63e1", 0, undefined, -1);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xfbe7446d, Offset: 0x56c0
// Size: 0x44
function function_fea7e913() {
    level notify(#"hash_c38c46ceddd13b7");
    level.var_a267c0bf = 0;
    level.player thread util::hide_hint_text(0);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x49ea2829, Offset: 0x5710
// Size: 0x5c
function function_73fb7422() {
    level notify(#"hash_c38c46ceddd13b7");
    level.var_e88d4a19 = 1;
    level.player thread util::show_hint_text(#"hash_62f80260814b980", 0, undefined, -1);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xc602fdd7, Offset: 0x5778
// Size: 0x3c
function function_8e1cdc07() {
    level.var_e88d4a19 = 0;
    level.var_a267c0bf = 0;
    level.player thread util::hide_hint_text(0);
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x69517f37, Offset: 0x57c0
// Size: 0x11c
function function_91eed10c() {
    level thread spawn_manager::disable("sniper1_battle1_manager_right1");
    wait 0.75;
    var_e88bf7fc = getaiteamarray("axis");
    foreach (ai in var_e88bf7fc) {
        if (isalive(ai) && !ai flag::get("in_action")) {
            ai kill();
        }
    }
    thread function_4893cd62();
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x4a5869e5, Offset: 0x58e8
// Size: 0x1b4
function function_258720af() {
    level thread spawn_manager::kill("sniper1_battle1_manager_right1");
    wait 0.75;
    var_e88bf7fc = getaiteamarray("axis");
    foreach (ai in var_e88bf7fc) {
        if (isalive(ai) && !isvehicle(ai) && !ai flag::get("in_action")) {
            ai kill();
        }
    }
    thread function_4893cd62();
    level thread scene::play("napalm_fire_death1");
    level thread scene::play("napalm_fire_death2");
    level thread scene::play("napalm_fire_death3");
    level thread scene::play("napalm_fire_death6");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x5304a68c, Offset: 0x5aa8
// Size: 0xf0
function function_4893cd62() {
    var_e88bf7fc = getaiteamarray("allies");
    foreach (ai in var_e88bf7fc) {
        if (isalive(ai) && !isvehicle(ai)) {
            ai util::stop_magic_bullet_shield();
        }
        thread function_db356de2(ai);
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0x742a8b86, Offset: 0x5ba0
// Size: 0x11c
function function_db356de2(ai) {
    wait randomfloatrange(0.1, 0.25);
    if (isalive(ai) && !isvehicle(ai)) {
        ai.animname = "generic";
        ai animation::play("sdr_com_cover_crouch_pain01_head_md_r");
        wait randomfloatrange(1, 1.5);
        ai thread function_949352f4();
        namespace_d9b153b9::function_34961864(ai);
        if (isalive(ai)) {
            ai ai::set_behavior_attribute("demeanor", "patrol");
        }
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0x6f83bf69, Offset: 0x5cc8
// Size: 0x8c
function function_77759392() {
    wait 0.1;
    dialogue::radio("vox_cp_prsn_37200_pilo_rogerherewecome_e0");
    wait 7.4;
    wait 3;
    dialogue::radio("vox_cp_prsn_08800_adlr_insidethehouseh_65");
    namespace_b6fe1dbe::music("17.0_door_3", 2);
    wait 3;
    dialogue::radio("vox_cp_prsn_37200_ams2_gocheckitoutbel_35");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xb90f8b2b, Offset: 0x5d60
// Size: 0x14c
function function_949352f4() {
    if (isalive(self)) {
        if (isdefined(level.integer)) {
            level.integer += 1;
        } else {
            level.integer = 0;
        }
        if (level.integer == 0) {
            self thread dialogue::queue("vox_cp_prsn_37200_ams3_didyouseethatpl_e4");
            return;
        }
        if (level.integer == 1) {
            self thread dialogue::queue("vox_cp_prsn_37200_ams3_cheer_58");
            return;
        }
        if (level.integer == 2) {
            self thread dialogue::queue("vox_cp_prsn_37200_ams2_hellyeah_6d");
            return;
        }
        if (level.integer == 3) {
            self thread dialogue::queue("vox_cp_prsn_37200_ams2_cheer_58");
            return;
        }
        self thread dialogue::queue("vox_cp_prsn_37200_ams3_cheer_58");
    }
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 0, eflags: 0x0
// Checksum 0xd76ad5e8, Offset: 0x5eb8
// Size: 0x2a4
function function_a12d20d() {
    level flag::clear("flag_sniper_hut_non_destroy");
    level flag::set("flag_sniper_hut_destroy");
    level thread function_9a15793("model_sniper_hut_destroy");
    foreach (brush in level.var_d8a117f3) {
        if (isdefined(brush)) {
            brush show();
        }
    }
    var_5a1ebfd9 = getentarray("sniper_hut_non_destory_brush", "targetname");
    foreach (brush in var_5a1ebfd9) {
        brush hide();
    }
    var_5881b992 = getentarray("sniper_hut_destroy_brush", "targetname");
    foreach (brush in var_5881b992) {
        brush show();
    }
    clientfield::set("dmg_models_and_vol_decals_napalm_strike", 1);
    wait 0.8;
    level flag::clear("flag_sniper_hut_non_destroy_2");
    level flag::set("flag_sniper_hut_destroy_2");
}

// Namespace namespace_d12540d8/namespace_d12540d8
// Params 1, eflags: 0x0
// Checksum 0x7049014c, Offset: 0x6168
// Size: 0x15c
function function_9a15793(var_9854cbf7) {
    wait 1;
    foreach (sb in level.smart_bundle.var_84410238) {
        if (isdefined(sb.linkto) && isdefined(var_9854cbf7) && sb.linkto == var_9854cbf7) {
            if (isdefined(sb.var_454745b9)) {
                foreach (ent in sb.var_454745b9) {
                    if (isdefined(ent.model)) {
                        ent setnosunshadow();
                    }
                }
            }
        }
    }
}

