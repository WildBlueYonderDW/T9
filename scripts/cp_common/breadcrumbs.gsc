#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;

#namespace breadcrumb;

// Namespace breadcrumb/breadcrumbs
// Params 0, eflags: 0x5
// Checksum 0xd5057d37, Offset: 0x120
// Size: 0x3c
function private autoexec __init__system__()
{
    system::register( #"breadcrumb", &preinit, undefined, undefined, undefined );
}

// Namespace breadcrumb/breadcrumbs
// Params 0, eflags: 0x4
// Checksum 0xe2674bd0, Offset: 0x168
// Size: 0x64
function private preinit()
{
    a_s_breadcrumbs = struct::get_array( "breadcrumb", "variantname" );
    level function_bf078d39( a_s_breadcrumbs );
    
    /#
        level thread function_17a595c8( a_s_breadcrumbs );
    #/
}

// Namespace breadcrumb/breadcrumbs
// Params 1, eflags: 0x0
// Checksum 0xe5e87840, Offset: 0x1d8
// Size: 0x144
function function_61037c6c( kvp )
{
    var_6638ee82 = self function_a307948d( kvp );
    var_a067b105 = var_6638ee82;
    
    while ( isdefined( var_6638ee82 ) )
    {
        var_6638ee82 thread watch_trigger();
        var_6638ee82.b_active = 1;
        var_6638ee82 = struct::get( var_6638ee82.target, "targetname" );
    }
    
    foreach ( e_player in getplayers() )
    {
        var_a067b105 function_c3c3607b( e_player );
    }
    
    callback::on_connect( &function_c3c3607b, var_a067b105 );
}

// Namespace breadcrumb/breadcrumbs
// Params 1, eflags: 0x0
// Checksum 0xaa04f453, Offset: 0x328
// Size: 0x130
function function_e261021e( kvp )
{
    if ( isdefined( mission.var_650ffa70 ) )
    {
        for (var_6638ee82 = function_a307948d( kvp ); isdefined( var_6638ee82 ); var_6638ee82 = struct::get( var_6638ee82.target, "targetname" )) {
            var_6638ee82 notify( #"hash_2b42060dbd562d3b" );
            var_6638ee82.b_active = undefined;
        }
        
        foreach ( e_player in getplayers() )
        {
            objective_setinvisibletoplayer( mission.var_650ffa70[ e_player getentitynumber() ], e_player );
        }
    }
}

// Namespace breadcrumb/breadcrumbs
// Params 1, eflags: 0x0
// Checksum 0x4c85ec76, Offset: 0x460
// Size: 0xfa
function show( e_player )
{
    if ( isdefined( mission.var_650ffa70 ) )
    {
        if ( isdefined( e_player ) )
        {
            a_e_players = array( e_player );
        }
        else
        {
            a_e_players = getplayers();
        }
        
        foreach ( e_player in a_e_players )
        {
            objective_setvisibletoplayer( mission.var_650ffa70[ e_player getentitynumber() ], e_player );
            e_player.var_13f67061 = undefined;
        }
    }
}

// Namespace breadcrumb/breadcrumbs
// Params 1, eflags: 0x0
// Checksum 0x7819c556, Offset: 0x568
// Size: 0xfe
function hide( e_player )
{
    if ( isdefined( mission.var_650ffa70 ) )
    {
        if ( isdefined( e_player ) )
        {
            a_e_players = array( e_player );
        }
        else
        {
            a_e_players = getplayers();
        }
        
        foreach ( e_player in a_e_players )
        {
            objective_setinvisibletoplayer( mission.var_650ffa70[ e_player getentitynumber() ], e_player );
            e_player.var_13f67061 = 1;
        }
    }
}

// Namespace breadcrumb/breadcrumbs
// Params 1, eflags: 0x4
// Checksum 0x4d1c08e6, Offset: 0x670
// Size: 0x12c
function private function_c3c3607b( e_player )
{
    if ( !isdefined( mission.var_650ffa70 ) )
    {
        mission.var_650ffa70 = [];
    }
    
    if ( !isdefined( mission.var_650ffa70[ e_player getentitynumber() ] ) )
    {
        n_obj_id = gameobjects::get_next_obj_id();
        objective_add( n_obj_id, "active", ( 0, 0, 0 ), #"hash_7057d3992f70bf08" );
        function_4339912c( n_obj_id );
        function_29ef32ee( n_obj_id, level.teams[ e_player.team ] );
        objective_setteam( n_obj_id, #"none" );
        mission.var_650ffa70[ e_player getentitynumber() ] = n_obj_id;
    }
    
    self thread function_edc0f84c( e_player );
}

// Namespace breadcrumb/breadcrumbs
// Params 0, eflags: 0x4
// Checksum 0x8a236d0e, Offset: 0x7a8
// Size: 0x370
function private watch_trigger()
{
    if ( isdefined( self.script_breadcrumb_trigger ) )
    {
        trigger = getent( self.script_breadcrumb_trigger, "script_breadcrumb_trigger" );
        self.trigger = trigger;
        assert( !self.trigger trigger::is_trigger_once(), "<dev string:x38>" );
    }
    
    assert( isdefined( trigger ), "<dev string:x65>" + self.origin[ 0 ] + "<dev string:x94>" + self.origin[ 1 ] + "<dev string:x94>" + self.origin[ 2 ] + "<dev string:x9a>" );
    trigger endon( #"death" );
    self endon( #"hash_2b42060dbd562d3b" );
    
    while ( true )
    {
        s_notify = trigger waittill( #"trigger" );
        
        if ( self flag::get( #"radiant_kvp_delay" ) )
        {
            self flag::wait_till_clear( "radiant_kvp_delay" );
            continue;
        }
        else if ( self util::function_74f2b2e9() && is_true( self.var_5531165b ) )
        {
            self.var_5531165b = undefined;
            self util::function_fb80e9ca();
            continue;
        }
        
        if ( isvehicle( s_notify.activator ) && isplayer( s_notify.activator.owner ) )
        {
            e_player = s_notify.activator.owner;
            
            if ( e_player.var_aee65e1f === trigger )
            {
                continue;
            }
        }
        else if ( isplayer( s_notify.activator ) )
        {
            e_player = s_notify.activator;
        }
        else
        {
            continue;
        }
        
        e_player notify( #"hash_4c28ed1cd7ef3917" );
        
        if ( isdefined( e_player.var_aee65e1f ) )
        {
            e_player.var_aee65e1f setvisibletoplayer( e_player );
        }
        
        e_player.var_aee65e1f = trigger;
        trigger setinvisibletoplayer( e_player );
        objective_setinvisibletoplayer( mission.var_650ffa70[ e_player getentitynumber() ], e_player );
        var_2e26ff42 = struct::get( self.target, "targetname" );
        
        if ( isdefined( var_2e26ff42 ) )
        {
            var_2e26ff42 function_edc0f84c( e_player );
        }
    }
}

// Namespace breadcrumb/breadcrumbs
// Params 1, eflags: 0x4
// Checksum 0x401fc305, Offset: 0xb20
// Size: 0x10c
function private function_edc0f84c( e_player )
{
    e_player endon( #"hash_4c28ed1cd7ef3917" );
    
    if ( is_true( self.var_5531165b ) )
    {
        self.var_5531165b = undefined;
        self util::function_fb80e9ca();
    }
    
    self flag::wait_till_clear( "radiant_kvp_delay" );
    n_obj_id = mission.var_650ffa70[ e_player getentitynumber() ];
    objective_setposition( n_obj_id, util::ground_position( self.origin, 200, 54 ) );
    
    if ( !is_true( e_player.var_13f67061 ) )
    {
        objective_setvisibletoplayer( n_obj_id, e_player );
    }
}

// Namespace breadcrumb/breadcrumbs
// Params 1, eflags: 0x4
// Checksum 0x5143b92f, Offset: 0xc38
// Size: 0x190
function private function_bf078d39( a_s_breadcrumbs )
{
    foreach ( var_6638ee82 in a_s_breadcrumbs )
    {
        var_6638ee82.var_5531165b = 1;
        
        if ( isdefined( var_6638ee82.script_flag_true ) )
        {
            var_5b2d2a25 = util::create_flags_and_return_tokens( var_6638ee82.script_flag_true );
            
            /#
                if ( !isdefined( var_6638ee82.var_665aa347 ) )
                {
                    var_6638ee82.var_665aa347 = [];
                }
                
                if ( !isdefined( var_6638ee82.var_665aa347[ #"true" ] ) )
                {
                    var_6638ee82.var_665aa347[ #"true" ] = var_5b2d2a25;
                }
            #/
        }
        
        if ( isdefined( var_6638ee82.script_flag_false ) )
        {
            var_5b2d2a25 = util::create_flags_and_return_tokens( var_6638ee82.script_flag_false );
            
            /#
                if ( !isdefined( var_6638ee82.var_665aa347 ) )
                {
                    var_6638ee82.var_665aa347 = [];
                }
                
                if ( !isdefined( var_6638ee82.var_665aa347[ #"false" ] ) )
                {
                    var_6638ee82.var_665aa347[ #"false" ] = var_5b2d2a25;
                }
            #/
        }
    }
}

// Namespace breadcrumb/breadcrumbs
// Params 1, eflags: 0x4
// Checksum 0x48db6a87, Offset: 0xdd0
// Size: 0xd0
function private function_a307948d( kvp )
{
    if ( isdefined( kvp ) )
    {
        if ( isarray( kvp ) )
        {
            str_value = kvp[ 0 ];
            str_key = kvp[ 1 ];
        }
        else
        {
            str_value = kvp;
            str_key = "targetname";
        }
        
        var_6638ee82 = struct::get( str_value, str_key );
    }
    else
    {
        var_6638ee82 = self;
    }
    
    if ( var_6638ee82.variantname !== "breadcrumb" )
    {
        assertmsg( "<dev string:xa0>" );
    }
    
    return var_6638ee82;
}

/#

    // Namespace breadcrumb/breadcrumbs
    // Params 1, eflags: 0x4
    // Checksum 0xefbdac27, Offset: 0xea8
    // Size: 0x814, Type: dev
    function private function_17a595c8( a_s_breadcrumbs )
    {
        while ( true )
        {
            waitframe( 10 );
            
            if ( !getdvarint( #"hash_1847dfb4f6a40bd6", 0 ) )
            {
                continue;
            }
            
            foreach ( var_6638ee82 in a_s_breadcrumbs )
            {
                var_3f45ff31 = 8;
                
                if ( isdefined( var_6638ee82.target ) )
                {
                    a_s_targets = struct::get_array( var_6638ee82.target, "<dev string:xe7>" );
                }
                
                if ( is_true( var_6638ee82.b_active ) )
                {
                    sphere( var_6638ee82.origin, 8, ( 0, 1, 0 ), 1, 0, 12, 10 );
                    
                    foreach ( s_target in a_s_targets )
                    {
                        line( var_6638ee82.origin, s_target.origin, ( 0, 1, 0 ), 1, 0, 10 );
                    }
                }
                else
                {
                    sphere( var_6638ee82.origin, 6, ( 1, 0.5, 0 ), 0.7, 0, 10, 10 );
                    
                    foreach ( s_target in a_s_targets )
                    {
                        line( var_6638ee82.origin, s_target.origin, ( 1, 0.5, 0 ), 0.7, 0, 10 );
                    }
                }
                
                if ( isdefined( var_6638ee82.targetname ) && !issubstr( var_6638ee82.targetname, "<dev string:xf5>" ) )
                {
                    if ( is_true( var_6638ee82.b_active ) )
                    {
                        print3d( var_6638ee82.origin + ( 0, 0, var_3f45ff31 ), "<dev string:xfd>" + var_6638ee82.targetname, ( 0, 1, 0 ), 1, 0.2, 10 );
                    }
                    else
                    {
                        print3d( var_6638ee82.origin + ( 0, 0, var_3f45ff31 ), "<dev string:xfd>" + var_6638ee82.targetname, ( 1, 0.5, 0 ), 1, 0.2, 10 );
                    }
                    
                    var_3f45ff31 += 4;
                }
                
                if ( isdefined( var_6638ee82.script_flag_true ) )
                {
                    if ( level flag::get_all( var_6638ee82.var_665aa347[ #"true" ] ) )
                    {
                        print3d( var_6638ee82.origin + ( 0, 0, var_3f45ff31 ), "<dev string:x107>" + var_6638ee82.script_flag_true, ( 0, 1, 0 ), 1, 0.2, 10 );
                    }
                    else
                    {
                        print3d( var_6638ee82.origin + ( 0, 0, var_3f45ff31 ), "<dev string:x107>" + var_6638ee82.script_flag_true, ( 1, 0.5, 0 ), 1, 0.2, 10 );
                    }
                    
                    var_3f45ff31 += 4;
                }
                
                if ( isdefined( var_6638ee82.script_flag_false ) )
                {
                    if ( level flag::get_all( var_6638ee82.var_665aa347[ #"false" ] ) )
                    {
                        print3d( var_6638ee82.origin + ( 0, 0, var_3f45ff31 ), "<dev string:x123>" + var_6638ee82.script_flag_false, ( 0, 1, 0 ), 1, 0.2, 10 );
                    }
                    else
                    {
                        print3d( var_6638ee82.origin + ( 0, 0, var_3f45ff31 ), "<dev string:x123>" + var_6638ee82.script_flag_false, ( 1, 0.5, 0 ), 1, 0.2, 10 );
                    }
                    
                    var_3f45ff31 += 4;
                }
                
                if ( isdefined( var_6638ee82.script_delay_min ) && var_6638ee82.script_delay_min > 0 || isdefined( var_6638ee82.script_delay_max ) && var_6638ee82.script_delay_max > 0 )
                {
                    n_min = isdefined( var_6638ee82.script_delay_min ) ? var_6638ee82.script_delay_min : 0;
                    n_max = isdefined( var_6638ee82.script_delay_max ) ? var_6638ee82.script_delay_max : 0;
                    
                    if ( is_true( var_6638ee82.var_5531165b ) )
                    {
                        print3d( var_6638ee82.origin + ( 0, 0, var_3f45ff31 ), "<dev string:x142>" + n_min + "<dev string:x15e>" + n_max, ( 1, 0.5, 0 ), 1, 0.2, 10 );
                        continue;
                    }
                    
                    if ( var_6638ee82 flag::get( #"radiant_kvp_delay" ) && is_true( var_6638ee82.var_653e059d ) )
                    {
                        print3d( var_6638ee82.origin + ( 0, 0, var_3f45ff31 ), "<dev string:x169>" + n_min + "<dev string:x15e>" + n_max, ( 1, 0.5, 0 ), 1, 0.2, 10 );
                        continue;
                    }
                    
                    print3d( var_6638ee82.origin + ( 0, 0, var_3f45ff31 ), "<dev string:x189>" + n_min + "<dev string:x15e>" + n_max, ( 0, 1, 0 ), 1, 0.2, 10 );
                }
            }
        }
    }

#/
