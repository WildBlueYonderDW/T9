#using script_67ce8e728d8f37ba;
#using script_72d96920f15049b8;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\compass;
#using scripts\core_common\flag_shared;
#using scripts\core_common\load_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\util_shared;

#namespace wz_duga;

// Namespace wz_duga/wz_duga
// Params 0, eflags: 0x5
// Checksum 0x5a79056d, Offset: 0x340
// Size: 0x64
function private autoexec function_6a8a6c0e()
{
    gametype = getdvarstring( #"g_gametype" );
    
    if ( gametype != "zsurvival" )
    {
        setgametypesetting( #"hash_21ac269b4a3e7e37", 0 );
    }
}

// Namespace wz_duga/level_init
// Params 1, eflags: 0x20
// Checksum 0x7f20f0d8, Offset: 0x3b0
// Size: 0x1dc
function event_handler[level_init] main( *eventstruct )
{
    /#
        callback::on_vehicle_spawned( &debug_vehicle_spawn );
    #/
    
    load::main();
    level.var_e1206a08 = 1;
    
    /#
        level thread function_f9492b33();
    #/
    
    namespace_66d6aa44::function_3f3466c9();
    scene::function_497689f6( #"cin_hpc_intro", "hpc_intro_air_transport", "tag_probe_attach", "probe_hpc_intro_hero_plane" );
    scene::function_497689f6( #"cin_hpc_intro_allies", "hpc_intro_air_transport", "tag_probe_attach", "probe_hpc_intro_hero_plane" );
    scene::function_497689f6( #"cin_hpc_outro", "helicopter", "tag_probe_cabin", "prb_tn_us_heli_lg_cabin" );
    scene::function_497689f6( #"cin_hpc_outro", "helicopter", "tag_probe_cockpit", "prb_tn_us_heli_lg_cockpit" );
    compass::setupminimap( "" );
    function_564698fd();
    function_a387f4f5();
    function_e8fa58f2();
    function_6708490a();
    setdvar( #"hash_7b06b8037c26b99b", 90 );
}

// Namespace wz_duga/wz_duga
// Params 0, eflags: 0x0
// Checksum 0xf6e6698e, Offset: 0x598
// Size: 0x19c
function function_e8fa58f2()
{
    hidemiscmodels( "sv_holdout_aetherfungus" );
    hidemiscmodels( "defend_corpses_1" );
    hidemiscmodels( "defend_corpses_2" );
    hidemiscmodels( "defend_corpses_3" );
    hidemiscmodels( "hvt_mechz_corpses" );
    hidemiscmodels( "hvt_mimic_corpses" );
    hidemiscmodels( "hvt_raz_corpses" );
    hidemiscmodels( "hvt_steiner_corpses" );
    hidemiscmodels( "payload_teleport_corpses" );
    hidemiscmodels( "payload_noteleport_corpses" );
    hidemiscmodels( "retrieval_corpses" );
    hidemiscmodels( "secure_corpses" );
    hidemiscmodels( "hordehunt_corpses_1" );
    hidemiscmodels( "hordehunt_corpses_2" );
    hidemiscmodels( "hordehunt_corpses_3" );
    hidemiscmodels( "fishing_setup" );
    hidemiscmodels( "transport_corpses" );
}

// Namespace wz_duga/wz_duga
// Params 0, eflags: 0x0
// Checksum 0xd7a762f8, Offset: 0x740
// Size: 0x7c
function function_564698fd()
{
    gametype = function_be90acca( util::get_game_type() );
    
    if ( gametype === "zsurvival" )
    {
        namespace_e8c18978::function_d887d24d( "chopper_gunner_vol_duga_1" );
        namespace_e8c18978::function_d887d24d( "chopper_gunner_vol_duga_2" );
    }
}

// Namespace wz_duga/wz_duga
// Params 0, eflags: 0x0
// Checksum 0x68bcc9e0, Offset: 0x7c8
// Size: 0x1ce
function function_6708490a()
{
    gametype = function_be90acca( util::get_game_type() );
    
    if ( gametype === "zsurvival" )
    {
        var_dfbe3535 = [ ( 10027, 10335, -482 ), ( -11835, 536, -52 ), ( -10547, 1854, -54 ) ];
        
        foreach ( position in var_dfbe3535 )
        {
            dynents = function_c3d68575( position, ( 200, 200, 32 ) );
            
            foreach ( dynent in dynents )
            {
                if ( dynent.var_15d44120 === #"p9_fxanim_wz_rus_door_garage_sliding_large_01_mod" )
                {
                    dynent.var_993e9bb0 = 1;
                }
            }
        }
    }
}

// Namespace wz_duga/wz_duga
// Params 0, eflags: 0x0
// Checksum 0x3b1ed02b, Offset: 0x9a0
// Size: 0x19c
function function_a387f4f5()
{
    if ( level.basegametype == #"fireteam_dirty_bomb" || level.basegametype == #"fireteam_elimination" || level.basegametype == #"fireteam_koth" || level.basegametype == #"fireteam_satlink" )
    {
        /#
            level thread function_f9492b33();
        #/
        
        if ( isdefined( level.var_574cc797 ) )
        {
            level thread [[ level.var_574cc797 ]]( #"hash_5f27e6f2e23fc18e", level.var_b9f31e66 );
            level thread [[ level.var_574cc797 ]]( #"hash_5f27e5f2e23fbfdb", level.var_b9f31e66 );
            level thread [[ level.var_574cc797 ]]( #"hash_5f27e4f2e23fbe28", level.var_b9f31e66 );
            level thread [[ level.var_574cc797 ]]( #"hash_5f27ebf2e23fca0d", level.var_b9f31e66 );
            level thread [[ level.var_574cc797 ]]( #"hash_5f27eaf2e23fc85a", level.var_b9f31e66 );
            level thread [[ level.var_574cc797 ]]( #"hash_5f27e9f2e23fc6a7", level.var_b9f31e66 );
        }
    }
}

/#

    // Namespace wz_duga/wz_duga
    // Params 0, eflags: 0x0
    // Checksum 0xcd828bf7, Offset: 0xb48
    // Size: 0x1c, Type: dev
    function debug_vehicle_spawn()
    {
        self thread function_f42944c7();
    }

    // Namespace wz_duga/wz_duga
    // Params 0, eflags: 0x0
    // Checksum 0x1a808f96, Offset: 0xb70
    // Size: 0x41e, Type: dev
    function function_f42944c7()
    {
        if ( !getdvarint( #"hash_57a9b32c8a8503f1", 0 ) || !self function_1221d304() )
        {
            return;
        }
        
        self endon( #"death" );
        
        if ( !isdefined( level.var_6eef6733 ) )
        {
            level.var_6eef6733 = [];
        }
        
        if ( !isdefined( level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] ) )
        {
            level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] = [];
        }
        
        if ( !isdefined( level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] ) )
        {
            level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] = [];
        }
        else if ( !isarray( level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] ) )
        {
            level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] = array( level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] );
        }
        
        level.var_6eef6733[ function_9e72a96( self.vehicletype ) ][ level.var_6eef6733[ function_9e72a96( self.vehicletype ) ].size ] = self;
        v_spawn_pos = self.origin;
        level thread function_f567f0cd();
        level flag::wait_till( "<dev string:x38>" );
        str_type = function_9e72a96( self.vehicletype );
        v_color = self function_b2775b52();
        
        while ( getdvarint( #"hash_57a9b32c8a8503f1", 0 ) )
        {
            var_91d1913b = distance2d( level.players[ 0 ].origin, self.origin );
            n_radius = 0.015 * var_91d1913b;
            
            if ( n_radius > 768 )
            {
                n_radius = 768;
            }
            
            if ( var_91d1913b > 768 )
            {
                sphere( self.origin, n_radius, v_color );
                
                if ( var_91d1913b < 2048 )
                {
                    print3d( self.origin + ( 0, 0, 32 ), str_type, v_color );
                }
            }
            
            if ( getdvarint( #"hash_491fd7f96bbc8909", 0 ) && distance2d( v_spawn_pos, self.origin ) > 768 )
            {
                line( v_spawn_pos, self.origin, v_color );
                circle( v_spawn_pos, 64, v_color, 0, 1 );
            }
            
            waitframe( 1 );
        }
    }

    // Namespace wz_duga/wz_duga
    // Params 0, eflags: 0x0
    // Checksum 0x565f6fb5, Offset: 0xf98
    // Size: 0x276, Type: dev
    function function_f567f0cd()
    {
        level notify( #"hash_79845fe0e187bb22" );
        level endon( #"hash_79845fe0e187bb22" );
        
        while ( getdvarint( #"hash_57a9b32c8a8503f1", 0 ) )
        {
            n_total = 0;
            var_bd9acc19 = 176;
            
            foreach ( var_f0ffe8b2 in level.var_6eef6733 )
            {
                var_bd9acc19 += 24;
                n_total += var_f0ffe8b2.size;
                
                foreach ( var_3ed342fe in var_f0ffe8b2 )
                {
                    if ( isvehicle( var_3ed342fe ) && isdefined( var_f0ffe8b2 ) && isdefined( var_f0ffe8b2[ 0 ] ) && isdefined( var_f0ffe8b2[ 0 ].vehicletype ) )
                    {
                        debug2dtext( ( 810, var_bd9acc19, 0 ), function_9e72a96( var_f0ffe8b2[ 0 ].vehicletype ) + "<dev string:x50>" + var_f0ffe8b2.size, var_3ed342fe function_b2775b52() );
                        break;
                    }
                }
            }
            
            debug2dtext( ( 810, 176, 0 ), "<dev string:x56>" + n_total, ( 1, 1, 1 ) );
            waitframe( 1 );
        }
    }

    // Namespace wz_duga/wz_duga
    // Params 0, eflags: 0x0
    // Checksum 0x63418375, Offset: 0x1218
    // Size: 0x1de, Type: dev
    function function_1221d304()
    {
        a_str_types = array( #"veh_quad_player_wz_blk", #"hash_232abda4e81275f4", #"veh_quad_player_wz_grn", #"hash_2f8d60a5381870ee", #"veh_quad_player_wz_tan", #"veh_mil_ru_fav_heavy", #"vehicle_t9_mil_fav_light", #"hash_42b91f3544c1a9e1", #"hash_6595f5efe62a4ec", #"hash_17e868e0ebf3c1d6", #"vehicle_motorcycle_mil_us_offroad", #"hash_2c0e11a1e87bbcd5", #"vehicle_t9_mil_snowmobile", #"hash_28d512b739c9d9c1", #"hash_2d32c08b862baa46", #"vehicle_t9_mil_ru_truck_light_player", #"hash_2a245bf3738fed8b", #"vehicle_t9_civ_ru_sedan_80s_player", #"hash_dd63f34c77a725e" );
        
        foreach ( str_type in a_str_types )
        {
            if ( self.vehicletype == str_type )
            {
                return 1;
            }
        }
        
        return 0;
    }

    // Namespace wz_duga/wz_duga
    // Params 0, eflags: 0x0
    // Checksum 0xbb89246e, Offset: 0x1400
    // Size: 0x1ca, Type: dev
    function function_b2775b52()
    {
        switch ( self.vehicletype )
        {
            case #"hash_6595f5efe62a4ec":
                return ( 1, 0, 0 );
            case #"hash_17e868e0ebf3c1d6":
                return ( 1, 0, 0 );
            case #"hash_2c0e11a1e87bbcd5":
                return ( 1, 0, 0 );
            case #"hash_dd63f34c77a725e":
            case #"hash_2a245bf3738fed8b":
                return ( 1, 1, 1 );
            case #"veh_mil_ru_fav_heavy":
                return ( 1, 0.5, 0 );
            case #"hash_28d512b739c9d9c1":
                return ( 1, 1, 0 );
            case #"vehicle_t9_mil_fav_light":
                return ( 0, 1, 0 );
            case #"hash_42b91f3544c1a9e1":
                return ( 0, 1, 1 );
            case #"hash_2d32c08b862baa46":
            case #"vehicle_t9_mil_ru_truck_light_player":
            case #"vehicle_t9_civ_ru_sedan_80s_player":
                return ( 0, 1, 1 );
            case #"vehicle_t9_mil_snowmobile":
                return ( 0, 0, 1 );
            case #"vehicle_motorcycle_mil_us_offroad":
                return ( 1, 0, 1 );
            case #"veh_quad_player_wz_tan":
            case #"veh_quad_player_wz_blk":
            case #"hash_232abda4e81275f4":
            case #"hash_2f8d60a5381870ee":
            case #"veh_quad_player_wz_grn":
                return ( 1, 0, 1 );
            default:
                return ( 0, 0, 0 );
        }
    }

    // Namespace wz_duga/wz_duga
    // Params 0, eflags: 0x0
    // Checksum 0xe387abd0, Offset: 0x15d8
    // Size: 0x1dc, Type: dev
    function function_f9492b33()
    {
        if ( !getdvarint( #"hash_31ae3e289b7b921d", 0 ) )
        {
            return;
        }
        
        level flag::wait_till( "<dev string:x38>" );
        
        if ( !isdefined( level.dirtybombs ) )
        {
            return;
        }
        
        while ( getdvarint( #"hash_31ae3e289b7b921d", 0 ) )
        {
            dirtybombs = arraysortclosest( level.dirtybombs, level.players[ 0 ].origin, 32, 0, 100000 );
            
            foreach ( dirtybomb in dirtybombs )
            {
                waitframe( 1 );
                
                if ( !level.players[ 0 ] util::is_player_looking_at( dirtybomb.origin, 0.6, 0 ) )
                {
                    continue;
                }
                
                sphere( dirtybomb.origin, 32, ( 1, 1, 0 ), 1, 0, 8, 2 );
                circle( dirtybomb.origin, 96, ( 1, 1, 0 ), 0, 1, 2 );
            }
        }
    }

    // Namespace wz_duga/wz_duga
    // Params 2, eflags: 0x0
    // Checksum 0xd0068343, Offset: 0x17c0
    // Size: 0xbe, Type: dev
    function function_d72aa67e( str_list, str_name )
    {
        a_str_tok = strtok( str_list, "<dev string:x70>" );
        
        foreach ( tok in a_str_tok )
        {
            if ( tok == str_name )
            {
                return 1;
            }
        }
        
        return 0;
    }

    // Namespace wz_duga/wz_duga
    // Params 4, eflags: 0x0
    // Checksum 0x6948a9ef, Offset: 0x1888
    // Size: 0x314, Type: dev
    function function_47351fa3( org, ang, opcolor, frames )
    {
        if ( !isdefined( frames ) )
        {
            frames = 1;
        }
        
        forward = anglestoforward( ang );
        forwardfar = vectorscale( forward, 50 );
        forwardclose = vectorscale( forward, 50 * 0.8 );
        right = anglestoright( ang );
        left = anglestoright( ang ) * -1;
        leftdraw = vectorscale( right, 50 * -0.2 );
        rightdraw = vectorscale( right, 50 * 0.2 );
        up = anglestoup( ang );
        right = vectorscale( right, 50 );
        left = vectorscale( left, 50 );
        up = vectorscale( up, 50 );
        red = ( 0.9, 0.2, 0.2 );
        green = ( 0.2, 0.9, 0.2 );
        blue = ( 0.2, 0.2, 0.9 );
        
        if ( isdefined( opcolor ) )
        {
            red = opcolor;
            green = opcolor;
            blue = opcolor;
        }
        
        line( org, org + forwardfar, red, 0.9, 0, frames );
        line( org + forwardfar, org + forwardclose + rightdraw, red, 0.9, 0, frames );
        line( org + forwardfar, org + forwardclose + leftdraw, red, 0.9, 0, frames );
        line( org, org + right, blue, 0.9, 0, frames );
        line( org, org + left, blue, 0.9, 0, frames );
        line( org, org + up, green, 0.9, 0, frames );
    }

#/
