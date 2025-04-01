#using script_7728aa611ab72ad9;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\cp_common\gametypes\save;
#using scripts\cp_common\hms_util;
#using scripts\cp_common\objectives;
#using scripts\cp_common\skipto;
#using scripts\cp_common\spawn_manager;

#namespace namespace_1e9791b0;

// Namespace namespace_1e9791b0/namespace_1e9791b0
// Params 1, eflags: 0x0
// Checksum 0xd7a587dd, Offset: 0x248
// Size: 0x5c
function start( *str_objective )
{
    level hms_util::function_ee1d1df6( "woods", "Woods", "woods_rooftop_defend_2_start" );
    level flag::set( "flg_turn_on_rooftop_kill_volume" );
}

// Namespace namespace_1e9791b0/namespace_1e9791b0
// Params 2, eflags: 0x0
// Checksum 0xfbcca1a6, Offset: 0x2b0
// Size: 0x124
function main( *str_objective, *var_50cc0d4f )
{
    /#
        hms_util::print( "<dev string:x38>" );
    #/
    
    hms_util::function_eaa0342e( "rooftop_containment_warnings", "rooftop_containment_fails" );
    savegame::checkpoint_save();
    trigger::use( "defend_wave_2_woods_trigger", "targetname" );
    var_3f8b5025 = struct::get( "s_obj_exfil", "targetname" );
    objectives::goto( "obj_skyhook", var_3f8b5025.origin, #"hash_1434d5e6bc8057d2" );
    objectives::complete( "obj_skyhook" );
    skipto::function_4e3ab877( "rooftop_defend_2" );
    skipto::function_1c2dfc20( "cp_ger_hub_post_cuba" );
}

// Namespace namespace_1e9791b0/namespace_1e9791b0
// Params 0, eflags: 0x0
// Checksum 0x339ade95, Offset: 0x3e0
// Size: 0x4c
function function_5a5ce08a()
{
    level.woods hms_util::dialogue( "Switch cover! Switch cover!" );
    hms_util::dialogue( "(Spanish) There they are!", undefined, "axis", "Sandinista 01" );
}

/#

    // Namespace namespace_1e9791b0/namespace_1e9791b0
    // Params 4, eflags: 0x0
    // Checksum 0x3c37cd71, Offset: 0x438
    // Size: 0x44, Type: dev
    function cleanup( *str_objective, *var_50cc0d4f, *var_aa1a6455, *player )
    {
        hms_util::print( "<dev string:x55>" );
    }

#/
