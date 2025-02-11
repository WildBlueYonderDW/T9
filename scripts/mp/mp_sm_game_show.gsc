#using scripts\core_common\callbacks_shared;
#using scripts\core_common\compass;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\load_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;

#namespace mp_sm_game_show;

// Namespace mp_sm_game_show/level_init
// Params 1, eflags: 0x20
// Checksum 0x3e0c07c4, Offset: 0x298
// Size: 0x2f4
function event_handler[level_init] main(*eventstruct) {
    callback::on_game_playing(&on_game_playing);
    load::main();
    level thread function_3ffcd2d5();
    compass::setupminimap("");
    var_ff7645b0 = spawn("script_model", (-1385, -667, 100));
    var_ff7645b0.angles = (0, 295, 0);
    var_ff7645b0 setmodel("p8_box_case_metal_02_medium");
    var_ecb8a035 = spawn("script_model", (-1362, -656, 100));
    var_ecb8a035.angles = (0, 115, 0);
    var_ecb8a035 setmodel("p8_box_case_metal_02_medium");
    var_a41d0eff = spawn("script_model", (-1385, -667, 120));
    var_a41d0eff.angles = (0, 295, 0);
    var_a41d0eff setmodel("p8_box_case_metal_02_medium");
    var_1123690a = spawn("script_model", (-1362, -656, 120));
    var_1123690a.angles = (0, 115, 0);
    var_1123690a setmodel("p8_box_case_metal_02_medium");
    var_2a9b2c2f = spawn("script_model", (-1374, -662, 140));
    var_2a9b2c2f.angles = (0, 295, 0);
    var_2a9b2c2f setmodel("p8_wire_cover_heavy_01");
    spawncollision("collision_physics_wall_64x64x10", "collider", (-1374, -662, 112), (0, 295, 0));
    spawncollision("collision_nosight_wall_64x64x10", "collider", (-1374, -662, 112), (0, 295, 0));
}

// Namespace mp_sm_game_show/mp_sm_game_show
// Params 0, eflags: 0x0
// Checksum 0xa44f14ee, Offset: 0x598
// Size: 0x4c
function on_game_playing() {
    level thread function_baa39f6d();
    level thread function_e6202e1a();
    level thread function_76ddcd65();
}

