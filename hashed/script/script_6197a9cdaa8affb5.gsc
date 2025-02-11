#using script_1351b3cdb6539f9b;
#using script_2d443451ce681a;
#using script_32399001bdb550da;
#using script_61fee52bb750ac99;
#using script_6ee68b6afcbff255;
#using scripts\core_common\ai_shared;
#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\load_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\cp_common\bb;
#using scripts\cp_common\dialogue;
#using scripts\cp_common\gametypes\battlechatter;
#using scripts\cp_common\objectives;
#using scripts\cp_common\skipto;
#using scripts\cp_common\util;

#namespace namespace_d09d57dd;

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 1, eflags: 0x0
// Checksum 0x9826aec8, Offset: 0x8b8
// Size: 0xc
function start(*str_objective) {
    
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 2, eflags: 0x0
// Checksum 0xc90fd1d4, Offset: 0x8d0
// Size: 0x2c
function main(str_objective, *var_50cc0d4f) {
    level thread namespace_d9b153b9::start_outro(var_50cc0d4f);
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 4, eflags: 0x0
// Checksum 0x9f0333c0, Offset: 0x908
// Size: 0x24
function cleanup(*str_objective, *var_50cc0d4f, *var_aa1a6455, *player) {
    
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x9cc54843, Offset: 0x938
// Size: 0x64
function function_c26b0bc0() {
    level flag::init("creek_path_completed");
    level flag::init("creek_path_visit1_anim_done");
    level flag::init("stop_creek_path_scene");
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xe2972df, Offset: 0x9a8
// Size: 0x24
function function_a08d5cab() {
    level flag::clear("flag_creek_path_enter");
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xe47b2e35, Offset: 0x9d8
// Size: 0x116
function creek_path() {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    var_c79d614f = "creek_path";
    level childthread function_8e7e433f();
    level flag::wait_till("flag_" + var_c79d614f);
    while (true) {
        level thread namespace_d9b153b9::function_a57f6629(var_c79d614f);
        level function_167dbbfe(var_c79d614f);
        if (level flag::get(var_c79d614f + "_completed")) {
            break;
        }
        wait 1;
        level flag::wait_till("flag_" + var_c79d614f);
        waitframe(1);
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xdfc14b30, Offset: 0xaf8
// Size: 0x18
function function_2f7a35e0() {
    level notify(#"hash_48117f07e3e52886");
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 1, eflags: 0x0
// Checksum 0xf1b93f7c, Offset: 0xb18
// Size: 0x284
function function_167dbbfe(var_c79d614f) {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(var_c79d614f + "_end");
    level.var_3f5c80c8 = "creek_path";
    level thread function_6a625b9d(var_c79d614f);
    level thread savegame::checkpoint_save();
    level thread function_2f7a35e0();
    level thread function_cc015041(var_c79d614f);
    if (!level flag::get("exit_ready")) {
        if (level.var_731c10af.paths[var_c79d614f].count == 0) {
            creek1_visit1(var_c79d614f);
        } else if (level.var_731c10af.paths[var_c79d614f].count == 1) {
            creek1_visit2(var_c79d614f);
        } else if (level.var_731c10af.paths[var_c79d614f].count >= 2) {
            function_8903ce3d(var_c79d614f);
        }
    }
    level flag::wait_till("flag_creek_path_complete");
    namespace_d9b153b9::function_e106e062(var_c79d614f);
    level flag::set(var_c79d614f + "_completed");
    var_2cf9fe23 = level.var_731c10af.var_42659717 + 1;
    str = "visit_" + var_2cf9fe23 + "_" + var_c79d614f + "_" + level.var_731c10af.paths[var_c79d614f].count;
    bb::function_cd497743(str, level.player);
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 1, eflags: 0x0
// Checksum 0x311188ab, Offset: 0xda8
// Size: 0x1b8
function function_cc015041(var_c79d614f) {
    level notify(#"hash_6495833ca8600c9f");
    level endon(#"hash_6495833ca8600c9f");
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(var_c79d614f + "_completed");
    while (true) {
        level flag::wait_till(var_c79d614f + "_exited");
        level flag::clear("flag_" + var_c79d614f);
        level flag::clear("flag_adler_creek_disappear");
        level flag::clear("creek1_visit1_bundle1_flag_true");
        level flag::clear("creek1_visit2_bundle1_flag_true");
        level flag::clear("creek1_visit3_bundle1_flag_true");
        level flag::clear("flag_creek_path_enter");
        wait 1;
        level flag::wait_till("flag_" + var_c79d614f);
        level flag::clear(var_c79d614f + "_exited");
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 1, eflags: 0x0
// Checksum 0xfd120727, Offset: 0xf68
// Size: 0x19c
function creek1_visit1(var_c79d614f) {
    level.player endon(#"death");
    if (isdefined(level.var_731c10af.var_42659717) && level.var_731c10af.var_42659717 == 2) {
        level thread function_cf52d388();
    }
    level flag::set("creek1_visit1_bundle1_flag_true");
    spawner::add_spawn_function_group("creek1_visit1_enemy", "targetname", &function_49fc870a);
    var_7ffc83a6 = smart_bundle::function_6c12ff6("creek1_visit1_bundle1");
    var_7ffc83a6 smart_bundle::function_e47ac090();
    childthread function_d6f5e167();
    childthread function_626e852f();
    childthread function_209f1bf7();
    function_c3211895(var_c79d614f);
    if (!level flag::get(var_c79d614f + "_exited")) {
        level flag::set("flag_creek_path_complete");
    }
    level thread function_2598b1bd();
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x60f29a06, Offset: 0x1110
// Size: 0x64
function function_49fc870a() {
    self endon(#"death");
    self battlechatter::function_2ab9360b(0);
    level flag::wait_till("stealth_spotted");
    self battlechatter::function_2ab9360b(1);
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x5e1c6abc, Offset: 0x1180
// Size: 0x414
function function_d6f5e167() {
    aienemies = getaiarray("creek1_visit1", "script_aigroup");
    foreach (guy in aienemies) {
        if (isdefined(guy.script_noteworthy) && guy.script_noteworthy == "creek1_visit1_enemy_03") {
            level.var_bb215c66 = guy;
        }
        if (isdefined(guy.script_noteworthy) && guy.script_noteworthy == "creek1_visit1_enemy_04") {
            level.var_55ba1151 = guy;
        }
        guy endon(#"death");
        guy endon(#"set_alert_level");
        guy thread namespace_d9b153b9::function_c9fa31e();
    }
    if (isalive(level.var_bb215c66) && isalive(level.var_55ba1151)) {
        level.var_bb215c66 dialogue::queue("vox_cp_prsn_30000_vms1_anything_81");
    }
    wait 0.25;
    if (isalive(level.var_bb215c66) && isalive(level.var_55ba1151)) {
        level.var_55ba1151 dialogue::queue("vox_cp_prsn_30000_vms2_nodoesntlooklik_d4");
    }
    wait 0.25;
    if (isalive(level.var_bb215c66) && isalive(level.var_55ba1151)) {
        level.var_55ba1151 dialogue::queue("vox_cp_prsn_30000_vms1_report_9d");
    }
    if (isalive(level.var_bb215c66) && isalive(level.var_55ba1151)) {
        level.var_bb215c66 dialogue::queue("vox_cp_prsn_30000_vms3_clearoverhere_a8");
    }
    wait 0.75;
    if (isalive(level.var_bb215c66) && isalive(level.var_55ba1151)) {
        level.var_55ba1151 dialogue::queue("vox_cp_prsn_30000_vms2_clear_08");
    }
    wait 1;
    if (isalive(level.var_bb215c66) && isalive(level.var_55ba1151)) {
        level.var_55ba1151 dialogue::queue("vox_cp_prsn_30000_vms1_keepyoureyesope_26");
    }
    wait 0.25;
    if (isalive(level.var_bb215c66) && isalive(level.var_55ba1151)) {
        level.var_bb215c66 dialogue::queue("vox_cp_prsn_30000_vms2_agreedtheylikes_b6");
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x68f16359, Offset: 0x15a0
// Size: 0x84
function function_626e852f() {
    a_enemies = getaiarray("creek1_visit1_enemy_anim", "script_noteworthy");
    array::thread_all(a_enemies, &function_9aa6ee0e);
    level scene::play_from_time("scene_creek_visit1", "Shot 1", a_enemies, 0.25, undefined, 1);
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x6239731c, Offset: 0x1630
// Size: 0x44
function function_9aa6ee0e() {
    self waittill(#"death", #"damage");
    level flag::set("stop_creek_path_scene");
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 1, eflags: 0x0
// Checksum 0x91b3c03f, Offset: 0x1680
// Size: 0x94
function function_c3211895(*var_c79d614f) {
    level endon(#"flag_creek_path_complete");
    wait 0.25;
    aienemies = getaiarray("creek1_visit1", "script_aigroup");
    function_1eaaceab(aienemies);
    if (aienemies.size > 0) {
        level ai::waittill_dead(aienemies, aienemies.size);
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x550ad1ed, Offset: 0x1720
// Size: 0x134
function function_209f1bf7() {
    level flag::wait_till_any(array("stealth_spotted", "stop_creek_path_scene"));
    level scene::stop("scene_creek_visit1");
    wait 1;
    level thread ai::function_3ff06c1e("creek1_visit1_enemy", "creek1_volume1", 1);
    aiarray = getaiarray("creek1_visit1_enemy", "targetname");
    function_1eaaceab(aiarray);
    if (aiarray.size > 0) {
        var_7921bd8a = int(floor(aiarray.size / 2));
        level ai::function_3ff06c1e("creek1_visit1_enemy", "creek1_volume2", 1, var_7921bd8a, undefined, undefined);
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 1, eflags: 0x0
// Checksum 0x37f76139, Offset: 0x1860
// Size: 0x23c
function creek1_visit2(var_c79d614f) {
    level.player endon(#"death");
    if (isdefined(level.var_731c10af.var_42659717) && level.var_731c10af.var_42659717 == 2) {
        level thread function_cf52d388();
    }
    level flag::set("creek1_visit2_bundle1_flag_true");
    level thread function_51a866f6();
    level flag::wait_till("flag_creek_path_enter");
    aienemies = getaiarray("creek1_visit2", "script_aigroup");
    foreach (ai in aienemies) {
        if (isalive(ai)) {
            ai.ignoreall = 0;
            ai.grenadeammo = 0;
        }
    }
    if (isalive(aienemies[0])) {
        aienemies[0] thread dialogue::queue("vox_cp_prsn_30100_vms2_americantakehim_3d");
    }
    function_fa03764a(var_c79d614f, aienemies);
    if (!level flag::get(var_c79d614f + "_exited")) {
        level flag::set("flag_creek_path_complete");
    }
    level thread function_2598b1bd();
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 2, eflags: 0x0
// Checksum 0xdb074210, Offset: 0x1aa8
// Size: 0x64
function function_fa03764a(*var_c79d614f, aienemies) {
    level endon(#"flag_creek_path_complete");
    function_1eaaceab(aienemies);
    if (aienemies.size > 0) {
        level ai::waittill_dead(aienemies, aienemies.size);
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xcbe9917, Offset: 0x1b18
// Size: 0x244
function function_51a866f6() {
    level.player endon(#"death");
    wait 0.5;
    aienemies = getaiarray("creek_sniper_death1", "script_noteworthy");
    aienemies[0] endon(#"death");
    util::waittill_any_ents(aienemies[0], "damage", level, "flag_in_end_path");
    if (!level flag::get("flag_in_end_path")) {
        level.player playhitmarker(undefined, 5, undefined, 1);
        aienemies[0] disableaimassist();
        aienemies[0] battlechatter::function_2ab9360b(0);
        aienemies[0].nodamagefeedback = 1;
        aienemies[0].diequietly = 1;
        aienemies[0].allowpain = 0;
        aienemies[0].team = "none";
        aienemies[0].ignoresuppression = 1;
        aienemies[0].disablebulletwhizbyreaction = 1;
        aienemies[0].var_b81bb500 = 1;
        aienemies[0].dodangerreact = 0;
        aienemies[0].a.disablepain = 1;
        level thread scene::play("scene_creek_sniper_death", aienemies);
        level flag::wait_till("flag_in_end_path");
        level scene::stop("scene_creek_sniper_death");
        level scene::delete_scene_spawned_ents("scene_creek_sniper_death");
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 1, eflags: 0x0
// Checksum 0x6335987f, Offset: 0x1d68
// Size: 0x20c
function function_8903ce3d(var_c79d614f) {
    level.player endon(#"death");
    if (isdefined(level.var_731c10af.var_42659717) && level.var_731c10af.var_42659717 == 2) {
        level thread function_cf52d388();
    }
    level flag::set("creek1_visit3_bundle1_flag_true");
    wait 0.25;
    level ai::function_d49a69a0("creek1_visit3_enemy", "creek1_volume1", 1);
    aiarray = getaiarray("creek1_visit3_enemy", "targetname");
    function_1eaaceab(aiarray);
    if (aiarray.size > 0) {
        var_7921bd8a = int(floor(aiarray.size / 2));
        level ai::function_d49a69a0("creek1_visit3_enemy", "creek1_volume2", 1, var_7921bd8a);
    }
    aienemies = getaiarray("creek1_visit3_enemy", "targetname");
    function_12332333(aienemies);
    if (!level flag::get(var_c79d614f + "_exited")) {
        level flag::set("flag_creek_path_complete");
    }
    level thread function_2598b1bd();
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 1, eflags: 0x0
// Checksum 0x3fe107bb, Offset: 0x1f80
// Size: 0x5c
function function_12332333(aienemies) {
    level endon(#"flag_creek_path_complete");
    function_1eaaceab(aienemies);
    if (aienemies.size > 0) {
        level ai::waittill_dead(aienemies, aienemies.size);
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x3e64fed1, Offset: 0x1fe8
// Size: 0x64
function function_8e7e433f() {
    if (!isdefined(level.var_71cc355e) || isdefined(level.var_71cc355e) && !array::contains(level.var_71cc355e, "struct_ghost_convo4")) {
        namespace_d9b153b9::function_48926a5f("struct_ghost_convo4");
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 1, eflags: 0x0
// Checksum 0x658405d2, Offset: 0x2058
// Size: 0x294
function function_6a625b9d(var_c79d614f) {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(#"hash_1314cbd25bca805d");
    if (isdefined(level.var_731c10af.var_42659717) && (level.var_731c10af.var_42659717 == 0 || level.var_731c10af.var_42659717 == 1)) {
        if (level.var_baa7cf92 == "caves" || level.var_baa7cf92 == "rat_tunnels") {
            if (level flag::get("flag_jungle_path_fork_left_hit")) {
                thread namespace_b6fe1dbe::function_1e0e9b39(var_c79d614f);
                dialogue::radio("vox_cp_prsn_02000_adlr_areyousureyouev_ae");
            }
        } else if (level.var_baa7cf92 == "village" || level.var_baa7cf92 == "sniper_overlook") {
            thread namespace_b6fe1dbe::function_34830cda(var_c79d614f);
        }
        return;
    }
    if (isdefined(level.var_731c10af.var_42659717) && level.var_731c10af.var_42659717 == 2) {
        if (level.var_baa7cf92 == "caves" || level.var_baa7cf92 == "rat_tunnels") {
            thread namespace_b6fe1dbe::function_1e0e9b39(var_c79d614f);
            if (isdefined(level.var_731c10af.var_58ca484f)) {
                dialogue::radio("vox_cp_prsn_08000_adlr_stopfightingmeb_5c");
            } else {
                dialogue::radio("vox_cp_prsn_08000_adlr_thebunkerisrigh_37");
            }
            dialogue::radio("vox_cp_prsn_08400_adlr_gobackandtaketh_24");
            return;
        }
        if (level.var_baa7cf92 == "village" || level.var_baa7cf92 == "sniper_overlook") {
            thread namespace_b6fe1dbe::function_34830cda(var_c79d614f);
        }
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xd297b64a, Offset: 0x22f8
// Size: 0x44
function function_876504dd() {
    flag::wait_till("flag_creek_path_exited_start");
    namespace_d9b153b9::function_f76551eb("vox_cp_prsn_14400_adlr_parkprepanother_67", "vox_cp_prsn_14400_adlr_lazarprepanothe_d3", "vox_cp_prsn_14400_adlr_simsprepanother_a1");
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x475aad86, Offset: 0x2348
// Size: 0xb4
function function_c6246f35() {
    flag::wait_till("flag_creek_path_waterfall_exit");
    if (level.var_baa7cf92 == "caves" || level.var_baa7cf92 == "rat_tunnels") {
        dialogue::radio("vox_cp_prsn_14400_adlr_goodwerebackont_c0");
        return;
    }
    if (level.var_baa7cf92 == "village" || level.var_baa7cf92 == "sniper_overlook") {
        dialogue::radio("vox_cp_prsn_14400_adlr_thatwasntinyour_a9");
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xb368db4f, Offset: 0x2408
// Size: 0x114
function function_2598b1bd() {
    level endon(#"visit_restart");
    level endon(#"start_outro");
    level endon(#"hash_1314cbd25bca805d");
    var_92038e98 = struct::get("struct_creek_path_upper_falls", "targetname");
    var_a190fde = struct::get("struct_creek_path_distant_tower", "targetname");
    level childthread function_abc08ce8();
    level childthread namespace_d9b153b9::function_d683b544(&function_20a45b84, var_92038e98.origin, 1.5);
    level childthread namespace_d9b153b9::function_d683b544(&function_bb4b8d4, var_a190fde.origin, 1.5);
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xadd8d1e7, Offset: 0x2528
// Size: 0xf4
function function_abc08ce8() {
    level endon(#"hash_1314cbd25bca805d");
    level.player endon(#"death");
    vol = getent("creek_path_water_volume", "targetname");
    while (true) {
        while (!level.player istouching(vol)) {
            wait 0.5;
        }
        level thread function_fc9e06c6();
        while (level.player istouching(vol)) {
            wait 0.5;
        }
        level notify(#"hash_acab12cf8f3a2fc");
    }
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x91b9c27e, Offset: 0x2628
// Size: 0x64
function function_fc9e06c6() {
    level endon(#"hash_1314cbd25bca805d");
    level endon(#"hash_acab12cf8f3a2fc");
    level childthread namespace_d9b153b9::function_f6cbf7fd(&function_c0ae8abc, 1, 5, "flag_bridge_path");
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0x64a3c714, Offset: 0x2698
// Size: 0x34
function function_c0ae8abc() {
    level endon(#"hash_1314cbd25bca805d");
    dialogue::radio("vox_cp_prsn_14400_adlr_idontcarehowgoo_2d");
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xf81c4fc, Offset: 0x26d8
// Size: 0x34
function function_20a45b84() {
    level endon(#"hash_1314cbd25bca805d");
    dialogue::radio("vox_cp_prsn_14400_adlr_wellitsagoddamn_cb");
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xc729d6cd, Offset: 0x2718
// Size: 0x1a
function function_bb4b8d4() {
    level endon(#"hash_1314cbd25bca805d");
}

// Namespace namespace_d09d57dd/namespace_d09d57dd
// Params 0, eflags: 0x0
// Checksum 0xe4c2bf93, Offset: 0x2740
// Size: 0x74
function function_cf52d388() {
    level thread scene::play("scene_pri_creek_observe", "shot 1");
    level flag::wait_till("flag_adler_creek_disappear");
    level scene::play("scene_pri_creek_observe", "shot 2");
}

