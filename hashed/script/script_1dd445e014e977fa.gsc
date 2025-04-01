#using scripts\core_common\array_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\cp_common\util;

#namespace namespace_82776369;

// Namespace namespace_82776369/namespace_82776369
// Params 0, eflags: 0x5
// Checksum 0x8a6c6ad2, Offset: 0xe8
// Size: 0x3c
function private autoexec __init__system__()
{
    system::register( #"hash_3e7f5d2ba46fa7a0", undefined, &init_postload, undefined, undefined );
}

// Namespace namespace_82776369/namespace_82776369
// Params 0, eflags: 0x4
// Checksum 0xad787905, Offset: 0x130
// Size: 0x74
function private init_postload()
{
    var_a5353dea = struct::get_array( "land_mine_cp", "targetname" );
    level flag::wait_till( "all_players_connected" );
    
    if ( isdefined( var_a5353dea ) )
    {
        array::thread_all( var_a5353dea, &land_mine_cp );
    }
}

// Namespace namespace_82776369/namespace_82776369
// Params 0, eflags: 0x0
// Checksum 0xb790f016, Offset: 0x1b0
// Size: 0x33c
function land_mine_cp()
{
    level.player endon( #"death" );
    self.var_fc475b39 = getentarray( self.target, "targetname" );
    self.var_fc475b39 = arraysortclosest( self.var_fc475b39, self.origin );
    self.var_fb08c03f = 3;
    land_mine = getweapon( #"land_mine_cp" );
    
    while ( true )
    {
        self util::create_cursor_hint( undefined, undefined, #"hash_6f9a32701165215c", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1, &function_1e7b2bf );
        self waittill( #"trigger" );
        
        if ( !level.player hasweapon( land_mine ) )
        {
            frag = getweapon( #"frag_grenade" );
            
            if ( level.player hasweapon( frag ) )
            {
                level.player takeweapon( frag );
            }
            
            level.player giveweapon( land_mine );
            level.player setweaponammostock( land_mine, 0 );
        }
        
        current_stock = level.player getweaponammostock( land_mine );
        var_5010b9b3 = land_mine.maxammo - current_stock;
        var_aa43b095 = math::clamp( var_5010b9b3, var_5010b9b3, self.var_fb08c03f );
        i = var_aa43b095;
        level.player setweaponammostock( land_mine, current_stock + var_aa43b095 );
        
        foreach ( script_model in self.var_fc475b39 )
        {
            if ( isdefined( script_model ) )
            {
                script_model delete();
                i--;
                
                if ( i <= 0 )
                {
                    break;
                }
            }
        }
        
        self.var_fb08c03f -= var_aa43b095;
        
        if ( self.var_fb08c03f <= 0 )
        {
            break;
        }
        
        wait 0.5;
    }
}

// Namespace namespace_82776369/namespace_82776369
// Params 0, eflags: 0x0
// Checksum 0x945b468c, Offset: 0x4f8
// Size: 0x90, Type: bool
function function_1e7b2bf()
{
    land_mine = getweapon( #"land_mine_cp" );
    
    if ( level.player hasweapon( land_mine ) )
    {
        var_fdcec5a3 = level.player getweaponammostock( land_mine );
        
        if ( var_fdcec5a3 >= land_mine.maxammo )
        {
            return false;
        }
    }
    
    return true;
}