// Namespace mp_sm_game_show/mp_sm_game_show
// Params 0, eflags: 0x0
// Checksum 0xb2a92af5, Offset: 0x5f0
// Size: 0x308
function function_3ffcd2d5() {
    level endon(#"game_ended");
    /#
        mapname = util::get_map_name();
        adddebugcommand("<dev string:x38>");
        adddebugcommand("<dev string:x74>" + mapname + "<dev string:x86>");
    #/
    car = getent("rotating_platform_car", "script_noteworthy");
    platform = getent("rotating_platform", "targetname");
    car_clip = getent("rotating_platform_car_clip", "targetname");
    var_fd220054 = [];
    var_fd220054[0] = getent("sn_light_car_01", "script_noteworthy");
    var_fd220054[1] = getent("sn_light_car_02", "script_noteworthy");
    if (isdefined(car) && isdefined(platform)) {
        car setmovingplatformenabled(1, 0, 0);
        car linkto(platform);
        foreach (var_9f2a8e14 in var_fd220054) {
            if (isdefined(var_9f2a8e14)) {
                var_9f2a8e14 linkto(platform);
            }
        }
        if (isdefined(car_clip)) {
            car_clip setmovingplatformenabled(1, 0, 0);
            car_clip linkto(car);
        }
    } else if (!isdefined(platform)) {
        return;
    }
    platform setmovingplatformenabled(1, 0, 0);
    while (isdefined(platform)) {
        platform rotateyaw(360, getdvarint(#"hash_262b953a67597cc5", 15));
        wait getdvarint(#"hash_262b953a67597cc5", 15);
    }
}

// Namespace mp_sm_game_show/mp_sm_game_show
// Params 0, eflags: 0x0
// Checksum 0x12456da3, Offset: 0x900
// Size: 0x74
function function_baa39f6d() {
    var_8758aaea = getent("rotating_wheel_trig", "targetname");
    var_8758aaea.wheel = getent("platform_wheel", "targetname");
    var_8758aaea callback::on_trigger(&function_bb08b9f6);
}

// Namespace mp_sm_game_show/mp_sm_game_show
// Params 1, eflags: 0x0
// Checksum 0xe2cc6909, Offset: 0x980
// Size: 0x1a6
function function_bb08b9f6(*var_e5f39703) {
    trigger = self;
    if (!isdefined(trigger) || is_true(trigger.busy)) {
        return;
    }
    wheel = trigger.wheel;
    if (!isdefined(wheel)) {
        return;
    }
    trigger endon(#"death");
    wheel endon(#"death");
    trigger.busy = 1;
    var_3b7c78b = getdvarint(#"hash_7aeff8148cf29c2", 0);
    if (!var_3b7c78b) {
        var_3b7c78b = randomintrangeinclusive(-1440, -720);
    }
    var_d4501b61 = getdvarint(#"hash_72c8755a0a93c1c5", 2);
    var_c9e087c6 = var_3b7c78b / -360;
    var_c94f53a4 = var_c9e087c6 * var_d4501b61;
    wheel rotatepitch(var_3b7c78b, var_c94f53a4, 1, 2);
    wheel thread function_95f19d80(var_c94f53a4);
    wheel waittill(#"rotatedone");
    trigger.busy = 0;
}

// Namespace mp_sm_game_show/mp_sm_game_show
// Params 1, eflags: 0x0
// Checksum 0x26b300c5, Offset: 0xb30
// Size: 0xdc
function function_95f19d80(var_c94f53a4) {
    wheel = self;
    wheel endon(#"death");
    wheel playsound("amb_wheel_start");
    wheel playloopsound("amb_wheel_loop");
    var_2154e5bc = var_c94f53a4 - 3;
    wait var_2154e5bc;
    wheel stoploopsound();
    wheel playsound("amb_wheel_slow");
    wait 2;
    wheel playsound("amb_wheel_end");
}

// Namespace mp_sm_game_show/mp_sm_game_show
// Params 0, eflags: 0x0
// Checksum 0x43efb465, Offset: 0xc18
// Size: 0xe8
function function_e6202e1a() {
    var_8fec580f = getentarray("buzzer_trig", "targetname");
    foreach (buzzer_trig in var_8fec580f) {
        var_dcaf4972 = struct::get(buzzer_trig.target);
        buzzer_trig callback::on_trigger(&function_ed6e936b, undefined, var_dcaf4972);
    }
}

// Namespace mp_sm_game_show/mp_sm_game_show
// Params 2, eflags: 0x0
// Checksum 0xe299ac9e, Offset: 0xd08
// Size: 0xc6
function function_ed6e936b(*var_626fec81, var_dcaf4972) {
    trigger = self;
    if (!isdefined(trigger) || is_true(trigger.busy)) {
        return;
    }
    level endon(#"game_ended");
    trigger endon(#"death");
    trigger.busy = 1;
    var_89c89228 = var_dcaf4972.origin;
    playsoundatposition("amb_buzzer", var_89c89228);
    wait 5;
    trigger.busy = 0;
}

// Namespace mp_sm_game_show/mp_sm_game_show
// Params 0, eflags: 0x0
// Checksum 0x7e38203c, Offset: 0xdd8
// Size: 0xcc
function function_76ddcd65() {
    if (function_be90acca(getdvarstring(#"g_gametype")) === #"gunfight") {
        zone = level.zones[0];
        if (isdefined(zone) && isdefined(zone.gameobject)) {
            level endon(#"game_ended");
            zone.gameobject waittill(#"zone_captured");
            exploder::exploder("fxexp_flag_confetti");
        }
    }
}

