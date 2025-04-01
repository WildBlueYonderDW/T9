#using script_1cd690a97dfca36e;
#using scripts\core_common\array_shared;
#using scripts\core_common\audio_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\load_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\cp_common\snd;
#using scripts\cp_common\snd_draw;
#using scripts\cp_common\snd_utility;

#namespace namespace_e1ccb37b;

// Namespace namespace_e1ccb37b/level_preinit
// Params 1, eflags: 0x20
// Checksum 0x391ee4ef, Offset: 0x318
// Size: 0x8c
function event_handler[level_preinit] function_b489bb7b( *eventstruct )
{
    snd::function_d4ec748e( &function_f2a2832d );
    snd::function_ce78b33b( &function_32ab045 );
    snd::trigger_init( &_trigger );
    snd::function_5e69f468( &_objective );
}

// Namespace namespace_e1ccb37b/event_cc819519
// Params 1, eflags: 0x20
// Checksum 0x71a4962d, Offset: 0x3b0
// Size: 0x44
function event_handler[event_cc819519] function_686b88aa( *eventstruct )
{
    snd::wait_init();
    snd::waitforplayers();
    level thread snipercam();
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 2, eflags: 0x4
// Checksum 0x259b5273, Offset: 0x400
// Size: 0x11a
function private function_32ab045( ent, name )
{
    switch ( name )
    {
        case #"park":
            ent setsoundentcontext( "npc_gender", "female" );
            ent playsound( 0, "vox_takedowns_exert_muffled_struggle_short" );
            break;
        case #"lazar":
            break;
        case #"woods":
            break;
        case #"mason":
            break;
        default:
            /#
                snd::function_81fac19d( snd::function_d78e3644(), "<dev string:x38>" + snd::function_783b69( name, "<dev string:x5d>" ) );
            #/
            
            break;
    }
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 3, eflags: 0x4
// Checksum 0x37762dd9, Offset: 0x528
// Size: 0xc2
function private _trigger( *player, trigger, *var_ec80d14b )
{
    trigger_name = snd::function_ea2f17d1( var_ec80d14b.script_ambientroom, "$default" );
    
    switch ( trigger_name )
    {
        case #"$default":
            break;
        default:
            /#
                snd::function_81fac19d( snd::function_d78e3644(), "<dev string:x62>" + trigger_name + "<dev string:x5d>" );
            #/
            
            break;
    }
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 2, eflags: 0x4
// Checksum 0x61392f89, Offset: 0x5f8
// Size: 0x202
function private function_f2a2832d( *player, msg )
{
    switch ( msg )
    {
        case #"hash_770e0c1bde319120":
            level thread function_cd797f90();
            break;
        case #"hash_5cc6be68301e650c":
            level notify( #"hash_5cc6be68301e650c" );
            break;
        case #"hash_37663b49458855e1":
            thread function_fe5617ab();
            break;
        case #"start_combat":
            thread function_cae705ff();
            break;
        case #"hash_4e12ae023e25690a":
            level notify( #"hash_7ffd70d5d215f896" );
            break;
        case #"hash_14488fae2db8c286":
            function_5ea2c6e3( "cp_duga_fadeout_adler_mus", 15 );
            break;
        case #"ending_fade_out":
            wait 0.5;
            function_5ea2c6e3( "cp_mute_amb", 4.5 );
            break;
        case #"musictrack_cp_duga_1":
        case #"musictrack_cp_duga_2":
            function_2cca7b47( 0, msg );
            break;
        default:
            /#
                snd::function_81fac19d( snd::function_d78e3644(), "<dev string:x86>" + snd::function_783b69( msg, "<dev string:x5d>" ) );
            #/
            
            break;
    }
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 1, eflags: 0x4
// Checksum 0x20d3288d, Offset: 0x808
// Size: 0x122
function private _objective( objective )
{
    switch ( objective )
    {
        case #"comprimised":
            level thread function_cd797f90();
            break;
        case #"ambush":
            break;
        case #"loose_ends":
            thread function_85ebb65();
            break;
        case #"safehouse_burns":
            break;
        case #"hash_fde5a9c153fb103":
            break;
        case #"no_game":
        case #"hash_6e531fb9475df744":
            break;
        default:
            /#
                snd::function_81fac19d( snd::function_d78e3644(), "<dev string:xa4>" + objective + "<dev string:x5d>" );
            #/
            
            break;
    }
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 0, eflags: 0x0
// Checksum 0xc5a2b6ee, Offset: 0x938
// Size: 0x198
function snipercam()
{
    while ( true )
    {
        params = level waittill( #"hash_19171afd2fb4533e" );
        params = level waittill( #"snipercam_impact" );
        victim = params.victim;
        
        if ( isentity( victim ) && ishash( victim.aitype ) )
        {
            alias = undefined;
            
            if ( victim.aitype == #"hash_781db9049c2c6ddf" )
            {
                alias = "vox_duga_park_sniperdeath";
            }
            else if ( victim.aitype == #"hash_19de03b4f022b1d8" )
            {
                alias = "vox_duga_lazr_sniperdeath";
            }
            else if ( victim.aitype == #"hash_7ea7dd19debbc45d" )
            {
                alias = "vox_duga_masn_sniperdeath";
            }
            else if ( victim.aitype == #"hash_6cc1e6454859f3bc" )
            {
                alias = "vox_duga_wood_sniperdeath";
            }
            
            if ( isstring( alias ) )
            {
                snd::play( alias, [ victim, "j_head" ] );
            }
        }
    }
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 0, eflags: 0x0
// Checksum 0xf2b68ab, Offset: 0xad8
// Size: 0x152
function function_cd797f90()
{
    if ( is_true( level.var_cd797f90 ) )
    {
        return;
    }
    
    level.var_cd797f90 = 1;
    var_7de9bf5e = snd::play( "evt_cp_duga_intro_transmission_lp" );
    snd::set_volume( var_7de9bf5e, 0 );
    snd::set_volume( var_7de9bf5e, 1, 9, "linear" );
    function_5ea2c6e3( "cp_mute_amb", 0 );
    level waittill( #"hash_5cc6be68301e650c" );
    function_ed62c9c2( "cp_mute_amb", 5 );
    snd::set_volume( var_7de9bf5e, 0, 15, "linear" );
    wait 15;
    snd::stop( var_7de9bf5e );
    var_7de9bf5e = undefined;
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 0, eflags: 0x0
// Checksum 0xc89c671f, Offset: 0xc38
// Size: 0xc4
function execution()
{
    player = self;
    snd::play( "uin_duga_player_death", player );
    function_5ea2c6e3( "cp_duga_death_plr", 0, 1 );
    wait 4;
    function_5ea2c6e3( "cp_mute_amb", 3 );
    wait 3;
    wait 6;
    function_ed62c9c2( "cp_duga_death_plr", 3 );
    soundsetmusicstate( "" );
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 0, eflags: 0x0
// Checksum 0x87c6e140, Offset: 0xd08
// Size: 0x124
function function_fe5617ab()
{
    if ( is_true( level.var_fe5617ab ) )
    {
        return;
    }
    
    level.var_fe5617ab = 1;
    thread function_8a8739a();
    wait 0.78;
    snd::play( "evt_ambush_trap_walla" );
    level waittill( #"hash_5c0a0ad096590213" );
    thread function_fa75ffbf();
    var_a3537c6a = snd::play( "evt_ambush_dist_battle_lp" );
    var_fc73a46a = snd::play( "evt_ambush_battle_walla_lp" );
    level waittill( #"hash_7ffd70d5d215f896" );
    snd::stop( var_a3537c6a, 5 );
    snd::stop( var_fc73a46a, 5 );
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 0, eflags: 0x0
// Checksum 0x755aeeaa, Offset: 0xe38
// Size: 0x74
function function_fa75ffbf()
{
    thread function_d77090b3();
    wait 0.89;
    snd::play( "evt_ambush_smokescreen_throw", ( 18095, 8034, 405 ) );
    wait 1;
    snd::play( "evt_ambush_smokescreen", ( 18025, 8270, 376 ) );
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 0, eflags: 0x0
// Checksum 0x64ebab85, Offset: 0xeb8
// Size: 0x94
function function_8a8739a()
{
    if ( is_true( level.var_8a8739a ) )
    {
        return;
    }
    
    level.var_8a8739a = 1;
    function_5ea2c6e3( "cp_rus_duga_ambush", 2.9, 1 );
    level waittill( #"hash_5c0a0ad096590213" );
    function_ed62c9c2( "cp_rus_duga_ambush", 0.65 );
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 0, eflags: 0x0
// Checksum 0xdbc40454, Offset: 0xf58
// Size: 0x84
function function_d77090b3()
{
    if ( is_true( level.var_d77090b3 ) )
    {
        return;
    }
    
    level.var_d77090b3 = 1;
    function_5ea2c6e3( "cp_rus_duga_ambush_wakeup", 0.2, 1 );
    wait 7;
    function_ed62c9c2( "cp_rus_duga_ambush_wakeup", 6 );
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 0, eflags: 0x0
// Checksum 0x5f1d1807, Offset: 0xfe8
// Size: 0x5c
function function_cae705ff()
{
    if ( is_true( level.var_cae705ff ) )
    {
        return;
    }
    
    level.var_cae705ff = 1;
    function_5ea2c6e3( "cp_rus_duga_combat", 1, 1 );
}

// Namespace namespace_e1ccb37b/namespace_bf107587
// Params 0, eflags: 0x0
// Checksum 0x332079d2, Offset: 0x1050
// Size: 0x54
function function_85ebb65()
{
    if ( is_true( level.var_85ebb65 ) )
    {
        return;
    }
    
    level.var_85ebb65 = 1;
    function_ed62c9c2( "cp_rus_duga_combat", 1 );
}

